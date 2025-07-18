<?php

namespace App\Http\Controllers\RestAPI\v1;

use App\Http\Controllers\Controller;
use App\Models\BusinessSetting;
use App\Models\DeliveryCountryCode;
use App\Models\DeliveryZipCode;
use App\Models\GuestUser;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Review;
use App\Models\ShippingAddress;
use App\Models\SupportTicket;
use App\Models\SupportTicketConv;
use App\Models\Wishlist;
use App\Traits\CommonTrait;
use App\Traits\PdfGenerator;
use App\Traits\FileManagerTrait;
use App\Models\User;
use App\Utils\CustomerManager;
use App\Utils\Helpers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class CustomerController extends Controller
{
    use CommonTrait, PdfGenerator, FileManagerTrait;

    public function info(Request $request)
    {
        $user = $request->user();
        $getUser = User::where(['id' => $user->id])->first();
        $referralUserCount = User::where('referred_by', $user->id)->count();
        $user->referral_user_count = $referralUserCount;
        $user->orders_count = User::withCount('orders')->find($user->id)->orders_count;
        $user->is_phone_verified = $getUser->is_phone_verified;
        $user->email_verification_token = $getUser->email_verification_token;
        $user->email_verified_at = $getUser->email_verified_at;
        return response()->json($user, 200);
    }

    public function create_support_ticket(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject' => 'required',
            'type' => 'required',
            'description' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $images = [];
        if ($request->file('image')) {
            foreach ($request->image as $key => $value) {
                $image_name = $this->upload('support-ticket/', 'webp', $value);
                $images[] = [
                    'file_name' => $image_name,
                    'storage' => getWebConfig(name: 'storage_connection_type') ?? 'public',
                ];
            }
        }

        $request['customer_id'] = $request->user()->id;
        $request['status'] = 'pending';
        $request['attachment'] = $images;

        try {
            CustomerManager::create_support_ticket($request);
        } catch (\Exception $e) {
            return response()->json([
                'errors' => [
                    'code' => 'failed',
                    'message' => 'Something went wrong',
                ],
            ], 422);
        }
        return response()->json(['message' => 'Support ticket created successfully.'], 200);
    }

    public function account_delete(Request $request, $id): JsonResponse
    {
        if ($request->user()->id == $id) {
            $user = User::find($id);

            $ongoing = ['out_for_delivery', 'processing', 'confirmed', 'pending'];
            $order = Order::where('customer_id', $user->id)->where('is_guest', 0)->whereIn('order_status', $ongoing)->count();
            if ($order > 0) {
                return response()->json(['message' => 'You can`t delete account due ongoing_order!!'], 403);
            }
            $this->delete('/profile/' . $user['image']);
            $user->delete();
            return response()->json(['message' => 'Your account deleted successfully'], 200);

        } else {
            return response()->json(['message' => 'access_denied!!'], 403);
        }
    }

    public function reply_support_ticket(Request $request, $ticket_id)
    {
        DB::table('support_tickets')->where(['id' => $ticket_id])->update([
            'status' => 'open',
            'updated_at' => now(),
        ]);

        $images = [];
        if ($request->file('image')) {
            foreach ($request->image as $key => $value) {
                $image_name = $this->upload('support-ticket/', 'webp', $value);
                $images[] = [
                    'file_name' => $image_name,
                    'storage' => getWebConfig(name: 'storage_connection_type') ?? 'public',
                ];
            }
        }

        $support = new SupportTicketConv();
        $support->support_ticket_id = $ticket_id;
        $support->attachment = $images;
        $support->admin_id = 0;
        $support->customer_message = $request['message'];
        $support->save();
        return response()->json(['message' => 'Support ticket reply sent.'], 200);
    }

    public function get_support_tickets(Request $request)
    {
        return response()->json(SupportTicket::where('customer_id', $request->user()->id)->latest()->get(), 200);
    }

    public function get_support_ticket_conv($ticket_id)
    {
        $conversations = SupportTicketConv::where('support_ticket_id', $ticket_id)->get();
        $support_ticket = SupportTicket::find($ticket_id);

        $conversations = $conversations->toArray();

        if ($support_ticket) {
            $description = array(
                'support_ticket_id' => $ticket_id,
                'admin_id' => null,
                'customer_message' => $support_ticket->description,
                'admin_message' => null,
                'attachment' => $support_ticket->attachment,
                'attachment_full_url' => $support_ticket->attachment_full_url,
                'position' => 0,
                'created_at' => $support_ticket->created_at,
                'updated_at' => $support_ticket->updated_at,
            );
            array_unshift($conversations, $description);
        }
        return response()->json($conversations, 200);
    }

    public function support_ticket_close($id)
    {
        $ticket = SupportTicket::find($id);
        if ($ticket) {
            $ticket->status = 'close';
            $ticket->updated_at = now();
            $ticket->save();
            return response()->json(['message' => 'Successfully close the ticket'], 200);
        }
        return response()->json(['message' => 'Ticket not found'], 403);
    }

    public function add_to_wishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $wishlist = Wishlist::where('customer_id', $request->user()->id)->where('product_id', $request->product_id)->first();

        if (empty($wishlist)) {
            $wishlist = new Wishlist;
            $wishlist->customer_id = $request->user()->id;
            $wishlist->product_id = $request->product_id;
            $wishlist->save();
            return response()->json(['message' => 'successfully added!'], 200);
        }

        return response()->json(['message' => 'Already in your wishlist'], 409);
    }

    public function remove_from_wishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $wishlist = Wishlist::where('customer_id', $request->user()->id)->where('product_id', $request->product_id)->first();

        if (!empty($wishlist)) {
            Wishlist::where(['customer_id' => $request->user()->id, 'product_id' => $request->product_id])->delete();
            return response()->json(['message' => translate('successfully removed!')], 200);

        }
        return response()->json(['message' => translate('No such data found!')], 404);
    }

    public function wish_list(Request $request)
    {

        $wishlist = Wishlist::whereHas('wishlistProduct', function ($q) {
            return $q;
        })->with(['productFullInfo' => function ($query) {
            return $query->with(['clearanceSale' => function ($query) {
                return $query->active();
            }]);
        }])->where('customer_id', $request->user()->id)->get();

        $wishlist->map(function ($data) {
            $data['productFullInfo'] = Helpers::product_data_formatting(json_decode($data['productFullInfo'], true));
            return $data;
        });

        return response()->json($wishlist, 200);
    }

    public function address_list(Request $request): JsonResponse
    {
        $user = Helpers::getCustomerInformation($request);
        if ($user == 'offline') {
            $data = ShippingAddress::where(['customer_id' => $request->guest_id, 'is_guest' => 1])->get();
        } else {
            $data = ShippingAddress::where(['customer_id' => $user->id, 'is_guest' => '0'])->get();
        }
        return response()->json($data, 200);
    }

    public function add_new_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_person_name' => 'required',
            'address_type' => 'required',
            'address' => 'required',
            'city' => 'required',
            'zip' => 'required',
            'country' => 'required',
            'phone' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'is_billing' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $zip_restrict_status = getWebConfig(name: 'delivery_zip_code_area_restriction');
        $country_restrict_status = getWebConfig(name: 'delivery_country_restriction');

        if ($country_restrict_status && !self::delivery_country_exist_check($request->input('country'))) {
            return response()->json(['message' => translate('Delivery_unavailable_for_this_country')], 403);

        } elseif ($zip_restrict_status && !self::delivery_zipcode_exist_check($request->input('zip'))) {
            return response()->json(['message' => translate('Delivery_unavailable_for_this_zip_code_area')], 403);
        }

        $user = Helpers::getCustomerInformation($request);

        $address = [
            'customer_id' => $user == 'offline' ? $request->guest_id : $user->id,
            'is_guest' => $user == 'offline' ? 1 : 0,
            'contact_person_name' => $request->contact_person_name,
            'address_type' => $request->address_type,
            'address' => $request->address,
            'city' => $request->city,
            'zip' => $request->zip,
            'country' => $request->country,
            'phone' => $request->phone,
            'email' => $request->email,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'is_billing' => $request->is_billing,
            'created_at' => now(),
            'updated_at' => now(),
        ];
        ShippingAddress::insert($address);
        return response()->json(['message' => translate('successfully added!')], 200);
    }

    public function update_address(Request $request): JsonResponse
    {
        $user = Helpers::getCustomerInformation($request);

        $shippingAddress = ShippingAddress::where([
            'customer_id' => $user == 'offline' ? $request->guest_id : $user->id,
            'id' => $request->id
        ])->first();

        if (!$shippingAddress) {
            return response()->json(['message' => translate('not_found')], 200);
        }

        $zipRestrictStatus = getWebConfig(name: 'delivery_zip_code_area_restriction');
        $countryRestrictStatus = getWebConfig(name: 'delivery_country_restriction');

        if ($countryRestrictStatus && !self::delivery_country_exist_check($request->input('country'))) {
            return response()->json(['error_type' => 'address', 'message' => translate('Delivery_unavailable_for_this_country')], 403);
        } elseif ($zipRestrictStatus && !self::delivery_zipcode_exist_check($request->input('zip'))) {
            return response()->json(['error_type' => 'zip_code', 'message' => translate('Delivery_unavailable_for_this_zip_code_area')], 403);
        }

        $shippingAddress->update([
            'customer_id' => $user == 'offline' ? $request->guest_id : $user->id,
            'is_guest' => $user == 'offline' ? 1 : 0,
            'contact_person_name' => $request['contact_person_name'],
            'address_type' => $request['address_type'],
            'address' => $request['address'],
            'city' => $request['city'],
            'zip' => $request['zip'],
            'country' => $request['country'],
            'phone' => $request['phone'],
            'latitude' => $request['latitude'],
            'longitude' => $request['longitude'],
            'is_billing' => $request['is_billing'],
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return response()->json(['message' => translate('update_successful')], 200);
    }

    public function delete_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $user = Helpers::getCustomerInformation($request);

        $shipping_address = ShippingAddress::where(['id' => $request['address_id']])
            ->when($user == 'offline', function ($query) use ($request) {
                $query->where(['customer_id' => $request->guest_id, 'is_guest' => 1]);
            })
            ->when($user != 'offline', function ($query) use ($user) {
                $query->where(['customer_id' => $user->id, 'is_guest' => '0']);
            })->first();

        if ($shipping_address && $shipping_address->delete()) {
            return response()->json(['message' => 'successfully removed!'], 200);
        }
        return response()->json(['message' => translate('No such data found!')], 404);
    }

    public function get_order_list(Request $request)
    {
        $status = array(
            'ongoing' => ['out_for_delivery', 'processing', 'confirmed', 'pending'],
            'canceled' => ['canceled', 'failed', 'returned'],
            'delivered' => ['delivered'],
        );

        $orders = Order::with('details.product', 'deliveryMan', 'seller.shop')
            ->withSum('details as order_details_count', 'qty')
            ->where(['customer_id' => $request->user()->id, 'is_guest' => '0'])
            ->when($request->status && $request->status != 'all', function ($query) use ($request, $status) {
                $query->whereIn('order_status', $status[$request->status])
                    ->when($request->type == 'reorder', function ($query) use ($request) {
                        $query->where('order_type', 'default_type');
                    });
            })
            ->orderBy('id', 'desc')
            ->paginate($request['limit'], ['*'], 'page', $request['offset']);

        $orders->map(function ($data) {
            $data->details->map(function ($query) {
                $query['product'] = Helpers::product_data_formatting(json_decode($query['product'], true));
                return $query;
            });

            return $data;
        });

        $orders = [
            'total_size' => $orders->total(),
            'limit' => $request['limit'],
            'offset' => $request['offset'],
            'orders' => $orders->items()
        ];
        return response()->json($orders, 200);
    }

    public function get_order_details(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $user = Helpers::getCustomerInformation($request);

        $detailsList = OrderDetail::with('productAllStatus', 'order.deliveryMan', 'verificationImages', 'seller.shop')
            ->whereHas('order', function ($query) use ($request, $user) {
                $query->where([
                    'customer_id' => $user == 'offline' ? $request->guest_id : $user->id,
                    'is_guest' => $user == 'offline' ? 1 : '0'
                ]);
            })
            ->where(['order_id' => $request['order_id']])
            ->get();

        $detailsList->map(function ($query) use ($user) {
            $query['variation'] = json_decode($query['variation'], true);
            $product = json_decode($query['product_details'], true);
            $product['thumbnail_full_url'] = $query?->productAllStatus?->thumbnail_full_url;
            if (isset($product['product_type']) && $product['product_type'] == 'digital' && $product['digital_product_type'] == 'ready_product' && $product['digital_file_ready']) {
                $checkFilePath = storageLink('product/digital-product', $product['digital_file_ready'], ($product['storage_path'] ?? 'public'));
                $product['digital_file_ready_full_url'] = $checkFilePath;
            }
            $query['product_details'] = Helpers::product_data_formatting_for_json_data($product);

            $reviews = Review::where(['product_id' => $query['product_id'], 'customer_id' => $user->id])->whereNull('delivery_man_id')->get();
            $reviewData = null;
            foreach ($reviews as $review) {
                if ($review->order_id == $query['order_id']) {
                    $reviewData = $review;
                }
            }

            if (isset($reviews[0]) && is_null($reviewData)) {
                $reviewData = ($reviews[0]['order_id'] == null ? $reviews[0] : null);
            }
            $query['reviewData'] = $reviewData;
            return $query;
        });
        return response()->json($detailsList, 200);
    }

    public function getOrderInvoice(Request $request)
    {
        $order = Order::with('seller')->with('shipping')->where('id', $request['order_id'])->first();
        $data["email"] = $order->customer["email"];
        $data["order"] = $order;
        $invoiceSettings = json_decode(BusinessSetting::where(['type' => 'invoice_settings'])->first()?->value, true);
        $mpdf_view = \View::make(VIEW_FILE_NAMES['order_invoice'], compact('order', 'invoiceSettings'));
        $mpdf = new \Mpdf\Mpdf(['default_font' => 'FreeSerif', 'mode' => 'utf-8', 'format' => [190, 250], 'autoLangToFont' => true]);
        $mpdf->autoScriptToLang = true;
        $mpdf->autoLangToFont = true;
        if ($pdfType = 'invoice') {
            $footerHtml = $this->footerHtml(requestFrom: 'web');
            $mpdf->SetHTMLFooter($footerHtml);
        }
        $mpdf_view = $mpdf_view->render();
        $mpdf->WriteHTML($mpdf_view);
        $pdfContentStr = $mpdf->Output('', 'S');
        $pdfContentBytes = $pdfContentStr;
        $byteArray = array_values(unpack('C*', $pdfContentBytes));
        return response()->json($byteArray);
    }

    public function getOrderById(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $order = Order::withCount('orderDetails')->with(['deliveryMan', 'offlinePayments', 'verificationImages'])->where(['id' => $request['order_id']])->first();
        if (isset($order['offlinePayments'])) {
            $order['offlinePayments']->payment_info = $order->offlinePayments->payment_info;
        }
        $order = json_decode(json_encode($order), true);
        return response()->json($order, 200);
    }

    public function update_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'l_name' => 'required',
            'phone' => 'required',
        ], [
            'f_name.required' => translate('First name is required!'),
            'l_name.required' => translate('Last name is required!'),
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $checkEmail = User::where('email', $request['email'])->where('id', '!=', $request->user()->id)->first();
        if ($checkEmail) {
            return response()->json([
                'errors' => [
                    ['code' => 'invalid_email', 'message' => translate('Email_already_exists')]
                ]
            ], 403);
        }

        $checkPhone = User::where('phone', $request['phone'])->where('id', '!=', $request->user()->id)->first();
        if ($checkPhone) {
            return response()->json([
                'errors' => [
                    ['code' => 'invalid_phone', 'message' => translate('Phone_already_exists')]
                ]
            ], 403);
        }

        if ($request->has('image')) {
            $imageName = $this->update('profile/', $request->user()->image, 'webp', $request->file('image'));
        } else {
            $imageName = $request->user()->image;
        }

        if ($request['password'] != null && strlen($request['password']) > 5) {
            $pass = bcrypt($request['password']);
        } else {
            $pass = $request->user()->password;
        }

        $user = User::where(['id' => $request->user()->id])->first();
        $userDetails = [
            'f_name' => $request->f_name,
            'l_name' => $request->l_name,
            'image' => $imageName,
            'phone' => $user['is_phone_verified'] ? $user['phone'] : $request['phone'],
            'email' => $request['email'],
            'is_phone_verified' => $request['phone'] == $user['phone'] ? $user['is_phone_verified'] : 0,
            'is_email_verified' => $request['email'] == $user['email'] ? $user['is_email_verified'] : 0,
            'email_verified_at' => $request['email'] == $user['email'] ? $user['email_verified_at'] : null,
            'password' => $pass,
            'updated_at' => now(),
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);
        return response()->json(['message' => translate('successfully updated!')], 200);
    }

    public function update_cm_firebase_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cm_firebase_token' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::validationErrorProcessor($validator)], 403);
        }

        $user = Helpers::getCustomerInformation($request);

        if ($user == 'offline') {
            $guest = GuestUser::find($request->guest_id);
            $guest->fcm_token = $request['cm_firebase_token'];
            $guest->save();
        } else {
            DB::table('users')->where('id', $user->id)->update([
                'cm_firebase_token' => $request['cm_firebase_token'],
            ]);
        }

        return response()->json(['message' => translate('successfully updated!')], 200);
    }

    public function get_restricted_country_list(Request $request)
    {
        $stored_countries = DeliveryCountryCode::orderBy('country_code', 'ASC')->pluck('country_code')->toArray();
        $country_list = COUNTRIES;

        $countries = array();

        foreach ($country_list as $country) {
            if (in_array($country['code'], $stored_countries)) {
                $countries [] = $country['name'];
            }
        }

        if ($request->search) {
            $countries = array_values(preg_grep('~' . $request->search . '~i', $countries));
        }

        return response()->json($countries, 200);
    }

    public function get_restricted_zip_list(Request $request)
    {
        $zipcodes = DeliveryZipCode::orderBy('zipcode', 'ASC')
            ->when($request->search, function ($query) use ($request) {
                $query->where('zipcode', 'like', "%{$request->search}%");
            })
            ->get();

        return response()->json($zipcodes, 200);
    }

    public function language_change(Request $request): JsonResponse
    {
        $user = Helpers::getCustomerInformation($request);

        if ($user != 'offline') {
            $user->app_language = $request->current_language;
            $user->save();
        }

        return response()->json(['message' => 'Successfully change'], 200);
    }
}
