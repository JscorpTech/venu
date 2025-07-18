@extends('layouts.admin.app')

@section('title', translate('deal_Product'))

@section('content')
    <div class="content container-fluid">
        <div class="mb-3">
            <h2 class="h1 mb-0 text-capitalize">
                <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/inhouse-product-list.png') }}" class="mb-1 mr-1" alt="">
                {{ translate('add_new_product') }}
            </h2>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="mb-0 text-capitalize">{{ $deal['title'] }}</h3>
                    </div>
                    <div class="card-body">
                        <form action="{{route('admin.deal.add-product',[$deal['id']]) }}" method="post">
                            @csrf
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12 mt-3">
                                        <label for="name" class="form-label">{{ translate('select_products') }}</label>
                                        <div class="dropdown select-product-search w-100">
                                            <div class="search-form" data-bs-toggle="dropdown" aria-expanded="false">
                                                <button type="button" class="btn bg-transparent shadow-none border-0 h-100"><i class="fi fi-sr-angle-down"></i></button>
                                                <input type="text" class="js-form-search form-control search-bar-input search-product" placeholder="{{ translate('search_by_product_name').'...' }}" multiple>
                                            </div>
                                            <div class="dropdown-menu w-100 px-2">
                                                <div class="d-flex flex-column max-h-300 overflow-y-auto overflow-x-hidden search-result-box">
                                                    @include('admin-views.partials._search-product',['products'=>$products])
                                                </div>
                                            </div>
                                        </div>
                                        <div class="selected-products d-flex flex-wrap gap-3 mt-3" id="selected-products">
                                            @include('admin-views.partials._select-product')
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex gap-3 justify-content-end">
                                <button type="button" class="btn btn-secondary fw-bold px-4 reset-selected-products">{{ translate('reset') }}</button>
                                <button type="submit" class="btn btn-primary fw-bold px-4">{{ translate('add') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                <div class="card">
                    <div class="px-3 py-4">
                        <h3 class="mb-0 text-capitalize">
                            {{ translate('product_table') }}
                            <span class="badge text-dark bg-body-secondary fw-semibold rounded-50">{{ $dealProducts->total() }}</span>
                        </h3>
                    </div>
                    <div class="table-responsive">
                        <table
                            class="table table-hover table-borderless table-thead-bordered align-middle">
                            <thead class="text-capitalize">
                            <tr>
                                <th>{{ translate('SL') }}</th>
                                <th>{{ translate('image') }}</th>
                                <th>{{ translate('name') }}</th>
                                <th>{{ translate('shop') }}</th>
                                <th>{{ translate('price') }}</th>
                                <th class="text-center">{{ translate('action') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                                @php($companyName = getWebConfig(name: 'company_name'))
                                @foreach($dealProducts as $key => $product)
                                    <tr>
                                        <td>{{ $dealProducts->firstitem() + $key}}</td>
                                        <td>
                                            <div class="avatar-60 d-flex align-items-center rounded">
                                                <img class="img-fluid aspect-1 rounded border" alt=""
                                                     src="{{ getStorageImages(path: $product->thumbnail_full_url, type: 'product') }}">
                                            </div>
                                        </td>
                                        <td>
                                            <a href="javascript:" target="_blank"
                                               class="fw-semibold text-dark text-hover-primary">{{ $product['name'] }}</a>
                                        </td>
                                        <td>
                                            @if($product->added_by == 'admin')
                                                <a href="javascript:"
                                                   class="fw-semibold text-dark text-hover-primary">
                                                    {{ $companyName }}
                                                </a>
                                            @else
                                                <a href="javascript:"
                                                   class="fw-semibold text-dark text-hover-primary">{{ $product?->seller?->shop['name'] ?? translate('shop_not_found').'!!!' }}</a>
                                            @endif
                                        </td>
                                        <td>{{setCurrencySymbol(usdToDefaultCurrency(amount: $product['unit_price'])) }}</td>
                                        <td>
                                            <div class="d-flex justify-content-center">
                                                <a title="{{ translate ('delete') }}"
                                                   class="btn btn-outline-danger icon-btn delete-data-without-form"
                                                   data-action="{{route('admin.deal.delete-product') }}" data-id="{{ $product['id'] }}">
                                                    <i class="fi fi-rr-trash"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <table>
                            <tfoot>
                            {!! $dealProducts->links() !!}
                            </tfoot>
                        </table>
                    </div>
                    @if(count($dealProducts)==0)
                        @include('layouts.admin.partials._empty-state',['text'=>'no_product_select_yet'],['image'=>'default'])
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="{{ dynamicAsset(path: 'public/assets/back-end/js/search-and-select-multiple-product.js') }}"></script>
@endpush
