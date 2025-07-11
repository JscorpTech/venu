<?php

namespace App\Listeners;

use App\Events\OrderStatusEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class OrderDeliveryListener
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(OrderStatusEvent $event): void
    {
        if ($event->type == "delivery_man") {
            $order = $event->order;
            $deliveryMan = $order->deliveryMan;
            dd($deliveryMan);
        }
    }
}
