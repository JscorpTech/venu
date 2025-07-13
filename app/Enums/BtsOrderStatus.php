<?php

namespace App\Enums;


enum BtsOrderStatus: string
{
    const CREATED = "created";
    const SUCCESS = "success";
    const CANCELED = "canceled";
}
