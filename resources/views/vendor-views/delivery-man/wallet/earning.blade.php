@extends('layouts.vendor.app')

@section('title',translate('earning_statement'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <div class="mb-3">
            <h2 class="h1 mb-0 text-capitalize d-flex align-items-center gap-2">
                <img src="{{dynamicAsset(path: 'public/assets/back-end/img/add-new-seller.png')}}" alt="">
                {{translate('earning_Statement')}}
            </h2>
        </div>
        @include('vendor-views.delivery-man.pages-inline-menu')
        <div class="card mb-3">
            <div class="card-body">

                <div class="row justify-content-between align-items-center g-2 mb-3">
                    <div class="col-sm-6">
                        <h4 class="d-flex align-items-center text-capitalize gap-10 mb-0">
                            {{ translate('earning_statement') }}
                        </h4>
                    </div>
                </div>

                <div class="row g-2">
                    <div class="col-sm-6 col-lg-4">
                        <div class="business-analytics">
                            <h5 class="business-analytics__subtitle">{{ translate('total_earning') }}</h5>
                            <h2 class="business-analytics__title">
                                {{ $totalEarn ? setCurrencySymbol(amount: usdToDefaultCurrency(amount: $totalEarn), currencyCode: getCurrencyCode()) : setCurrencySymbol(amount: 0, currencyCode: getCurrencyCode()) }}
                            </h2>
                            <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/aw.png') }}" width="40" class="business-analytics__img" alt="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4">
                        <div class="business-analytics">
                            <h5 class="business-analytics__subtitle">{{ translate('withdrawable_balance') }}</h5>
                            <h2 class="business-analytics__title">{{ $withdrawableBalance? setCurrencySymbol(amount: usdToDefaultCurrency(amount: $withdrawableBalance)) : setCurrencySymbol(amount: 0) }}</h2>
                            <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/pw.png') }}" width="40" class="business-analytics__img" alt="">
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4">
                        <div class="business-analytics">
                            <h5 class="business-analytics__subtitle">{{ translate('withdrawn') }}</h5>
                            <h2 class="business-analytics__title">{{ $deliveryMan->wallet? setCurrencySymbol(amount: usdToDefaultCurrency(amount: $deliveryMan->wallet->total_withdraw), currencyCode: getCurrencyCode()) : setCurrencySymbol(amount: 0, currencyCode: getCurrencyCode()) }}</h2>
                            <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/withdraw.png') }}" width="40" class="business-analytics__img" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mb-3">
            <div class="card-body">
                <div class="px-3 py-4">
                    <div class="row align-items-center">
                        <div class="col-md-4 col-lg-6 mb-2 mb-md-0">
                            <h4 class="d-flex align-items-center text-capitalize gap-10 mb-0">
                                {{ translate('earning_history') }}
                                <span class="badge badge-soft-dark radius-50 fs-12 ml-1">{{ $orders->total() }}</span>
                            </h4>
                        </div>
                        <div class="col-md-8 col-lg-6">
                            <div class="d-flex align-items-center justify-content-md-end flex-wrap flex-sm-nowrap gap-2">
                                <form action="" method="GET">
                                    <div class="input-group input-group-merge input-group-custom">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch_" type="search" name="search" class="form-control" placeholder="{{ translate('search_by_order_no') }}" aria-label="Search orders" value="{{$searchValue?? ''}}">
                                        <button type="submit" class="btn btn--primary">
                                            {{ translate('Search') }}
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-2">
                    <div class="col-sm-12 mb-3">
                        <div class="card">
                            <div class="table-responsive datatable-custom">
                                <table class="table table-hover table-borderless table-thead-bordered table-align-middle card-table text-left">
                                    <thead class="thead-light thead-50 text-capitalize table-nowrap">
                                    <tr>
                                        <th>{{ translate('SL') }}</th>
                                        <th>{{ translate('order_no') }}</th>
                                        <th>{{ translate('earning') }}</th>
                                        <th class="text-center">{{ translate('status') }}</th>
                                    </tr>
                                    </thead>

                                    <tbody id="set-rows">
                                    @foreach($orders as $key=>$order)
                                        <tr>
                                            <td>{{ $orders->firstItem()+$key }}</td>
                                            <td>
                                                <div class="media align-items-center gap-10 flex-wrap">
                                                    <div class="media-body">
                                                        <a  class="title-color hover-c1" href="{{route('vendor.orders.details',$order['id'])}}">{{$order['id']}}</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex flex-column gap-1">
                                                    <div class="media-body">{{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $order->deliveryman_charge), currencyCode: getCurrencyCode()) }}</div>

                                                </div>
                                            </td>
                                            <td class="text-center text-capitalize">
                                                @if($order['order_status']=='pending')
                                                    <span class="badge badge-soft-info fs-12">
                                                    {{$order['order_status']}}
                                            </span>

                                                @elseif($order['order_status']=='processing' || $order['order_status']=='out_for_delivery')
                                                    <span class="badge badge-soft-warning fs-12">
                                                {{str_replace('_',' ',$order['order_status'] == 'processing' ? 'packaging':$order['order_status'])}}
                                            </span>
                                                @elseif($order['order_status']=='confirmed')
                                                    <span class="badge badge-soft-success fs-12">
                                                {{$order['order_status']}}
                                            </span>
                                                @elseif($order['order_status']=='failed')
                                                    <span class="badge badge-danger fs-12">
                                                {{$order['order_status'] == 'failed' ? 'Failed To Deliver' : ''}}
                                            </span>
                                                @elseif($order['order_status']=='delivered')
                                                    <span class="badge badge-soft-success fs-12">
                                                {{$order['order_status']}}
                                            </span>
                                                @else
                                                    <span class="badge badge-soft-danger fs-12">
                                                {{$order['order_status']}}
                                            </span>
                                                @endif
                                            </td>

                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-responsive mt-4">
                                <div class="px-4 d-flex justify-content-lg-end">
                                    {{ $orders->links() }}
                                </div>
                            </div>
                            @if(count($orders)==0)
                                @include('layouts.vendor.partials._empty-state',['text'=>'no_order_found'],['image'=>'default'])
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection
