<?php

namespace App\Http\Controllers\Payment_Methods;

use App\Models\Cart;
use App\Models\PaymentRequest;
use Illuminate\Support\Facades\Log;
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
        $vat_percent = 0;
        foreach ($carts as $cart) {
            $product = $cart->product;
            $vat_percent = $product->seller->vat_percent;
            $items[] = [
                "title" => $cart->name,
                "price" => currencyConverter($cart->price, "uzs") * 100,
                "count" => $cart->quantity,
                "code" => $product->mxik,
                "package_code" => $product->package_code,
                "vat_percent" => $vat_percent,
            ];
        }
        $items[] = [
            "title" => "yetkazib berish",
            "price" => $payment_request->delivery_price * 100,
            "count" => 1,
            "code" => 10112006002000000,
            "package_code" => 1209779,
            "vat_percent" => $vat_percent,
        ];
        return $this->success(["allow" => true, "detail" => [
            "receipt_type" => 0,
            "items" => $items,
        ]]);
    }
}
