<?php

namespace App\Http\Controllers\Payment_Methods;

use App\Http\Controllers\Controller;
use App\Models\AtmosTransaction;
use App\Models\Cart;
use App\Models\PaymentRequest;
use App\Models\ShippingAddress;
use App\Models\User;
use App\Services\AtmosService;
use App\Services\ClickService;
use App\Traits\Processor;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use JscorpTech\Payme\Models\Order;

class AtmosController extends Controller
{
    use Processor;

    private PaymentRequest $payment;
    private $config;
    private $user;

    public function __construct(PaymentRequest $paymentRequest, User $user)
    {
        $config = $this->payment_config('payme', 'payment_config');
        if (!is_null($config) && $config->mode == 'live') {
            $this->config = json_decode($config->live_values);
        } elseif (!is_null($config) && $config->mode == 'test') {
            $this->config = json_decode($config->test_values);
        }
        $this->payment = $paymentRequest;
        $this->user = $user;
    }


    public function pay(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'payment_id' => 'required|uuid'
        ]);

        if ($validator->fails()) {
            return response()->json($this->response_formatter(GATEWAYS_DEFAULT_400, null, $this->error_processor($validator)), 400);
        }

        $payment = $this->payment::where(['id' => $request['payment_id']])->where(['is_paid' => 0])->first();


        $data = json_decode($payment->additional_data);
        $address = ShippingAddress::query()->find($data->address_id);
        $delivery_price = carts_delivery_price($address->delivery_method, $data->customer_id, $address->longitude, $address->latitude, $address->district_id);
        $amount =  (currencyConverter((int)$payment->payment_amount, "uzs")
            + $delivery_price) * 100;

        $payment->attr_id = PaymentRequest::max("attr_id") + 1;
        $payment->save();
        if (!isset($payment)) {
            return response()->json($this->response_formatter(GATEWAYS_DEFAULT_204), 200);
        }
        $service = new AtmosService();
        $data = json_decode($payment->additional_data);
        $carts = Cart::where(['customer_id' => $data->customer_id, 'is_checked' => 1])->get();
        $items = [];
        foreach ($carts as $cart) {
            $product = $cart->product;
            $items[] = ['ofd_code' => $product->mxik, 'name' => $product->name,  'amount' => $amount];
        }



        $trans_id = $service->create_ofd($amount, $payment->attr_id, $items)['transaction_id'];
        AtmosTransaction::query()->create([
            "order_id" => $payment->attr_id,
            "amount" => $amount,
            "trans_id" => $trans_id,
        ]);
        return redirect($service->generate_link($trans_id));
    }


    public function webhook(Request $request)
    {
        /* dd($request->ip()); */
        Log::info("Atmos webhook: " . $request->ip());
        $payment = $this->payment::query()->where(['attr_id' => $request->input("invoice")]);
        if (!$payment->exists()) {
            return response()->json([
                "status" => 0,
                "message" => "payment not found",
            ]);
        }
        try {
            $payment = $payment->first();
            $payment->is_paid = 1;
            $payment->save();
            call_user_func($payment->success_hook, $payment);
        } catch (Exception $e) {
            return response()->json([
                "status" => 0,
                "message" => "invalid error",
            ]);
        }
        return response()->json([
            "status" => 1,
            "message" => "ok",
        ]);
    }
}
