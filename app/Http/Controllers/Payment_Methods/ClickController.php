<?php

namespace App\Http\Controllers\Payment_Methods;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequest;
use App\Models\User;
use App\Services\ClickService;
use App\Traits\Processor;
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
        $amount =  (int)$payment->payment_amount * 100;
        $payment->attr_id = PaymentRequest::max("attr_id") + 1;
        $payment->save();
        if (!isset($payment)) {
            return response()->json($this->response_formatter(GATEWAYS_DEFAULT_204), 200);
        }
        $service = new ClickService();
        return redirect($service->generate_link($amount, $payment->attr_id));
    }


    public function webhook(Request $request)
    {
        return response()->json([
            "detail" => "ok",
        ]);
    }
}
