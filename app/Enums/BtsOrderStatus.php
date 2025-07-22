<?php

namespace App\Enums;

enum BtsOrderStatus: string
{
    case CREATED = "created";
    case SUCCESS = "success";
    case CANCELED = "canceled";
}
