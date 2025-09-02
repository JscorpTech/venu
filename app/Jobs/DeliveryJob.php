<?php

namespace App\Jobs;

use App\Models\Delivery;
use App\Services\YandexService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class DeliveryJob implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    public $delivery;

    /**
     * Create a new job instance.
     */
    public function __construct($delivery)
    {
        $this->delivery = $delivery;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $service =  new YandexService();
        if ($this->delivery->delivery_method == "yandex") {
            sleep(10);
            $service->confirm($this->delivery->courier_order_id);
        }
    }
}
