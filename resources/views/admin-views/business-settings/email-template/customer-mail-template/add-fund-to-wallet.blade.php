<div>
    <div class="text-center">
        <img width="100" class="mb-4" id="view-mail-icon"
             src="{{ $template->image_full_url['path'] ?? dynamicAsset(path: 'public/assets/back-end/img/email-template/add-fund-wallet.png')}}"
             alt="">
        <h3 class="mb-3 view-mail-title text-capitalize">
            {{$title ?? translate('transaction_successful')}}
        </h3>
    </div>

    <div class="view-mail-body">
        {!! $body !!}
    </div>
    <div class="text-center">
        <p><span class="text-primary">{{translate('note')}}:</span> {{ isset($data['walletTransaction']) ? ($data['walletTransaction']->transaction_type=='add_fund_by_admin' ? translate('reward_by_company_admin') : translate('loyalty_point_to_wallet')): translate('reward_by_company_admin') }}</p>
    </div>
    <div class="email-table p-2 bg-color-white-smoke table-responsive">
        <table class="table table-borderless align-middle">
            <tbody>
            <tr>
                <th class="text-nowrap">{{ translate('transaction_Id') }}</th>
                <th>{{ translate('transaction_date') }}</th>
                <th>{{ translate('credit') }}</th>
                <th>{{ translate('debit') }}</th>
                <th>{{ translate('balance') }}</th>
            </tr>
            <tr>
                <td>{{$data['walletTransaction']->transaction_id ?? 'ebdaa18c'}}</td>
                <td class="word-break">{{date('d M,Y h:i:A',strtotime($data['walletTransaction']->created_at??now()))}}</td>
                <td>{{ isset($data['walletTransaction']) ? webCurrencyConverter(amount: $data['walletTransaction']->credit) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 5000), currencyCode: getCurrencyCode())}}</td>
                <td>{{ isset($data['walletTransaction']) ? webCurrencyConverter(amount: $data['walletTransaction']->debit) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 700), currencyCode: getCurrencyCode())}}</td>
                <td>{{ isset($data['walletTransaction']) ? webCurrencyConverter(amount: $data['walletTransaction']->balance) :setCurrencySymbol(amount: usdToDefaultCurrency(amount: 1000), currencyCode: getCurrencyCode())}}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <hr>
    @include('admin-views.business-settings.email-template.partials-design.footer')
</div>
