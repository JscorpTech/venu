<?php

namespace App\Listeners;

use App\Events\OrderStatusEvent;
use App\Services\BtsService;

class OrderDeliveryListener
{
    public int $senderCityID;
    public string $senderAddress;
    public int $weigh;
    public int $packageID;
    public int $postTypeID;
    public string $receiver;
    public string $receiverAddress;
    public string $receiverCityId;
    public string $receiverPhone;
    public array $option;
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        $this->weigh = 1;
        $this->packageID = 5;
        $this->postTypeID = 1;
        $this->receiverCityId = 1;
        $this->senderCityID = 1;
    }


    /**
     * Handle the event.
     */
    public function handle(OrderStatusEvent $event): void
    {
        if ($event->type == "delivery_man") {
            $order = $event->order;
            $receiver = $order->shippingAddress;
            $shop = $order->sellerName->product->seller->shop;

            $this->receiverAddress = $receiver->address;
            $this->receiverPhone = $receiver->phone;
            $this->receiver = $receiver->contact_person_name;
            $this->senderAddress = $shop->address;
            /* $this->receiverCityId = $receiver->city; */
            /* $this->senderCityID = $shop->cityID; */


            $deliveryMan = $order->deliveryMan;
            if ($deliveryMan->f_name != "BTS") {
                return;
            }

            $service = new BtsService();
            $order_instance = $service->create_order(
                $order->id,
                $this->senderCityID,
                $this->senderAddress,
                $this->weigh,
                $this->packageID,
                $this->postTypeID,
                $this->receiver,
                $this->receiverAddress,
                $this->receiverCityId,
                $this->receiverPhone
            );
        }
    }
}
