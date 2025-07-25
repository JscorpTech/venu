<div class="d-flex justify-content-end position-relative z-1">
    <button type="button" class="btn border-0 fs-18 m-2 p-0 text-white position-absolute" data-bs-dismiss="modal" aria-label="Close">
        <i class="fi fi-sr-cross-small"></i>
    </button>
</div>
<div class="coupon__details">
    <div class="coupon__details-left">
        <div class="text-center">
            <h3 class="fw-bold mb-2" id="title">{{ $coupon->title }}</h3>
            <h4 class="fw-bold mb-2">{{translate('code') }} : <span id="coupon_code">{{ $coupon->code }}</span></h4>
            <div class="text-capitalize">
                <span>{{translate(str_replace('_',' ',$coupon->coupon_type)) }}</span>
            </div>
        </div>
        <div class="coupon-info">
            <div class="coupon-info-item">
                <span>{{translate('minimum_purchase')}} :</span>
                <strong id="min_purchase">{{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $coupon->min_purchase), currencyCode: getCurrencyCode())  }}</strong>
            </div>
            @if($coupon->coupon_type != 'free_delivery' && $coupon->discount_type == 'percentage')
            <div class="coupon-info-item" id="max_discount_modal_div">
                <span>{{translate('maximum_discount')}} : </span>
                <strong id="max_discount">{{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $coupon->max_discount), currencyCode: getCurrencyCode()) }}</strong>
            </div>
            @endif
            <div class="coupon-info-item">
                <span>{{translate('start_date')}} : </span>
                <span id="start_date">{{ \Carbon\Carbon::parse($coupon->start_date)->format('dS M Y') }}</span>
            </div>
            <div class="coupon-info-item">
                <span>{{translate('expire_date')}} : </span>
                <span id="expire_date">{{ \Carbon\Carbon::parse($coupon->expire_date)->format('dS M Y') }}</span>
            </div>
            <div class="coupon-info-item">
                <span>{{translate('discount_bearer')}} : </span>
                <span id="expire_date">
                    @if($coupon->coupon_bearer == 'inhouse')
                        {{ translate('admin') }}
                    @elseif($coupon->coupon_bearer == 'seller')
                        {{ translate('vendor') }}
                    @endif
                </span>
            </div>
        </div>
    </div>
    <div class="coupon__details-right">
        <div class="coupon">
            @if($coupon->coupon_type == 'free_delivery')
                <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/free-delivery.png') }}" alt="{{translate('free_delivery')}}" width="100">
            @else
                <div class="d-flex">
                    <h4 id="discount">
                        {{$coupon->discount_type=='amount' ? setCurrencySymbol(amount: usdToDefaultCurrency(amount: $coupon->discount), currencyCode: getCurrencyCode()) : $coupon->discount.'%' }}
                    </h4>
                </div>

                <span>{{translate('off')}}</span>
            @endif
        </div>
    </div>
</div>
