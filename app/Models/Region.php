<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    use HasFactory;


    public $fillable = [
        "name",
        "code",
        "yandex",
        "bts",
        "free",
    ];

    public $casts = [
        "yandex" => "boolean",
        "bts" => "boolean",
        "free" => "boolean",
    ];
}
