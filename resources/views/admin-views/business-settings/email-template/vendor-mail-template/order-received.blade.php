<div>
    <h3 class="mb-4 view-mail-title text-capitalize">
        {{$title}}
    </h3>
    <div class="view-mail-body">
        {!! $body !!}
    </div>
    <div class="main-table-inner mb-4">
        <div class="d-flex justify-content-center pt-3">
            <img width="76" class="mb-4" id="view-mail-logo" src="{{$template->logo_full_url['path'] ?? getStorageImages(path: $companyLogo, type:'backend-logo')}}" alt="">
        </div>
        <h3 class="mb-3 text-center">{{translate('order_Info')}}</h3>
        <div class="main-table-inner bg-white">
            <div class="d-flex mb-3 p-2">
                <div class="flex-1 w-49">
                    <h3 class="mb-2">{{translate('order_Summary')}}</h3>
                    <div class="mb-2">{{translate('Order').' # '.($data['order']->id ?? '432121')}} </div>
                    <div>{{date('d M, Y : h:i:A' ,strtotime($data['order']->created_at ?? now()))}}</div>
                </div>
            </div>
            <div class="{{$template['order_information_status'] == 1 ? '' : 'd-none'}}" id="order-information">
                <table class="email-table table table-borderless">
                    <thead>
                    <tr>
                        <th class="text-left">{{translate('product')}}</th>
                        <th class="text-end">{{translate('price')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @if(isset($data['order']))
                        @php
                            $itemPrice=0;
                            $totalPrice=0;
                            $subtotal=0;
                            $total=0;
                            $shipping=0;
                            $discount=0;
                            $tax=0;
                            $row=0;
                            $finalAmount = 0;
                        @endphp
                        @foreach($data['order']->details as $key=>$detail)
                            @php($productDetails = $detail?->productAllStatus ?? json_decode($detail->product_details) )
                            <tr>
                                <td>
                                    <div class="d-flex gap-2">
                                        <span class="text-nowrap">{{ ++$row.'.' }} </span>
                                        <span>{{$productDetails->name.' x '.$detail['qty']}}</span>
                                    </div>
                                </td>
                                <td class="text-end fw-bold">{{webCurrencyConverter(amount: ($detail['price']*$detail['qty']))}}</td>
                            </tr>
                            @php($itemPrice+=$detail['price']*$detail['qty'])
                            @php($subtotal=$detail['price']*$detail['qty']-$detail['discount'])
                            @php($discount+=$detail['discount'])
                            @php($tax+=$detail['tax'])
                            @php($total+=$subtotal)
                        @endforeach
                        @php($shipping=$data['order']['shipping_cost'])
                        @php($couponDiscount = $data['order']['discount_amount'])
                        @php($deliveryFeeDiscount = 0)
                        @if ($data['order']['is_shipping_free'])
                            @php($deliveryFeeDiscount = $shipping)
                        @endif
                        @php($finalAmount = $total+$tax+$shipping-$couponDiscount-$deliveryFeeDiscount)

                    @else
                        <tr>
                            <td>
                                <div class="d-flex gap-2 text-wrap">
                                    <span>{{translate('1').'.'}} </span>
                                    <span>{{translate('The school of life - emotional baggage tote bag - canvas tote bag (navy) x 1')}}</span>
                                </div>
                            </td>
                            <td class="text-end fw-bold">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: 500), currencyCode: getCurrencyCode())}}</td>
                        </tr>
                    @endif
                    </tbody>
                </table>
                <hr>
                <dl class="email-dl">
                    <dt class="flex-1">{{translate('item_price')}}</dt>
                    <dd class="flex-1 text-end">
                        {{ isset($itemPrice) ? webCurrencyConverter(amount: $itemPrice) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 500), currencyCode: getCurrencyCode())}}
                    </dd>
                    <dt class="flex-1">{{translate('item_discount')}}</dt>
                    <dd class="flex-1 text-end">
                        - {{ isset($discount) ? webCurrencyConverter(amount: $discount) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 50), currencyCode: getCurrencyCode())}}
                    </dd>
                    <dt class="flex-1">{{translate('sub_total')}}</dt>
                    <dd class="flex-1 text-end">
                        {{ isset($total) ? webCurrencyConverter(amount: $total) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 450), currencyCode: getCurrencyCode())}}
                    </dd>
                    <dt class="flex-1">
                        {{translate('coupon_discount')}}
                    </dt>
                    <dd class="flex-1 text-end">
                        - {{ isset($couponDiscount) ? webCurrencyConverter(amount: $couponDiscount) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 0), currencyCode: getCurrencyCode())}}
                    </dd>                    <dt class="flex-1">{{translate('vat/Tax')}}</dt>
                    <dd class="flex-1 text-end">
                        {{ isset($tax) ? webCurrencyConverter(amount: $tax) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 25), currencyCode: getCurrencyCode())}}
                    </dd>
                    <dt class="flex-1">
                        {{translate('delivery_fee')}}
                    </dt>
                    <dd class="flex-1 text-end">
                        {{ isset($shipping) ? webCurrencyConverter(amount: $shipping-$deliveryFeeDiscount) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 0), currencyCode: getCurrencyCode())}}
                    </dd>
                    <dt class="flex-1 fw-bold">{{translate('Total')}}</dt>
                    <dd class="flex-1 text-end text-success fw-bold fs">
                        {{ isset($finalAmount) ? webCurrencyConverter(amount: $finalAmount) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 475), currencyCode: getCurrencyCode())}}
                    </dd>
                </dl>
            </div>
            <hr>
            <p class="view-footer-text">
                {{$footerText}}
            </p>
            <p>{{translate('Thanks_&_Regards')}}, <br> {{getWebConfig('company_name')}}</p>
        </div>
    </div>
    @include('admin-views.business-settings.email-template.partials-design.footer-design-without-logo')
</div>
