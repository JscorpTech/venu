<?php

namespace App\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Support\Env;
use Ramsey\Uuid\Uuid;

class YandexService
{
    public $client;
    public string $base_url;
    private string $token;
    public string $request_id;
    public string $currency;

    public function __construct(string|int|null $request_id = null, string $currency = "UZS", ?string $base_url = null)
    {
        if ($request_id == null) {
            $this->request_id = Uuid::uuid4();
        }
        $this->token = Env::get("YANDEX_TOKEN");
        $this->currency = $currency;
        if ($base_url == null) {
            $this->base_url = "https://b2b.taxi.yandex.net/b2b/cargo/integration/v2/";
        }
        $this->client = new Client([
            "base_uri" => $this->base_url,
            "headers" => [
                "Authorization" => "Bearer " . $this->token,
                "Accept-Language" => "uz",
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
            ]
        ]);
    }


    public function confirm(string $id)
    {
        $response = $this->client->request("POST", "claims/accept?claim_id=" . $id, [
            "json" => [
                "version" => 1,
            ]
        ]);
        return json_decode($response->getBody());
    }


    public function info(string $id)
    {
        $response = $this->client->request("POST", "claims/info?claim_id=" . $id, [
            "json" => [],
        ]);
        return json_decode($response->getBody());
    }



    public function create(
        array $items,
        string $sender_name,
        string $sender_phone,
        string $receive_name,
        string $receive_phone,
        string $sender_address_name,
        float $sender_adddress_long,
        float $sender_adddress_lat,
        string $receive_address_name,
        float $receive_adddress_long,
        float $receive_adddress_lat,
    ) {
        $payload = [
            "items" => $items,
            "route_points" => [
                [
                    'id' => 1,
                    "point_id" => 1,
                    "type" => "source",
                    "visit_order" => 1,
                    "contact" => [
                        "name" => $sender_name,
                        "phone" => $sender_phone,
                    ],
                    "address" => [
                        'coordinates' => [$sender_adddress_long, $sender_adddress_lat],
                        'fullname' => $sender_address_name,
                    ],
                ],
                [
                    'id' => 2,
                    "point_id" => 2,
                    "type" => "destination",
                    "visit_order" => 2,
                    "contact" => [
                        "name" => $receive_name,
                        "phone" => $receive_phone,
                    ],
                    "address" => [
                        'coordinates' => [$receive_adddress_long, $receive_adddress_lat],
                        'fullname' => $receive_address_name,
                    ],
                ],
            ],
        ];
        $response = $this->client->request("POST", "claims/create?request_id=" . $this->request_id, [
            "json" => $payload,
        ]);
        return json_decode($response->getBody());
    }

    /**
     * Narxni hisoblash
     */
    public function canculate(
        float $sender_adddress_long,
        float $sender_adddress_lat,
        float $receive_adddress_long,
        float $receive_adddress_lat,
    ) {
        $payload = [
            "route_points" => [
                [
                    'id' => 1,
                    'coordinates' => [$sender_adddress_long, $sender_adddress_lat],
                ],
                [
                    'id' => 2,
                    'coordinates' => [$receive_adddress_long, $receive_adddress_lat],
                ],
            ],
        ];

        try {

            $response = $this->client->request("POST", "check-price", [
                "json" => $payload,
            ]);
            return json_decode($response->getBody());
        } catch (RequestException $e) {
            if ($e->hasResponse()) {
                $response =  $e->getResponse();
                throw new \Exception(json_decode($response->getBody()->getContents())->message);
            }
            dd($e);
        }
    }
}
