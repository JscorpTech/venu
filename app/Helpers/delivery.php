<?php

use App\Models\Cart;
use App\Models\District;
use App\Services\BtsService;
use App\Services\YandexService;

if (!function_exists('carts_delivery_price')) {
    function carts_delivery_price($delivery_method, $customer_id, $long, $lat, $district_id = null)
    {
        $carts = Cart::where(['customer_id' => $customer_id, 'is_checked' => 1])->get();
        if (count($carts) <= 0) {
            throw new \Exception("cart mavjud emas");
        }
        $shop = $carts[0]->product->seller->shop;

        if ($delivery_method == "yandex") {
            foreach ($carts as $cart) {
                $product = $cart->product;
                $items[] = [
                    "cost_currency" => "UZS",
                    "cost_value" => (string) $product->unit_price,
                    "droppof_point" => 2,
                    "pickup_point" => 1,
                    "quantity" => $cart->quantity,
                    "title" => $product->name,
                    "size" => [
                        "height" =>  (float) $product->height / 100,
                        "width" => (float) $product->width / 100,
                        "length" => (float) $product->length / 100,
                    ],
                    "weight" => (float) $product->weight / 1000,
                ];
            }
            $yandex = new YandexService();
            $price = (int)$yandex->canculate($shop->long, $shop->lat, $long, $lat, $items)->price;
            return ($price / 100) * 5 + $price;
        } elseif ($delivery_method == "bts") {
            $weight = 0;
            foreach ($carts as $cart) {
                $weight += $cart->product->weight * $cart->quantity;
            }
            $bts = new BtsService();
            $price = (int) $bts->calculate($shop->district->code, District::query()->find($district_id)->code, $weight / 1000)['summaryPrice'];
            return ($price / 100) * 5 + $price;
        } else {
            return 0;
        }
    }
}
