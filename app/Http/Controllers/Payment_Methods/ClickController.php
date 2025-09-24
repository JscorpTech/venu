<?php

namespace App\Http\Controllers\Payment_Methods;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequest;
use App\Models\ShippingAddress;
use App\Models\User;
use App\Services\ClickService;
use App\Traits\Processor;
use App\Utils\Helpers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ClickController extends Controller
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
        $amount =  (currencyConverter(Helpers::convert_currency_to_usd($payment->payment_amount), "uzs")
            + $delivery_price);


        $payment->attr_id = PaymentRequest::max("attr_id") + 1;
        $payment->delivery_price = $delivery_price;
        $payment->save();
        if (!isset($payment)) {
            return response()->json($this->response_formatter(GATEWAYS_DEFAULT_204), 200);
        }
        $service = new ClickService();
        return redirect($service->generate_link($amount, $payment->attr_id));
    }


    public function webhook(Request $request)
    {
        $action = $request->input("action", 0);
        $error = $request->input("error", 1);

        if ($action == '0') {
            return response()->json([
                "error" => $error,
                "click_trans_id" => $request->input("click_trans_id"),
                "merchant_trans_id" => $request->input("merchant_trans_id"),
                "merchant_prepare_id" => $request->input("click_paydoc_id", random_int(1000000000, 9999999999)),
                "error_note" => "Success",
            ]);
        }
        if ($action == '1') {
            if ($error == '0') {
                $payment = $this->payment::query()->where(['attr_id' => $request->input("merchant_trans_id")]);
                $payment = $payment->first();
                $payment->is_paid = 1;
                $payment->save();
                $service = new ClickService();
                $service->send_ofd($payment, $request->input("click_paydoc_id"));
                call_user_func($payment->success_hook, $payment);
                return response()->json([
                    "error" => $error,
                    "click_trans_id" => $request->input("click_trans_id"),
                    "merchant_trans_id" => $request->input("merchant_trans_id"),
                    "error_note" => "Success",
                ]);
            }
            return response()->json([
                "error" => $error,
                "click_trans_id" => $request->input("click_trans_id"),
                "merchant_trans_id" => $request->input("merchant_trans_id"),
                "error_note" => "Error",
            ]);
        }
    }
}
