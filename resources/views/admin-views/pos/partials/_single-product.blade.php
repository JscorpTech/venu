<div class="pos-product-item card action-select-product" data-id="{{ $product['id'] }}">
    <div class="pos-product-item_thumb position-relative">
        @if($product?->clearanceSale)
            <div class="position-absolute badge badge-soft-warning user-select-none m-2">
                {{ translate('Clearance_Sale') }}
            </div>
        @endif
        <img class="img-fit aspect-1" src="{{ getStorageImages(path:$product->thumbnail_full_url, type: 'backend-product') }}"
             alt="{{ $product['name'] }}">
    </div>

    <div class="pos-product-item_content clickable">
        <div class="pos-product-item_title">
            {{ $product['name'] }}
        </div>
        <div class="pos-product-item_price">
            {{ getProductPriceByType(product: $product, type: 'discounted_unit_price', result: 'string', price: $product['unit_price'], from: 'panel') }}
        </div>
        <div class="pos-product-item_hover-content">
            <div class="d-flex flex-wrap gap-2">
                <span class="fz-22 text-capitalize">
                    {{ $product['product_type'] == 'physical' ? ($product['current_stock'] >0 ? $product['current_stock'].' '.$product['unit'].($product['current_stock']>1?'s':'') : translate('out_of_stock').'.') : translate('click_for_details').'.' }}
                </span>
            </div>
        </div>
    </div>
</div>
