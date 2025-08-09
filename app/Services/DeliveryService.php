<?php

namespace App\Services;

class DeliveryService
{
    public YandexService $yandex;

    public function __construct()
    {
        $this->yandex = new YandexService();
    }

    public function is_tashkent($sender_long, $sernder_lat, $receive_long, $receive_lat): bool
    {
        $response = $this->yandex->canculate("", $sender_long, $sernder_lat, "", $receive_long, $receive_lat);
        dd($response);
        return false;
    }
}
