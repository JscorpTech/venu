<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ 'Expense Transaction Statement - '.$data['duration'] }}</title>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="{{dynamicAsset(path: 'public/assets/back-end/css/google-fonts.css')}}">
    <link rel="stylesheet" href="{{ dynamicAsset(path: 'public/assets/back-end/css/admin/order-transaction.css') }}">
</head>

<body>
<table class="content-position">
    <tr>
        <td>
            <table class="bs-0">
                <tr>
                    <th class="h3 p-0 text-left">
                        {{translate('expense_Transaction_Statement')}}
                    </th>
                    <th class="p-0 text-right">
                        @php($invoiceSettings = getWebConfig(name: 'invoice_settings'))
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
                    </th>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="pt-0">
            <table class="bs-0">
                <tr>
                    <td class="p-0 text-left">
                        <b class="bold black">{{translate('date')}}</b> : {{ date('F d, Y') }} <span
                            class="block h-5"></span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table class="content-position">
    <tr>
        <td class="pt-0">
            <table class="bs-0">
                <tr>
                    <td class="p-0 text-left">
                        <span class="bold black p-0 text-left">{{translate('duration')}}</span> :
                        <span class="p-0 p-3 text-capitalize">{{ $data['duration'] }}</span>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="p-0 text-left">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td class="pt-0">
            <table class="bs-0 __product-table inter">
                <tbody>
                <tr>
                    <td style="background-color: #0177CD !important; color: white; font-weight: bold;text-align:center">{{translate('SL')}}</td>
                    <td style="background-color: #0177CD !important; color: white; font-weight: bold">{{translate('details')}}</td>
                    <td class="text-right"
                        style="background-color: #0177CD !important; color: white; font-weight: bold">{{translate('amount')}}</td>
                </tr>
                <tr>
                    <td class="text-center">1</td>
                    <td>{{translate('total_Expense_Amount')}}</td>
                    <td class="text-right">
                        {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $data['total_expense']), currencyCode: getCurrencyCode()) }}
                    </td>
                </tr>
                <tr>
                    <td class="text-center">2</td>
                    <td>{{translate('free_Delivery_Amount')}}</td>
                    <td class="text-right">
                        {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $data['free_delivery']), currencyCode: getCurrencyCode()) }}
                    </td>
                </tr>
                <tr>
                    <td class="text-center">3</td>
                    <td>{{translate('coupon_Discount_Amount')}}</td>
                    <td class="text-right">
                        {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $data['coupon_discount']), currencyCode: getCurrencyCode()) }}
                    </td>
                </tr>
                <tr>
                    <td class="text-center">4</td>
                    <td>{{translate('free_Shipping_Over_Order_Amount_Discount')}}</td>
                    <td class="text-right">
                        {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $data['free_over_amount_discount']), currencyCode: getCurrencyCode()) }}
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table class="">
    <tr>
        <th class="content-position-y bg-light py-4 footer">
            <div class="d-flex justify-content-center gap-2">
                <div class="mb-2">
                    <i class="fa fa-phone"></i>
                    {{translate('phone')}}
                    : {{ $data['company_phone'] }}
                </div>
                <div class="mb-2">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                    {{translate('email')}}
                    : {{ $data['company_email'] }}
                </div>
            </div>
            <div class="mb-2">
                {{url('/')}}
            </div>
            <div>
                {{translate('all_copy_right_reserved_©_'.date('Y').'_').$data['company_name']}}
            </div>
        </th>
    </tr>
</table>
</body>
</html>
