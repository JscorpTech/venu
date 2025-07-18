@if (count($products) > 0)
    <ul class="list-group list-unstyled gap-3">
        @foreach($products as $product)
            <li class="select-product-item">
                <div class="select-product-item media gap-3 border-bottom py-2 cursor-pointer action-select-product"
                     data-id="{{ $product['id'] }}">
                    <img class="avatar avatar-xl border" width="75"
                         src="{{ getStorageImages(path: $product?->thumbnail_full_url ?? '', type: 'backend-product') }}"
                         alt="">
                    <div class="media-body d-flex flex-column gap-1">
                        <h6 class="product-id" hidden>{{$product['id']}}</h6>
                        <h6 class="fz-13 mb-1 text-truncate custom-width product-name ">{{$product['name']}}</h6>
                        <div class="fs-10">{{ translate('category') }}: {{ $product?->category?->name ?? 'N/a' }}</div>
                        <div class="fs-10">{{ translate('brand_Name') }}: {{ $product?->brand?->name }}</div>
                        @if ($product->added_by == 'admin')
                            <div class="fs-10">{{ translate('vendor') }}: {{ $web_config['company_name'] }}</div>
                        @else
                            <div class="fs-10">
                                {{ translate('vendor') }}
                                : {{isset($product?->seller) ? $product?->seller?->shop?->name : translate('shop_not_found') }}
                            </div>
                        @endif
                    </div>
                </div>
            </li>
        @endforeach
    </ul>
@else
    <div>
        <h5 class="m-0 text-muted">{{ translate('No_Product_Found') }}</h5>
    </div>
@endif
