<?php

namespace App\Services;

use App\Models\Cart;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Env;
use Illuminate\Support\Facades\Log;

/**
 * Click payment service
 * @author Azamov Samandar <admin@jscorp.uz>
 */
class ClickService
{
    public $merchant_id;
    public $base_url;
    public $service_id;
    public Client $client;

    public function __construct()
    {
        $this->merchant_id = Env::get("CLICK_ID");
        $this->service_id = Env::get("CLICK_SERVICE_ID");
        $this->base_url = Env::get("CLICK_URL");
        if ($this->merchant_id == null or $this->base_url == null) {
            throw new Exception("click uchun kerakli malumotlar topilmadi");
        }
        $this->client = new Client();
    }

    public function generate_link($amount, $id)
    {
        /* https://my.click.uz/services/pay?service_id={service_id}&merchant_id={merchant_id}&amount={amount}&transaction_param={transaction_param}&return_url={return_url}&card_type={card_type} */
        $payload = "?service_id=$this->service_id&merchant_id=$this->merchant_id&amount=$amount&transaction_param=$id";
        return $this->base_url . $payload;
    }


    /**
     * Clickga sotilgan maxsulot haqida ofd yuboradi
     * @param array $items OFD items example: [
     *     [
     *     'name'=>'????', 'spic'=>'xxxxxx',
     *     'units'=>121, 'package_code'=>'xxxxx',
     *     'price'=>1000, 'amount'=>100,
     *     'vat'=>'12121','commission_info'=>[
     *             'tin'=>121,'pinfl'=>111
     *          ]
     *     ]
     *  ]
     */
    public function send_ofd($payment, $click_id)
    {
        $data = json_decode($payment->additional_data);
        $carts = Cart::where(['customer_id' => $data->customer_id, 'is_checked' => 1])->get();
        $items = [];
        $vat_percent = 0;
        foreach ($carts as $cart) {
            $product = $cart->product;
            $vat_percent = $product->seller->vat_percent;
            $amount = currencyConverter($cart->price, "uzs") * 100;
            $items[] = [
                "name" => $cart->name,
                "price" => $amount,
                "count" => $cart->quantity,
                "spic" => $product->mxik,
                "package_code" => $product->package_code,
                "vat_percent" => $vat_percent,
                "vat" => $amount / 100 * (int) $vat_percent,
            ];
        }
        $items[] = [
            "name" => "yetkazib berish",
            "price" => $payment->delivery_price,
            "count" => 1,
            "spic" => 10107002001000000,
            "package_code" => 1209885,
            "vat_percent" => $vat_percent,
            "vat" => $payment->delivery_price / 100 * (int) $vat_percent,
        ];

        $payload = [
            "service_id" => $this->service_id,
            "payment_id" => $click_id,
            "items" => $items,
        ];
        $response = $this->client->request("POST", "https://api.click.uz/v2/merchant/payment/ofd_data/submit_items", [
            "json" => $payload,
        ]);
        $data = json_decode($response->getBody()->getContents());
        Log::info($data);
    }
}
