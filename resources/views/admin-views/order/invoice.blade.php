@php
    use Illuminate\Support\Facades\Session;
    $currencyCode = getCurrencyCode(type: 'default');
    $direction = Session::get('direction');
    $lang = getDefaultLanguage();
@endphp
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="{{ $direction}}"
      style="text-align: {{$direction === "rtl" ? 'right' : 'left' }};"
      xmlns="http://www.w3.org/1999/html">
    <head>
        <meta charset="UTF-8">
        <title>{{ translate('invoice') }}</title>
        <meta http-equiv="Content-Type" content="text/html;"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa2JL7SUc.woff2') }}) format('woff2');
                unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
            }

            /* cyrillic */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa0ZL7SUc.woff') }}) format('woff2');
                unicode-range: U+0301, U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
            }

            /* greek-ext */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa2ZL7SUc.woff') }}) format('woff2');
                unicode-range: U+1F00-1FFF;
            }

            /* greek */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa1pL7SUc.woff') }}) format('woff2');
                unicode-range: U+0370-0377, U+037A-037F, U+0384-038A, U+038C, U+038E-03A1, U+03A3-03FF;
            }

            /* vietnamese */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa2pL7SUc.woff') }}) format('woff2');
                unicode-range: U+0102-0103, U+0110-0111, U+0128-0129, U+0168-0169, U+01A0-01A1, U+01AF-01B0, U+0300-0301, U+0303-0304, U+0308-0309, U+0323, U+0329, U+1EA0-1EF9, U+20AB;
            }

            /* latin-ext */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa25L7SUc.woff') }}) format('woff2');
                unicode-range: U+0100-02AF, U+0304, U+0308, U+0329, U+1E00-1E9F, U+1EF2-1EFF, U+2020, U+20A0-20AB, U+20AD-20C0, U+2113, U+2C60-2C7F, U+A720-A7FF;
            }

            /* latin */
            @font-face {
                font-family: 'Inter';
                font-style: normal;
                font-weight: 100 900;
                font-display: swap;
                src: url({{ dynamicAsset('public/assets/front-end/fonts/Inter/UcC73FwrK3iLTeHuS_fvQtMwCp50KnMa1ZL7.woff') }}) format('woff2');
                unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+0304, U+0308, U+0329, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
            }

            * {
                margin: 0;
                padding: 0;
                line-height: 1.6;
                font-family: "Inter", sans-serif;
                color: #6A707C;
            }

            .ltr {
                direction: ltr;
            }

            .rtl {
                direction: rtl;
            }

            body {
                font-size: .75rem;
                font-family: "Inter", sans-serif;
                font-optical-sizing: auto;
                font-weight: < weight >;
                font-style: normal;
                font-variation-settings: "slnt" 0;
            }

            .footer {
                position: fixed;
                bottom: 0;
                left: 0;
                width: 100%;
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
            }

            img {
                max-width: 100%;
            }

            .customers {
                border-collapse: collapse;
                width: 100%;
            }

            table {
                width: 100%;
            }

            table thead th {
                padding: 8px;
                font-size: 9px;
            }

            table tbody th,
            table tbody td {
                padding: 8px;
                color: #6A707C;
            }

            table.fs-12 thead th {
                font-size: 12px;
            }

            table.fs-12 tbody th,
            table.fs-12 tbody td {
                font-size: 12px;
            }

            table.fs-10 thead th {
                font-size: 10px;
            }

            table.fs-10 tbody th,
            table.fs-10 tbody td {
                font-size: 10px;
            }

            table.fz-9 thead th {
                font-size: 9px;
            }

            table.fz-9 tbody th,
            table.fz-9 tbody td {
                font-size: 9px;
            }

            table.customers thead th,
            .customers thead th {
                background-color: #F5FBFF;
                color: #222222;
                border-top: 1px solid #D6EBFF;
                border-bottom: 1px solid #D6EBFF;
                padding-top: 10px;
            }

            table.customers tbody th,
            .customers tbody th{
                background-color: #FAFCFF;
            }

            table.customers tbody td,
            .customers tbody td {
                padding-block: 10px;
                border-bottom: 1px solid #D7DAE0;
            }

            .calc-table * {
                color: #222222
            }

            .calc-table td {
                padding-inline: 0 !important
            }

            .calc-table {
                padding: 0 !important
            }

            .text-left {
                text-align: {{$direction === "rtl" ? 'right' : 'left' }}  !important;
            }

            .pb-2 {
                padding-bottom: 8px !important;
            }

            .pb-3 {
                padding-bottom: 16px !important;
            }

            .text-right {
                text-align: {{$direction === "rtl" ? 'left' : 'right' }}  !important;
            }

            table th.text-right {
                text-align: {{$direction === "rtl" ? 'left' : 'right' }}  !important;
            }

            @media print {
                table th.text-right {
                    text-align: {{$direction === "rtl" ? 'left' : 'right' }}  !important;
                }
            }

            .content-position {
                padding: 30px 20px 10px;
            }

            .content-position-y {
                padding: 0 40px;
            }

            .text-white {
                color: white !important;
            }

            .bs-0 {
                border-spacing: 0;
            }


            .mb-1 {
                margin-bottom: 4px !important;
            }

            .mb-2 {
                margin-bottom: 8px !important;
            }

            .mb-4 {
                margin-bottom: 24px !important;
            }

            .mb-30 {
                margin-bottom: 30px !important;
            }

            .px-10 {
                padding-inline-start: 10px;
                padding-inline-end: 10px;
            }

            .fz-14 {
                font-size: 14px;
            }

            .fz-9 {
                font-size: 9px;
            }

            .fs-10 {
                font-size: 10px;
            }

            .fs-12 {
                font-size: 12px;
            }

            .font-normal {
                font-weight: 400;
            }

            .font-weight-normal {
                font-weight: normal;
            }

            .border-dashed-top {
                border-top: 1px dashed #ddd;
            }

            .font-weight-bold {
                font-weight: 700;
            }

            .bg-light {
                background-color: #F7F7F7;
            }

            .py-30 {
                padding-top: 30px;
                padding-bottom: 30px;
            }

            .py-4 {
                padding-top: 24px;
                padding-bottom: 24px;
            }

            .d-flex {
                display: flex;
                gap: 3px;
            }

            .align-items-center {
                align-items: center;
            }

            .gap-2 {
                gap: 8px;
            }

            .flex-wrap {
                flex-wrap: wrap;
            }

            .align-items-center {
                align-items: center;
            }

            .justify-content-center {
                justify-content: center;
            }

            a {
                color: rgba(0, 128, 245, 1);
            }

            .p-1 {
                padding: 4px !important;
            }

            .h2 {
                font-size: 1.5em;
                margin-block-start: 0.83em;
                margin-block-end: 0.83em;
                margin-inline-start: 0;
                margin-inline-end: 0;
                font-weight: bold;
                color: #222222;
            }

            .h4 {
                margin-block-start: 1.33em;
                margin-block-end: 1.33em;
                margin-inline-start: 0;
                margin-inline-end: 0;
                font-weight: bold;
                color: #222222;
            }

            .m-0 {
                margin: 0;
            }

            .my-0 {
                margin-top: 0;
                margin-bottom: 0;
            }

            .mb-0 {
                margin-bottom: 0;
            }

            .mt-6px {
                margin-top: 6px;
            }

            .font-size-26px {
                font-size: 26px
            }

            .w-100 {
                width: 100%;
            }

            .width-60 {
                width: 60%;
            }

            .fz-17 {
                font-size: 17px;
            }
            .fz-16 {
                font-size: 16px;
            }

            .text-primary {
                color: #0177CD;
            }

            .border {
                border: 1px solid #D7DAE0;
            }

            .border-bottom {
                border-bottom: 1px solid #D7DAE0;
            }

            .border-left {
                border-left: 1px solid #D7DAE0;
            }

            .font-bold {
                font-weight: {{$lang == 'bd' ?'700':'bold' }};
                color: #222222;
            }

            .vertical-align-top {
                vertical-align: top;
            }

            .font-semibold {
                font-weight: 600;
                color: #222222;
            }

            .fz-11 {
                font-size: 11px;
            }

            .fz-14 {
                font-size: 14px !important;
            }

            .h-100 {
                height: 100%;
            }

            .font-medium {
                font-weight: 600;
                color: #222222;
            }

            .text-capitalize {
                text-transform: capitalize;
            }

            .text-dark, strong {
                color: #222222;
            }

            .text-uppercase {
                text-transform: uppercase;
            }

            .text-nowrap{
                white-space: nowrap !important;
            }

            .text-wrap{
                white-space: normal !important;
            }

            .text-center {
                text-align: center !important;
            }

            .pt-0 {
                padding-top: 0 !important;
            }

            .pb-0 {
                padding-bottom: 0 !important;
            }

            @media print {
                .customers {
                    width: 100%;
                    border-collapse: collapse;
                }
                tr {
                    page-break-inside: avoid;
                }

                thead {
                    display: table-header-group;
                }

                tbody {
                    display: table-row-group;
                }

                td,
                th {
                    word-wrap: break-word;
                }
            }
        </style>

    </head>

    <body>

        <div class="first content-position" style="width:595px;margin: 0 auto;">
            <table class="fs-10">
                <tr>
                    <td style="padding:0;text-align:{{$direction === "rtl" ? 'right' : 'left' }}">
                        <div class="text-dark" style="text-transform:uppercase; font-size:22px;margin-bottom:5px">
                            {{ translate('Invoice') }}
                        </div>
                        <div class="font-normal">
                            <span class="font-bold">{{ translate('invoice_Date') }}</span> : {{date('M d ,Y',strtotime($order['created_at'])) }}
                        </div>
                    </td>
                    <td style="padding:0;text-align:{{$direction === "rtl" ? 'left' : 'right' }}">
                        @if(isset($invoiceSettings['invoice_logo_status']) && $invoiceSettings['invoice_logo_status'] == 1)
                            @if(isset($invoiceSettings['invoice_logo_type']) && $invoiceSettings['invoice_logo_type'] == 'default')
                                <img height="40"
                                     src="{{ getStorageImages(path: getWebConfig(name: 'company_web_logo_png'), type:'backend-logo') }}"
                                     alt="" style="margin-bottom:5px;object-fit: contain">
                            @elseif(isset($invoiceSettings['invoice_logo_type']) && $invoiceSettings['invoice_logo_type'] == 'custom' && isset($invoiceSettings['image']))
                                <img height="40"
                                     src="{{ getStorageImages(path: imagePathProcessing(imageData:  $invoiceSettings['image'], path:'company'), type: 'backend-logo') }}"
                                     alt="" style="margin-bottom:5px;object-fit: contain">
                            @endif
                        @endif

                        <div class="font-normal">
                            {{ getWebConfig('shop_address') }}
                        </div>
                        @if(isset($invoiceSettings['business_identity_status']) && $invoiceSettings['business_identity_status'])
                            <div>
                                <span class="font-bold">
                                    {{ $invoiceSettings['business_identity'] }}
                                </span> :
                                <span class="font-normal">{{ $invoiceSettings['business_identity_value'] }}</span>
                            </div>
                        @endif

                        @if($order['seller_is']!='admin' && isset($order['seller']) && $order['seller']->gst != null)
                            <div>
                                <span class="font-bold">{{ translate('GST') }}</span> : <span class="font-normal">{{ $order['seller']->gst }}</span>
                            </div>
                        @endif
                    </td>
                </tr>
            </table>
            <br>
            <?php
            $orderTotalPriceSummary = \App\Utils\OrderManager::getOrderTotalPriceSummary(order: $order);
            ?>
            <table class="border bs-0" style="border-radius:12px;">
                @if ($order->order_type == 'default_type')
                    <tr>
                        <td class="text-left" style="padding:23px 16px">
                            <div class="mb-1 fs-10">
                                <span class="font-bold">{{ translate('order') }}</span> <span class="font-normal">#{{ $order->id }}</span>
                            </div>
                            <div class="mb-1 fs-10">
                                <span class="font-bold">{{ translate('date') }}</span> : <span
                                    class="font-normal">{{date('M d, Y',strtotime($order['created_at'])) }}</span>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="text-right" style="padding:23px 16px">
                            <div class="mb-1 fs-10">
                                <span class="font-bold text-nowrap">{{ translate('invoice_of') }}</span> <span class="font-normal fz-9">{{' ( '.$currencyCode.' )' }}</span>
                            </div>
                            <div class="fz-16 text-primary text-right">
                                {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['totalAmount']), currencyCode: getCurrencyCode()) }}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="border-bottom"></td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 10px;padding: 0 !important;line-height:10px"></td>
                    </tr>
                    <tr>
                        <td colspan="1" class="vertical-align-top {{$direction === "rtl" ? 'border-left' : '' }}" style="padding:8px 16px;">
                            <div class="fz-11">{{ translate('payment') }}</div>
                            <div class="font-medium fs-10 mb-2 text-capitalize">
                                <span class="font-bold">{{ str_replace('_',' ',$order->payment_method) }}</span></div>
                            @if(!empty($order->transaction_ref))
                                <br>
                                <div class="fz-11">{{ translate('reference_ID') }}</div>
                                <div class="font-medium fs-10 mb-2 text-capitalize">
                                    <span class="font-bold">{{ $order->transaction_ref }}</span>
                                </div>
                            @endif
                            @if($order->offlinePayments)
                                <br>
                                @foreach ($order->offlinePayments?->payment_info as $key=>$item)
                                    @if (isset($item) && $key != 'method_id')
                                        <div class="fz-11">{{ str_replace('_',' ',$key) }}</div>
                                        <div class="font-medium fs-10 mb-2 text-capitalize"><strong>{{ $item }}</strong></div>
                                    @endif
                                @endforeach
                            @endif
                        </td>
                        @if($order->billing_address_data)
                            <td colspan="2" class="fs-10 border-left vertical-align-top" style="padding:8px 16px;">
                                    <?php
                                    $billingAddress = $order->billing_address_data
                                    ?>
                                <span class="font-bold fz-11">{{ translate('billed_To') }}</span>
                                ({{ translate($billingAddress->address_type) }})
                                <div class="">
                                    <div class="font-normal mt-6px">
                                        {{$billingAddress->contact_person_name}}
                                    </div>
                                    <div class="font-semibold mt-6px">
                                        {{$billingAddress->phone}}
                                    </div>
                                    <div class="font-normal mt-6px">
                                        {{$billingAddress->address}}
                                    </div>
                                    <div class="font-normal mt-6px">
                                        {{$billingAddress->city}} {{$billingAddress->zip}}
                                    </div>
                                </div>
                            </td>
                        @endif
                        <td colspan="2" class="fs-10 vertical-align-top  {{$direction === "rtl" ? '' : 'border-left' }}" style="padding:8px 16px;">
                            @if($order->shipping_address_data)
                                    <?php
                                    $shipping_address = $order->shipping_address_data;
                                    ?>
                                <span class="font-bold fz-11">{{ translate('shipping_To') }} </span>
                                ({{ translate($shipping_address->address_type) }})
                                <div>
                                    <div class="font-normal mt-6px">{{$shipping_address->contact_person_name}}</div>
                                    <div class="font-semibold mt-6px">{{$shipping_address->phone}}</div>
                                    <div class="font-normal mt-6px">{{$shipping_address->address}}</div>
                                    <div class="font-normal mt-6px">{{ $shipping_address->city }} {{ $shipping_address->zip }} </div>
                                </div>
                            @else
                                <span class="font-bold fz-11">{{ translate('customer_Info') }}</span>
                                <div class="">
                                    @if($order->is_guest)
                                        <div class="font-normal mt-6px">{{ translate('guest_User') }}</div>
                                    @else
                                        <div class="font-normal mt-6px">
                                            {{ $order->customer !=null? $order->customer['f_name'].' '.$order->customer['l_name']:translate('name_not_found') }}
                                        </div>
                                    @endif
                                    @if (isset($order->customer) && $order->customer['id']!=0)
                                        <div class="font-normal mt-6px">
                                            {{$order->customer !=null? $order->customer['email']: translate('email_not_found') }}
                                        </div>
                                        <div class="font-normal mt-6px">
                                            {{$order->customer !=null? $order->customer['phone']: translate('phone_not_found') }}
                                        </div>
                                    @endif
                                </div>
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 10px;padding: 0 !important;line-height:10px"></td>
                    </tr>
                @else
                    <tr>
                        <td class="text-left" style="padding:23px 16px 0">
                            <div class="mb-1 fs-10">
                                <span class="font-bold">{{ translate('order') }}</span> <span class="font-normal">#{{ $order->id }}</span>
                            </div>
                            <div class="fs-10">
                                <span class="font-bold">{{ translate('date') }}</span> : <span
                                    class="font-normal">{{date('M d, Y',strtotime($order['created_at'])) }}</span>
                            </div>
                        </td>
                        <td class="" style="padding:23px 8px 0">
                            <div class="font-normal mb-1 fs-10">{{ translate('customer_Name') }}</div>
                            <div
                                class="font-semibold fs-10">{{ $order->customer !=null? $order->customer['f_name'].' '.$order->customer['l_name']:translate('Name_not_found') }}</div>
                        </td>
                        <td class="" style="padding:23px 8px 0">
                            @if($order?->customer && $order?->customer?->id != 0)
                                <div class="font-normal mb-1 fs-10">{{translate('Phone')}}</div>
                                <div class="font-semibold fs-10">
                                    {{ $order->customer['phone'] }}
                                </div>
                            @elseif($order?->customer == null)
                                <div class="font-normal mb-1 fs-10">{{translate('Phone')}}</div>
                                <div class="font-semibold fs-10">
                                    {{ translate('phone_not_found') }}
                                </div>
                            @endif
                        </td>
                        <td class="" style="padding:23px 8px 0">
                            <div class="font-normal mb-1 fs-10">{{ translate('payment') }}</div>
                            <div class="font-semibold fs-10">{{ translate($order->payment_status) }}</div>
                        </td>
                        <td class="text-right" style="padding:23px 16px 0">
                            <div class="fs-10 text-nowrap">
                                {{ translate('invoice_of') }} {{' ( '.$currencyCode.' )' }}
                            </div>
                            <div class="fz-16 text-primary text-right">{{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['totalAmount']), currencyCode: getCurrencyCode()) }}</div>
                        </td>
                    </tr>
                @endif

                <tr>
                    <td class="customers bs-0 fz-9" colspan="5" style="padding: 10px; width: 100%; border-collapse: collapse">
                        <thead>
                            <tr>
                                <th colspan="2" class="text-uppercase text-dark fz-9 font-normal text-nowrap" style="text-align: {{$direction === "rtl" ? 'end' : 'start' }}">
                                    {{ translate('item_Description') }}
                                </th>
                                <th class="text-uppercase fz-9 text-dark font-normal text-center text-nowrap">
                                    {{ translate('qty') }}
                                </th>
                                <th class="text-uppercase text-dark fz-9 font-normal text-right text-nowrap">
                                    {{ translate('unit_Price') }}
                                </th>
                                <th class="text-right text-dark text-uppercase fz-9 font-normal text-nowrap">
                                    {{ translate('total') }}
                                </th>
                            </tr>
                        </thead>
                            <?php
                            $total = 0;
                            $itemPrice = 0;
                            $subTotal = 0;
                            $totalTax = 0;
                            $totalShippingCost = 0;
                            $totalDiscountOnProduct = 0;
                            $extraDiscount = 0;
                            ?>
                            <tbody>
                            @foreach($order->details as $key=>$details)
                                @php($productDetails = $details?->product ?? json_decode($details->product_details) )
                                @php($itemPrice += $details['price'] * $details['qty'])
                                <tr>
                                    <td colspan="2" class="text-wrap">
                                        <div class="fs-12 font-semibold">
                                            {{$productDetails->name}}
                                        </div>
                                        <div class="fs-10">
                                            @if($details['variant'])
                                                <br>
                                                {{ translate('variation') }} : {{$details['variant'] }}
                                            @endif
                                        </div>
                                    </td>
                                    <td class="text-center text-nowrap">
                                        <div class="fs-10 text-dark">{{$details->qty}}</div>
                                    </td>
                                    <td class="text-right text-nowrap">
                                        <div class="fs-10 text-dark">
                                            {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $details['price']), currencyCode: getCurrencyCode()) }}
                                        </div>
                                    </td>
                                    <td class="text-right text-nowrap">
                                        <div class="fs-10 text-dark">
                                            {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $details['price'] * $details['qty']), currencyCode: getCurrencyCode()) }}
                                        </div>
                                    </td>
                                </tr>
                                    <?php
                                    $subTotal += ($details['price'] * $details['qty']) - $details['discount'];
                                    $totalTax += $details['tax'];
                                    $totalShippingCost += $details->shipping ? $details->shipping->cost : 0;
                                    $totalDiscountOnProduct += $details['discount'];
                                    $total += $subTotal;
                                    ?>
                            @endforeach
                            </tbody>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="pt-0 pb-0">
                        <table class="fs-10">
                            <tr>
                                <th class="text-left" style="width:50%; vertical-align: top;">
                                    <table class="note" style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td class="text-left text-dark fs-12">
                                                    @if($order['payment_method'] == 'cash_on_delivery' && $order['bring_change_amount'] > 0)
                                                        <span class="font-bold">* </span>
                                                        <span>
                                                            {{ translate('please_ensure_the_deliveryman_has') }}
                                                            <span class="font-weight-semibold">
                                                                {{ $order['bring_change_amount'] }} {{ $order['bring_change_amount_currency'] ?? '' }}
                                                            </span> {{ translate('in_change_ready_for_the_customer') }}
                                                        </span>
                                                    @endif
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </th>
                                <th class="calc-table">
                                    <table>
                                        <tbody>
                                        <tr>
                                            <td class="text-left font-bold">{{ translate('total_Item_Price') }}</td>
                                            <td class="text-right">
                                                {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['itemPrice']), currencyCode: getCurrencyCode()) }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-left font-bold">{{ translate('product_Discount') }}</td>
                                            <td class="text-right">
                                                - {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['itemDiscount']), currencyCode: getCurrencyCode()) }}</td>
                                        </tr>
                                        @if ($order->order_type != 'default_type')
                                            <tr>
                                                <td class="text-left font-bold">{{ translate('extra_Discount') }}</td>
                                                <td class="text-right">
                                                    - {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['extraDiscount']), currencyCode: getCurrencyCode()) }}
                                                </td>
                                            </tr>
                                        @endif
                                        <tr>
                                            <td class="text-left font-bold">{{ translate('sub_Total') }}</td>
                                            <td class="text-right">
                                                {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['subTotal']), currencyCode: getCurrencyCode()) }}
                                            </td>
                                        </tr>
                                        @if($order->order_type == 'default_type' && $order?->is_shipping_free != 1)
                                            <tr>
                                                <td class="text-left font-bold">{{ translate('shipping') }}</td>
                                                <td class="text-right">
                                                    {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['shippingTotal']), currencyCode: getCurrencyCode()) }}</td>
                                            </tr>
                                        @endif
                                        <tr>
                                            <td class="text-left font-bold">{{ translate('coupon_Discount') }}</td>
                                            <td class="text-right">
                                                - {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['couponDiscount']), currencyCode: getCurrencyCode()) }}</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left font-bold">{{ translate('tax') }}</td>
                                            <td class="text-right">
                                                {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['taxTotal']), currencyCode: getCurrencyCode()) }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="border-dashed-top font-weight-bold text-left fz-14 font-bold">
                                                {{ translate('total') }}</td>
                                            <td class="border-dashed-top font-weight-bold text-right fz-14">
                                                {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['totalAmount']), currencyCode: getCurrencyCode()) }}
                                            </td>
                                        </tr>
                                        @if ($order->order_type == 'POS' || $order->order_type == 'pos')
                                            <tr>
                                                <td class="border-dashed-top font-weight-bold text-left fz-14 font-bold">
                                                    {{ translate('paid_amount') }}</td>
                                                <td class="border-dashed-top font-weight-bold text-right fz-14">
                                                    {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['paidAmount']), currencyCode: getCurrencyCode()) }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-dashed-top font-weight-bold text-left fz-14 font-bold">
                                                    {{ translate('change_amount') }}</td>
                                                <td class="border-dashed-top font-weight-bold text-right fz-14">
                                                    {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $orderTotalPriceSummary['changeAmount']), currencyCode: getCurrencyCode()) }}
                                                </td>
                                            </tr>
                                        @endif
                                        </tbody>
                                    </table>
                                </th>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="font-semibold fs-12 pt-0" style="text-align: center;padding-bottom: 14px">
                        {{ translate('thanks_for_the_purchase').'.' }}
                    </td>
                </tr>
            </table>
            <br>
            @if(isset($invoiceSettings['terms_and_condition']) && $invoiceSettings['terms_and_condition'])
                <table>
                    <tr>
                        <td class="text-dark" style="font-size: 14px; font-weight:600; margin:0">
                            {{ translate('terms_&_Conditions') }}
                            <div class="fs-10 font-normal">
                                {{ $invoiceSettings['terms_and_condition'].'.' }}
                            </div>
                        </td>
                    </tr>
                </table>
            @endif
        </div>
    </body>
</html>
