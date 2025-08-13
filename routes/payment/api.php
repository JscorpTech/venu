<?php

use App\Http\Controllers\Payment_Methods\PaymeMerchantApiView;
use Illuminate\Support\Facades\Route;

Route::post("payment/payme/callback/", PaymeMerchantApiView::class)->name("payme:merchant");
