<?php

namespace App\Console\Commands;

use App\Services\BtsService;
use Illuminate\Console\Command;

class BtsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'bts';

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
        $service = new BtsService();
        $service->create_order(1, 'test', 1, 9, 1, 'test', 'test', 1, 'test', []);
    }
}
