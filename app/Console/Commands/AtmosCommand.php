<?php

namespace App\Console\Commands;

use App\Services\AtmosService;
use App\Services\BtsService;
use Illuminate\Console\Command;

class AtmosCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'atmos';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $service = new AtmosService();
        /* dd($service->token(false)); */
        dd($service->generate_link($service->create_ofd(10000, 1, [])['transaction_id']));
    }
}
