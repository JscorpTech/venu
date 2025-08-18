<?php

namespace App\Http\Controllers;

use App\Models\Region;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DeliveryController extends Controller
{
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
