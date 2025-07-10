<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redis;

class BtsService
{
    private string $username;
    private string $password;
    private string $inn;
    private string $base_url;
    private string|null $token = null;
    private int $is_test;

    public function __construct()
    {
        $this->username = env('BTS_USERNAME');
        $this->password = env('BTS_PASSWORD');
        $this->inn = env('BTS_INN');
        $this->base_url = env('BTS_URL');
        $this->is_test = env("BTS_TEST") ?? 1;
        if ($this->token === null) {
            $this->token = $this->get_token();
        }
    }

    public function request($method, $url, $params = [], $retry = true)
    {
        $response = Http::withToken($this->token)->$method($this->base_url . "?r=" . $url, $params);
        if ($response->status() == 400 && $retry) {
            $this->token = $this->get_token(true);
            return $this->request($method, $url, $params, false);
        }
        return $response->json();
    }

    public function get_token($is_force = false)
    {
        if ($is_force === false && Redis::exists("bts:token")) {
            return Redis::get("bts:token");
        }
        $response = Http::post($this->base_url . '?r=v1/auth/get-token', [
            'username' => $this->username,
            "password" => $this->password,
            "inn" => $this->inn,
        ]);
        if ($response->status() != 200) {
            throw new \Exception("BTS api error");
        }
        $data = $response->json();
        if (!isset($data['data']['token'])) {
            throw new \Exception("BTS api error");
        }
        $token =  $data['data']['token'];
        if ($token === null) {
            throw new \Exception("BTS api error");
        }
        Redis::set("bts:token", $token);
        return $token;
    }

    public function create_order(int $senderCityId, string $senderAddress, float $weight, int $packageId, int $postTypeId, string $receiver, string $receiverAddress, int $receiverCityId, string $receiverPhone, array $options)
    {
        $payload = [
            "senderCityId" => $senderCityId,
            "senderAddress" => $senderAddress,
            "senderReal" => "VENU",
            "senderPhone" => "+998999999999",
            "weight" => $weight,
            "packageId" => $packageId,
            "postTypeId" => $postTypeId,
            "receiver" => $receiver,
            "receiverAddress" => $receiverAddress,
            "receiverCityId" => $receiverCityId,
            "receiverPhone" => $receiverPhone,
            "is_test" => $this->is_test,
            ...$options
        ];
        $response = $this->request("post", "v1/order/add", $payload);
        dd($response);
    }
}



// {
//     "orderId": 1,
//     "wcs_code": "900001",
//     "senderDelivery": 1,
//     "senderCityId": 3,
//     "senderAddress": "Toshkent sh., Bobur ko‘chasi, 5-A",
//     "senderReal": "Jurabek Turdiyev",
//     "senderPhone": "+998 99 1234567",
//     "weight": 2,
//     "packageId": 4,
//     "postTypeId": 16,
//     "is_test": 1,
//     "postTypes": [
//         {
//             "name": "Kitob",
//             "code": "ZFD21AD",
//             "count": 1,
//             "cost": 10000
//         },
//         {
//             "name": "Daftar",
//             "code": "AV2321",
//             "count": 2,
//             "cost": 20000
//         }
//     ],
//     "receiverDelivery": 1,
//     "receiver": "Odil Ahkmedov",
//     "receiverCityId": 3,
//     "receiverAddress": "Gozovo qish. 41 uy",
//     "volume": 0,
//     "takePhoto": 1,
//     "piece": 1,
//     "senderDate": "2018-02-06",
//     "receiverDate": "2018-02-07",
//     "receiverPhone": "+998 99 1234567",
//     "receiverPhone1": null,
//     "options": [
//         {
//             "optionId": 2,
//             "goods": [
//                 {
//                     "mxikGoodsId": 71,
//                     "amount": 1,
//                     "goodPrice": 700000
//                 },
//                 {
//                     "mxikGoodsId": 72,
//                     "amount": 1,
//                     "goodPrice": 100000
//                 }
//             ]
//         }
//     ]
// }