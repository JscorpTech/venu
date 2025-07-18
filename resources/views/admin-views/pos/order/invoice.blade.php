<link rel="stylesheet" href="{{ dynamicAsset(path: 'public/assets/back-end/css/pos-invoice.css') }}">
<?php
$orderTotalPriceSummary = \App\Utils\OrderManager::getOrderTotalPriceSummary(order: $order);
?>
<div class="width-363px">
    <div class="text-center pt-4 mb-3">
        <h2 class="line-height-1">{{ getWebConfig('company_name') }}</h2>
        <h5 class="line-height-1 font-size-16px">
            {{ translate('phone') }} : {{ getWebConfig('company_phone') }}
        </h5>
    </div>

    <span class="dashed-hr"></span>
    <div class="row mt-3">
        <div class="col-6">
            <h5>{{ translate('order_ID') }} : {{ $order['id'] }}</h5>
        </div>
        <div class="col-6">
            <h5 class="" dir="ltr">
                {{ date('d/M/Y h:i a', strtotime($order['created_at'])) }}
            </h5>
        </div>
        @if($order->customer)
            <div class="col-12">
                <h5 class="text-capitalize">{{ translate('customer_name') }} : {{$order->customer['f_name'].' '.$order->customer['l_name']}}</h5>
                @if ($order->customer->id !=0)
                    <h5>{{ translate('phone') }} : {{$order->customer['phone']}}</h5>
                @endif

            </div>
        @endif
    </div>
    <h5 class="text-uppercase"></h5>
    <span class="dashed-hr"></span>
    <table class="table table-bordered mt-3 text-left width-99" style="white-space: normal;">
        <thead>
        <tr>
            <th class="text-center text-uppercase p-0">{{ translate('qty') }}</th>
            <th class="text-center text-uppercase p-0">{{ translate('desc') }}</th>
            <th class="text-center p-0">{{ translate('price') }}</th>
        </tr>
        </thead>

        <tbody>
        @php($sub_total=0)
        @php($total_tax=0)
        @php($total_dis_on_pro=0)
        @php($product_price=0)
        @php($total_product_price=0)
        @php($ext_discount=0)
        @php($coupon_discount=0)
        @foreach($order->details as $detail)
            @if($detail->product)
                <tr>
                    <td class="text-left">
                        {{$detail['qty']}}
                    </td>
                    <td class="text-left ps-1 ps-lg-0">
                        <span> {{ Str::limit($detail->product['name'], 200) }}</span><br>
                        @if($detail->product->product_type == 'physical' && count(json_decode($detail['variation'],true))>0)
                            <strong><u>{{ translate('variation') }} : </u></strong>
                            @foreach(json_decode($detail['variation'],true) as $key1 =>$variation)
                                <div class="font-size-sm text-body color-black">
                                    <span>{{ translate($key1) }} :  </span>
                                    <span
                                        class="font-weight-bold">{{$variation}} </span>
                                </div>
                            @endforeach
                        @endif

                        {{ translate('discount') }}
                        : {{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $detail['discount']), currencyCode: getCurrencyCode()) }}
                    </td>
                    <td class="text-right">
                        @php($amount=($detail['price']*$detail['qty'])-$detail['discount'])
                        @php($product_price = $detail['price']*$detail['qty'])
                        {{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $amount), currencyCode: getCurrencyCode()) }}
                    </td>
                </tr>
                @php($sub_total+=$amount)
                @php($total_product_price+=$product_price)
                @php($total_tax+=$detail['tax'])

            @endif
        @endforeach
        </tbody>
    </table>
    <span class="dashed-hr"></span>

    <table class="w-100 color-black">
        <tr>
            <td colspan="2"></td>
            <td class="text-right">{{ translate('items_Price') }}:</td>
            <td class="text-right">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['itemPrice']), currencyCode: getCurrencyCode()) }}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td class="text-right">{{ translate('item_discount') }}:</td>
            <td class="text-right">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['itemDiscount']), currencyCode: getCurrencyCode()) }}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td class="text-right">{{ translate('extra_discount') }}:</td>
            <td class="text-right">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['extraDiscount']), currencyCode: getCurrencyCode()) }}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td class="text-right">{{ translate('subtotal') }}:</td>
            <td class="text-right">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['subTotal']), currencyCode: getCurrencyCode()) }}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td class="text-right">{{ translate('tax') }} / {{ translate('VAT') }}:</td>
            <td class="text-right">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['taxTotal']), currencyCode: getCurrencyCode()) }}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td class="text-right">{{ translate('coupon_discount') }}:</td>
            <td class="text-right">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['couponDiscount']), currencyCode: getCurrencyCode()) }}</td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td class="text-right font-size-20px">
                {{ translate('total') }}:
            </td>
            <td class="text-right font-size-20px">
                {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['totalAmount']), currencyCode: getCurrencyCode()) }}
            </td>
        </tr>

        @if ($order->order_type == 'pos' || $order->order_type == 'POS')
            <tr>
                <td colspan="4">
                    <span class="dashed-hr"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td class="text-right">
                    {{ translate('Paid_Amount') }}:
                </td>
                <td class="text-right">
                    {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['paidAmount']), currencyCode: getCurrencyCode()) }}
                </td>
            </tr>

            <tr>
                <td colspan="2"></td>
                <td class="text-right">
                    {{ translate('Change_Amount') }}:
                </td>
                <td class="text-right">
                    {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['changeAmount']), currencyCode: getCurrencyCode()) }}
                </td>
            </tr>
        @endif

    </table>


    <span class="dashed-hr"></span>
    <div class="d-flex flex-row justify-content-between">
        <span>{{ translate('paid_by') }}: {{ translate($order->payment_method) }}</span>
    </div>
    <span class="dashed-hr"></span>
    <h5 class="text-center py-2 text-uppercase">
        """{{ translate('thank_you') }}"""
    </h5>
    <span class="dashed-hr"></span>
</div>
