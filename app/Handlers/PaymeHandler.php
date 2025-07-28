<?php

namespace App\Handlers;

use Illuminate\Support\Facades\Log;
use App\Models\PaymentRequest;

class PaymeHandler
{
    /**
     * To'lov muvofaqiyatli yakunlanganda
     */
    public static function success($data = null)
    {
        $payments = PaymentRequest::query()->where(["order_id" => $data->order_id]);
        if (!$payments->exists()) {
            Log::error("order not found");
        }
        $payment_instance = $payments->first();
        $payment_instance->is_paid = 1;
        $payment_instance->save();
        call_user_func($payment_instance->success_hook, $payment_instance);
        Log::info("To'lov muvofaqiyatli yakunlandi: " . $data->order_id);
    }

    /**
     * To'lov bekor qilinganda
     */
    public static function cancel($data = null)
    {

        $payments = PaymentRequest::query()->where(["order_id" => $data->order_id]);
        if (!$payments->exists()) {
            Log::error("order not found");
        }
        $payment_instance = $payments->first();
        call_user_func($payment_instance->failure_hook, $payment_instance);
        Log::info("To'lov bekor qilindi: " . $data->order_id);
    }
}
