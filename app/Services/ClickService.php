<?php

namespace App\Services;

use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Env;

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
    public function send_ofd($payment_id, array $items)
    {
        $payload = [
            "service_id" => $this->service_id,
            "payment_id" => $payment_id,
            "items" => $items,
        ];
        $response = $this->client->request("POST", "https://api.click.uz/v2/merchant/payment/ofd_data/submit_items", [
            "json" => $payload,
        ]);
        $data = json_decode($response->getBody()->getContents());
        dd($data);
    }
}
