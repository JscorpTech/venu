<?php

namespace App\Http\Controllers;

use App\Http\Resources\Address\AddressListResource;
use App\Http\Resources\Address\DistrictListResource;
use App\Models\District;
use App\Models\Region;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AddressController extends Controller
{
    public function regions(Request $request)
    {
        return response()->json(AddressListResource::collection(Region::query()->orderBy("code")->get()));
    }


    public function districts_api(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "region_id" => ['required'],
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $data = $validator->validated();
        $districts = District::query()->where(['region_id' => $data['region_id']])->get();
        return response()->json(DistrictListResource::collection($districts));
    }

    public function districts(Request $request)
    {
        $region_id = $request->input("region_id");
        $districts = District::query();
        if ($region_id != null) {
            $districts = $districts->where(['region_id' => $region_id]);
        }
        $response = "";
        foreach ($districts->get() as $district) {
            $response .= "<option value='" . $district->id . "'>" . $district->name . "</option>";
        };
        return response()->json([
            "select_tag" => $response,
        ]);
    }
}
