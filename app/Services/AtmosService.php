<?php

namespace App\Services;

use Exception;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\HandlerStack;
use GuzzleHttp\Middleware;
use Illuminate\Support\Env;
use Illuminate\Support\Facades\Redis;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

/**
 * Atmos payment service
 * O'zbekiston payment system
 * @author Azamov Samandar <admin@jscorp.uz>
 */
class AtmosService
{
    public Client $client;
    public string $base_uri = "https://partner.atmos.uz";
    private string $proxy = "socks5h://127.0.0.1:10080";
    private string $key;
    private string $secret;
    private string|null $token = null;
    private string $store_id;
    public string $payment_url;
    public array $options;
    public string $redirect_link;
    public $cache_key = "atmos_token";
    public string $env = "prod";

    public function __construct(array $options = [])
    {
        $this->options = array_merge([
            "lang" => "uz",
        ], $options);
        $this->key = Env::get("ATMOS_KEY");
        $this->secret = Env::get("ATMOS_SECRET");
        $this->store_id = Env::get("ATMOS_STORE_ID");
        $this->payment_url = Env::get("ATMOS_PAYMENT_URL");
        $this->env = Env::get("ATMOS_ENV", "prod");
        $stack = HandlerStack::create();
        $stack->push(Middleware::mapRequest(function ($request) {
            if ($this->token != null && $request->getHeaderLine("skip-auth") != '1') {
                return $request->withHeader("Authorization", "Bearer " . $this->token);
            }
            return $request;
        }));
        $stack->push(Middleware::retry(function ($retries, RequestInterface $request, ResponseInterface|null $response = null, $exception = null) {
            if ($retries > 5) {
                return false;
            }
            if ($request->getUri()->getPath() == "/token") {
                return false;
            }
            if ($response->getStatusCode() == 401) {
                $this->token = $this->token(false);
                return true;
            }
            return false;
        }), 1000);
        $this->redirect_link = Env::get("ATMOS_REDIRECT_LINK", route("account-oder"));
        $this->client = new Client([
            "base_uri" => $this->base_uri,
            "proxy" => $this->env == "prod" ? null : $this->proxy,
            "handler" => $stack,
        ]);
        $this->token = $this->token(false);
    }

    /**
     * HTTP so'rov yuboradi
     * 401 status qaytsa token olib qayta so'rov yuboradi
     * qayta urinishlar soni 3
     */
    public function request(string $method, string $url, $options = [])
    {
        try {
            $response = $this->client->request($method, $url, $options, );
            return json_decode($response->getBody()->getContents(), true);
        } catch (ClientException $e) {
            if (!$e->hasResponse()) {
                throw $e;
            }
            throw $e;
        }
    }


    public function token(bool $cache = true)
    {
        try {
            if ($cache) {
                $token = Redis::get($this->cache_key);
                if ($token != null) {
                    return $token;
                }
            }
            $response = $this->request("POST", "/token", [
                "form_params" => ["grant_type" => "client_credentials"],
                "headers" => [
                    "skip-auth" => '1',
                    "Authorization" => "Basic " . base64_encode($this->key . ":" . $this->secret),
                ]
            ]);
            $token = $response['access_token'];
            Redis::set($this->cache_key, $token);
            return $token;
        } catch (ClientException $e) {
            dd($e->getResponse()->getBody()->getContents());
        }
    }


    /**
     * Fiscalization bilan transaction yaratadi
     * @param array $ofd_items OFD items example: [['ofd_code'=>'xxxxxx', 'name'=>'????', 'amount'=>1000]]
     */
    public function create_ofd(int $amount, string $account, array $ofd_items = [])
    {
        /* Example url: https://test-checkout.pays.uz/invoice/get?storeId=1111&transactionId=222222&redirectLink=http://site.com */
        try {
            $response = $this->request("POST", "/merchant/pay/create/checkout-ofd/", [
                "json" => [
                    "amount" => $amount,
                    "account" => $account,
                    "store_id" => $this->store_id,
                    "lang" => $this->options['lang'] ?? "uz",
                    "ofd_items" => $ofd_items,
                ]
            ]);
            if ($response == null) {
                throw new \Exception("Nomalum xatolik yuz berdi");
            }
            if ($response['result']['code'] != "OK") {
                throw new \Exception($response['result']['description']);
            }
            return $response;
        } catch (ClientException $e) {
            if (!$e->hasResponse()) {
                throw $e;
            }
            $response =  json_decode($e->getResponse()->getBody()->getContents());
            if ($response['result']['code'] != "OK") {
                throw new \Exception($response['result']['description']);
            }
        }
    }

    /**
     * To'lov link yaratadi
     */
    public function generate_link(int $transaction_id)
    {
        return $this->payment_url . "?storeId=$this->store_id&transactionId=$transaction_id&redirectLink=$this->redirect_link";
    }
}
