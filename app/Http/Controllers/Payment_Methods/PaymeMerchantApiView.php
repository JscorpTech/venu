<?php

namespace App\Http\Controllers\Payment_Methods;

use App\Models\Cart;
use App\Models\Order;
use App\Models\PaymentRequest;
use JscorpTech\Payme\Enums\ErrorEnum;
use JscorpTech\Payme\Exceptions\PaymeException;
use JscorpTech\Payme\Views\PaymeApiView;

class PaymeMerchantApiView extends PaymeApiView
{
    public function CheckPerformTransaction()
    {
        $this->merchant->validateParams($this->request_id, $this->params);
        $order = $this->order::query()->where(['id' => $this->params['account'][$this->field]]);
        if (!$order->exists() or $order->first()->state) {
            throw new PaymeException($this->request_id, "Order not found", ErrorEnum::INVALID_ACCOUNT);
        }
        $payment_request = PaymentRequest::query()->where(['order_id' => $order->first()->id]);
        if (!$payment_request->exists()) {
            return [
                "allow" => false,
            ];
        }
        $payment_request = $payment_request->first();
        $data = json_decode($payment_request->additional_data);
        $carts = Cart::where(['customer_id' => $data->customer_id, 'is_checked' => 1])->get();
        $items = [];
        foreach ($carts as $cart) {
            $items[] = [
                "title" => $cart->name,
                "price" => $cart->price * 100,
                "count" => $cart->quantity,
                "code" => $cart->product->mxik,
                "package_code" => $cart->product->package_code,
                "vat_percent" => 0,
            ];
        }
        return $this->success(["allow" => true, "detail" => [
            "receipt_type" => 0,
            "items" => $items,
        ]]);
    }
}
