<form action="{{route('admin.pos.place-order') }}" method="post" id='order-place'>
    @csrf
    <div id="cart">
        <div class="table-responsive pos-cart-table border">
            <table class="table table-align-middle m-0">
                <thead class="text-capitalize bg-light">
                    <tr>
                        <th class="border-0 min-w-120">{{ translate('item') }}</th>
                        <th class="border-0">{{ translate('qty') }}</th>
                        <th class="border-0">{{ translate('price') }}</th>
                        <th class="border-0 text-center">{{ translate('delete') }}</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($cartItems['cartItemValue'] as $key => $item)
                        @if(is_array($item))
                            <tr>
                            <td>
                                <div class="media d-flex align-items-center gap-10">
                                    <img class="avatar avatar-sm"
                                        src="{{ getStorageImages(path:$item['image'], type: 'backend-product') }}"
                                        alt="{{$item['name'].translate('image')}} ">
                                    <div class="media-body">
                                        <h5 class="text-hover-primary mb-0 d-flex flex-wrap gap-2">
                                            {{Str::limit($item['name'], 12)}}
                                            @if($item['tax_model'] == 'include')
                                                <span class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{{ translate('tax_included') }}">
                                                    <img class="info-img" src="{{ dynamicAsset(path: 'public/assets/back-end/img/info-circle.svg') }}" alt="img">
                                                </span>
                                            @endif
                                        </h5>
                                        <small>{{Str::limit($item['variant'], 20)}}</small>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <input type="text" inputmode="numeric" pattern="[0-9]*" data-key="{{$key}}" class="form-control qty action-pos-update-quantity w-max-content" value="{{$item['quantity']}}" min="1"
                                    data-product-key="{{ $item['id'] }}"
                                    data-product-variant="{{ $item['variant'] }}">
                            </td>
                            <td>
                                <div>
                                    {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount:$item['productSubtotal']), currencyCode: getCurrencyCode()) }}
                                </div>
                            </td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <a href="javascript:" data-id="{{$item['id']}}" data-variant ="{{$item['variant']}}" class="btn btn-danger rounded-circle icon-btn remove-from-cart">
                                        <i class="fi fi-rr-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="pt-4 pb-60">
            <dl>
                <div class="d-flex gap-2 justify-content-between">
                    <dt class="title-color text-capitalize font-weight-normal">{{ translate('sub_total') }} : </dt>
                    <dd>{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $cartItems['subtotal'] + $cartItems['discountOnProduct']), currencyCode: getCurrencyCode())}}</dd>
                </div>

                <div class="d-flex gap-2 justify-content-between">
                    <dt class="title-color text-capitalize font-weight-normal">{{ translate('product_Discount') }} :</dt>
                    <dd>{{setCurrencySymbol(amount: usdToDefaultCurrency(amount:round($cartItems['discountOnProduct'], 2)), currencyCode: getCurrencyCode()) }}</dd>
                </div>

                <div class="d-flex gap-2 justify-content-between">
                    <dt class="title-color text-capitalize font-weight-normal">{{ translate('extra_Discount') }} :</dt>
                    <dd>
                        <button id="extra_discount" class="btn btn-sm p-0" type="button" data-bs-toggle="modal" data-bs-target="#add-discount">
                            <i class="fi fi-rr-pencil"></i>
                        </button>
                        {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $cartItems['extraDiscount']), currencyCode: getCurrencyCode()) }}
                    </dd>
                </div>

                <div class="d-flex justify-content-between">
                    <dt class="title-color gap-2 text-capitalize font-weight-normal">{{ translate('coupon_Discount') }} :</dt>
                    <dd>
                        <button id="coupon_discount" class="btn btn-sm p-0" type="button" data-bs-toggle="modal" data-bs-target="#add-coupon-discount">
                            <i class="fi fi-rr-pencil"></i>
                        </button>
                        {{setCurrencySymbol(amount: usdToDefaultCurrency(amount:$cartItems['couponDiscount']), currencyCode: getCurrencyCode())}}
                    </dd>
                </div>

                <div class="d-flex gap-2 justify-content-between">
                    <dt class="title-color text-capitalize font-weight-normal">{{ translate('tax') }} : </dt>
                    <dd>{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: round($cartItems['totalTax'],2) ), currencyCode: getCurrencyCode())}}</dd>
                </div>

                <div class="d-flex gap-2 border-top justify-content-between pt-2">
                    <dt class="title-color text-capitalize font-weight-bold title-color">{{ translate('total') }} : </dt>
                    <dd class="font-weight-bold title-color">{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: ($cartItems['total'] + $cartItems['totalTax'] - $cartItems['couponDiscount'])), currencyCode: getCurrencyCode())}}</dd>
                </div>
            </dl>

            <div class="form-group col-12">
                <input type="hidden" class="form-control total-amount" name="amount" min="0" step="0.01"
                        value="{{usdToDefaultCurrency(amount: $cartItems['total']+$cartItems['totalTax']-$cartItems['couponDiscount'])}}"
                        readonly>
            </div>
            <div class="p-4 bg-section rounded mt-4">
                <div>
                    <div class="text-dark d-flex mb-2">{{ translate('paid_By') }}:</div>
                    <ul class="list-unstyled option-buttons d-flex flex-wrap gap-2 align-items-center">
                        <li>
                            <input type="radio" class="paid-by-cash" id="cash" value="cash" name="type" hidden checked>
                            <label for="cash" class="btn btn-outline-dark btn-sm mb-0">{{ translate('cash') }}</label>
                        </li>
                        <li>
                            <input type="radio" value="card" id="card" name="type" hidden>
                            <label for="card" class="btn btn-outline-dark btn-sm mb-0">{{ translate('card') }}</label>
                        </li>
                        @php( $walletStatus = getWebConfig('wallet_status') ?? 0)
                        @if ($walletStatus)
                        <li class="{{ (str_contains(session('current_user'), 'walking-customer')) ? 'd-none':'' }}">
                            <input type="radio" value="wallet" id="wallet" name="type" hidden>
                            <label for="wallet" class="btn btn-outline-dark btn-sm mb-0">{{ translate('wallet') }}</label>
                        </li>
                        @endif
                    </ul>
                </div>
                <div class="cash-change-amount cash-change-section">
                    <div class="d-flex gap-2 justify-content-between align-items-center pt-4">
                        <dt class="text-capitalize font-weight-normal">{{ translate('Paid_Amount') }} : </dt>
                        <dd>
                            <input type="number" class="form-control text-end pos-paid-amount-element remove-spin" placeholder="{{ translate('ex') }}: 1000"
                            value="{{usdToDefaultCurrency(amount: $cartItems['total']+$cartItems['totalTax']-$cartItems['couponDiscount'])}}"
                            name="paid_amount"
                            min="{{ usdToDefaultCurrency(amount: ($cartItems['total'] + $cartItems['totalTax'] - $cartItems['couponDiscount'])) }}"
                            data-currency-position="{{ getWebConfig('currency_symbol_position') }}"
                            data-currency-symbol="{{ getCurrencySymbol() }}">
                        </dd>
                    </div>
                    <div class="d-flex gap-2 justify-content-between align-items-center">
                        <dt class="text-capitalize font-weight-normal">{{ translate('Change_Amount') }} : </dt>
                        <dd class="font-weight-bold title-color pos-change-amount-element">{{ setCurrencySymbol(amount: 0) }}</dd>
                    </div>
                </div>
                <div class="cash-change-card cash-change-section d-none">
                    <div class="d-flex gap-2 justify-content-between align-items-center pt-4">
                        <dt class="text-capitalize font-weight-normal">{{ translate('Paid_Amount') }} : </dt>
                        <dd>
                            <input type="number" class="form-control text-end" placeholder="{{ translate('ex') }}: 1000"
                                   value="{{usdToDefaultCurrency(amount: $cartItems['total']+$cartItems['totalTax']-$cartItems['couponDiscount'])}}" disabled>
                        </dd>
                    </div>
                    <div class="d-flex gap-2 justify-content-between align-items-center">
                        <dt class="text-capitalize font-weight-normal">{{ translate('Change_Amount') }} : </dt>
                        <dd class="font-weight-bold title-color">{{ setCurrencySymbol(amount: 0) }}</dd>
                    </div>
                </div>
                <div class="cash-change-wallet cash-change-section d-none">
                    <div class="d-flex gap-2 justify-content-between align-items-center pt-4">
                        <dt class="text-capitalize font-weight-normal">{{ translate('Paid_Amount') }} : <span class="badge badge-soft-danger" id="message-insufficient-balance" data-text="{{ translate('insufficient_balance') }}"></span></dt>
                        <dd>
                            <input type="number" class="form-control text-end wallet-balance-input" placeholder="{{ translate('ex') }}: 1000"
                                   value="{{usdToDefaultCurrency(amount: $cartItems['total']+$cartItems['totalTax']-$cartItems['couponDiscount'])}}" disabled>
                        </dd>
                    </div>
                    <div class="d-flex gap-2 justify-content-between align-items-center">
                        <dt class="text-capitalize font-weight-normal">{{ translate('Change_Amount') }} : </dt>
                        <dd class="font-weight-bold title-color">{{ setCurrencySymbol(amount: 0) }}</dd>
                    </div>
                </div>

            </div>
        </div>

        <div class="d-flex gap-3 align-items-center pt-3 bottom-absolute-buttons z-1">
            @if($cartItems['countItem'])
                <span class="btn btn-danger btn-block action-empty-cart">
                    <i class="fa fa-times-circle"></i>
                    {{ translate('cancel_Order') }}
                </span>

                <button id="submit_order" type="button" class="btn btn-primary btn-block m-0 action-form-submit" data-message="{{ translate('want_to_place_this_order').'?'}}" data-bs-toggle="modal" data-bs-target="#paymentModal">
                    <i class="fa fa-shopping-bag"></i>
                    {{ translate('place_Order') }}
                </button>
            @else
                <span class="btn btn-danger btn-block action-empty-alert-show">
                    <i class="fa fa-times-circle"></i>
                    {{ translate('cancel_Order') }}
                </span>
                <button type="button" class="btn btn-primary btn-block m-0 action-empty-alert-show">
                    <i class="fa fa-shopping-bag"></i>
                    {{ translate('place_Order') }}
                </button>
            @endif

        </div>
    </div>
</form>

@push('script_2')
<script>
    'use strict';
    $('#type_ext_dis').on('change', function (){
        let type = $('#type_ext_dis').val();
        if(type === 'amount'){
            $('#dis_amount').attr('placeholder', 'Ex: 500');
        }else if(type === 'percent'){
            $('#dis_amount').attr('placeholder', 'Ex: 10%');
        }
    });
    $(function () {
        $('[data-bs-toggle="tooltip"]').tooltip()
    })
</script>
@endpush
