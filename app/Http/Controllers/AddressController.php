<?php

namespace App\Http\Controllers;

use App\Models\District;
use Illuminate\Http\Request;

class AddressController extends Controller
{
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
