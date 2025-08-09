<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class() extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table("shops", function (Blueprint $table) {
            $table->string("long");
            $table->string("lat");
            $table->foreignId("region_id")->nullable()->constrained()->nullOnDelete();
            $table->foreignId("district_id")->nullable()->constrained()->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table("shops", function (Blueprint $table) {
            $table->dropColumn("long");
            $table->dropColumn("lat");
            $table->dropForeign("region_id");
            $table->dropForeign("district_id");
            $table->dropColumn("region_id");
            $table->dropColumn("district_id");
        });
    }
};
