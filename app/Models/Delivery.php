<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    use HasFactory;

    public $fillable = [
        "order_id",
        "delivery_method",
        "price",
        "zone_id",
        "status",
        "courier_order_id",
    ];


    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
