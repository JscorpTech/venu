<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('atmos_transactions', function (Blueprint $table) {
            $table->id();
            $table->bigInteger("payment_id");
            $table->string("trans_id");
            $table->string("amount");
            $table->string("status")->default("created");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('atmos_transactions');
    }
};
