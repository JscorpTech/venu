<?php

namespace App\Http\Controllers;

use App\Models\Region;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class DeliveryController extends Controller
{
    public function calculate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "district" => ['required_if:delivery_method,bts', "exists:districts,id"],
            "delivery_method" => ["in:free,bts,yandex", "required"],
            "customer_id" => ['integer', "required"],
            "long" => ['required_if:delivery_method,yandex'],
            "lat" => ["required_if:delivery_method,yandex"],
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $price = carts_delivery_price($request->input("delivery_method"), $request->input("customer_id"), $request->input("long"), $request->input("lat"), $request->input("district"));
        return response()->json([
            "detail" => "OK",
            "price" => $price,
        ]);
    }
    public function delivery_methods(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "region_id" => ['required', "exists:regions,id"],
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $region = Region::query()->find($validator->validated()['region_id']);
        $delivery_methods = [];
        if ($region->yandex) {
            $delivery_methods[] = [
                "title" => "Yandex",
                "code" => "yandex",
            ];
        }
        if ($region->bts) {
            $delivery_methods[] = [
                "title" => "BTS Express",
                "code" => "bts",
            ];
        }
        if ($request->free) {
            $delivery_methods[] = [
                "title" => "Bepul yetkazib berish",
                "code" => "free",
            ];
        }
        return response()->json($delivery_methods);
    }
}
