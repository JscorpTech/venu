<?php

namespace App\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use Illuminate\Support\Env;
use Illuminate\Support\Facades\Log;

class TelegramServices
{
    public string $token;
    public Client $client;
    public function __construct(string|null $token = null)
    {
        if ($token == null) {
            $this->token = Env::get("BOT_TOKEN");
        } else {
            $this->token = $token;
        }
        $this->client = new Client();
    }

    public function request($method, $params)
    {
        try {
            $response = $this->client->request("POST", "https://api.telegram.org/bot" . $this->token . "/" . $method, [
                'form_params' => $params,
            ]);
            return json_decode($response->getBody()->getContents(), true);
        } catch (ClientException $e) {
            Log::error($e->getMessage());
        }
    }

    public function send_message($chat_id, string $message)
    {
        $this->request("sendMessage", ['chat_id' => $chat_id, "text" => $message, "parse_mode" => "html"]);
    }
}
