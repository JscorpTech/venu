<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AtmosTransaction extends Model
{
    use HasFactory;


    public $fillable = [
        "payment_id",
        "trans_id",
        "amount",
        "status",
    ];
}
