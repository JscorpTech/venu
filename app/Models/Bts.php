<?php

namespace App\Models;

use App\Enums\BtsOrderStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bts extends Model
{
    use HasFactory;

    public $fillable = [
        'bts_order_id',
        'order_id',
        "status",
    ];
    public $casts = [
        "status"=>BtsOrderStatus::class,
    ];
}
