<?php

namespace App\Http\Controllers\Vendor\Product;

use App\Contracts\Repositories\AttributeRepositoryInterface;
use App\Contracts\Repositories\AuthorRepositoryInterface;
use App\Contracts\Repositories\BrandRepositoryInterface;
use App\Contracts\Repositories\BusinessSettingRepositoryInterface;
use App\Contracts\Repositories\CartRepositoryInterface;
use App\Contracts\Repositories\CategoryRepositoryInterface;
use App\Contracts\Repositories\ColorRepositoryInterface;
use App\Contracts\Repositories\DealOfTheDayRepositoryInterface;
use App\Contracts\Repositories\DigitalProductAuthorRepositoryInterface;
use App\Contracts\Repositories\DigitalProductVariationRepositoryInterface;
use App\Contracts\Repositories\FlashDealProductRepositoryInterface;
use App\Contracts\Repositories\ProductRepositoryInterface;
use App\Contracts\Repositories\RestockProductRepositoryInterface;
use App\Contracts\Repositories\RestockProductCustomerRepositoryInterface;
use App\Contracts\Repositories\ProductSeoRepositoryInterface;
use App\Contracts\Repositories\PublishingHouseRepositoryInterface;
use App\Contracts\Repositories\ReviewRepositoryInterface;
use App\Contracts\Repositories\StockClearanceProductRepositoryInterface;
use App\Contracts\Repositories\StockClearanceSetupRepositoryInterface;
use App\Contracts\Repositories\VendorRepositoryInterface;
use App\Contracts\Repositories\WishlistRepositoryInterface;
use App\Enums\ViewPaths\Vendor\Product;
use App\Enums\WebConfigKey;
use App\Exports\ProductListExport;
use App\Exports\RestockProductListExport;
use App\Http\Controllers\BaseController;
use App\Http\Requests\ProductAddRequest;
use App\Http\Requests\ProductUpdateRequest;
use App\Repositories\DigitalProductPublishingHouseRepository;
use App\Repositories\TranslationRepository;
use App\Services\ProductService;
use App\Traits\FileManagerTrait;
use App\Traits\ProductTrait;
use Devrabiul\ToastMagic\Facades\ToastMagic;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use Illuminate\Pagination\LengthAwarePaginator;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class ProductController extends BaseController
{
    use ProductTrait;

    use FileManagerTrait {
        delete as deleteFile;
        update as updateFile;
    }

    public function __construct(
        private readonly AuthorRepositoryInterface                  $authorRepo,
        private readonly PublishingHouseRepositoryInterface         $publishingHouseRepo,
        private readonly DigitalProductAuthorRepositoryInterface    $digitalProductAuthorRepo,
        private readonly DigitalProductPublishingHouseRepository    $digitalProductPublishingHouseRepo,
        private readonly CategoryRepositoryInterface                $categoryRepo,
        private readonly BrandRepositoryInterface                   $brandRepo,
        private readonly ProductRepositoryInterface                 $productRepo,
        private readonly DigitalProductVariationRepositoryInterface $digitalProductVariationRepo,
        private readonly StockClearanceProductRepositoryInterface   $stockClearanceProductRepo,
        private readonly StockClearanceSetupRepositoryInterface     $stockClearanceSetupRepo,
        private readonly ProductSeoRepositoryInterface              $productSeoRepo,
        private readonly RestockProductRepositoryInterface          $restockProductRepo,
        private readonly RestockProductCustomerRepositoryInterface  $restockProductCustomerRepo,
        private readonly TranslationRepository                      $translationRepo,
        private readonly BusinessSettingRepositoryInterface         $businessSettingRepo,
        private readonly ColorRepositoryInterface                   $colorRepo,
        private readonly AttributeRepositoryInterface               $attributeRepo,
        private readonly ReviewRepositoryInterface                  $reviewRepo,
        private readonly CartRepositoryInterface                    $cartRepo,
        private readonly WishlistRepositoryInterface                $wishlistRepo,
        private readonly FlashDealProductRepositoryInterface        $flashDealProductRepo,
        private readonly DealOfTheDayRepositoryInterface            $dealOfTheDayRepo,
        private readonly VendorRepositoryInterface                  $vendorRepo,
        private readonly ProductService                             $productService,
    )
    {
    }

    /**
     * @param Request|null $request
     * @param string|array|null $type
     * @return View|Collection|LengthAwarePaginator|callable|RedirectResponse|null
     * Index function is the starting point of a controller
     */
    public function index(?Request $request, string|array $type = null): View|Collection|LengthAwarePaginator|null|callable|RedirectResponse
    {
        return $this->getListView(request: $request, type: $type);
    }

    public function getListView(Request $request, $type): View
    {
        $vendorId = auth('seller')->id();
        $filters = [
            'added_by' => 'seller',
            'seller_id' => $vendorId,
            'brand_id' => $request['brand_id'],
            'category_id' => $request['category_id'],
            'sub_category_id' => $request['sub_category_id'],
            'sub_sub_category_id' => $request['sub_sub_category_id'],
            'request_status' => $type == 'new-request' ? 0 : ($type == 'approved' ? '1' : ($type == 'denied' ? '2' : 'all')),
        ];
        $searchValue = $request['searchValue'];
        $products = $this->productRepo->getListWhere(
            orderBy: ['id' => 'desc'],
            searchValue: $searchValue,
            filters: $filters,
            relations: ['translations', 'seoInfo', 'clearanceSale' => function ($query) {
                return $query->active();
            }],
            dataLimit: getWebConfig(name: WebConfigKey::PAGINATION_LIMIT)
        );
        $brands = $this->brandRepo->getListWhere(filters: ['status' => 1], dataLimit: 'all');
        $categories = $this->categoryRepo->getListWhere(filters: ['position' => 0], dataLimit: 'all');
        $subCategory = $this->categoryRepo->getFirstWhere(params: ['id' => $request['sub_category_id']]);
        $subSubCategory = $this->categoryRepo->getFirstWhere(params: ['id' => $request['sub_sub_category_id']]);

        return view(Product::LIST[VIEW], compact('products', 'type', 'searchValue', 'brands',
            'categories', 'subCategory', 'subSubCategory', 'filters'));
    }

    public function getRequestRestockListView(Request $request): View|RedirectResponse
    {
        $filters = [
            'added_by' => 'seller',
            'seller_id' => auth('seller')->id(),
            'brand_id' => $request['brand_id'],
            'category_id' => $request['category_id'],
            'sub_category_id' => $request['sub_category_id'],
        ];

        $startDate = '';
        $endDate = '';
        if (isset($request['restock_date']) && !empty($request['restock_date'])) {
            $dates = explode(' - ', $request['restock_date']);
            if (count($dates) !== 2 || !checkDateFormatInMDY($dates[0]) || !checkDateFormatInMDY($dates[1])) {
                ToastMagic::error(translate('Invalid_date_range_format'));
                return back();
            }
            $startDate = Carbon::createFromFormat('m/d/Y', $dates[0])->startOfDay();
            $endDate = Carbon::createFromFormat('m/d/Y', $dates[1])->endOfDay();
        }
        $restockProducts = $this->restockProductRepo->getListWhereBetween(
            orderBy: ['updated_at' => 'desc'],
            searchValue: $request['searchValue'],
            filters: $filters,
            relations: ['product'],
            whereBetween: 'created_at',
            whereBetweenFilters: $startDate && $endDate ? [$startDate, $endDate] : [],
            dataLimit: getWebConfig(name: WebConfigKey::PAGINATION_LIMIT),
        );
        $brands = $this->brandRepo->getListWhere(filters: ['status' => 1], dataLimit: 'all');
        $categories = $this->categoryRepo->getListWhere(filters: ['position' => 0], dataLimit: 'all');
        $subCategory = $this->categoryRepo->getFirstWhere(params: ['id' => $request['sub_category_id']]);
        $totalRestockProducts = $this->restockProductRepo->getListWhere(filters: $filters, dataLimit: 'all')->count();
        return view(\App\Enums\ViewPaths\Vendor\Product::REQUEST_RESTOCK_LIST[VIEW], compact('restockProducts', 'brands',
            'categories', 'subCategory', 'filters', 'totalRestockProducts'));
    }

    public function deleteRestock(string|int $id): RedirectResponse
    {
        $this->restockProductRepo->delete(params: ['id' => $id]);
        $this->restockProductCustomerRepo->delete(params: ['restock_product_id' => $id]);
        ToastMagic::success(translate('product_restock_removed_successfully'));
        return back();
    }

    public function getAddView(): View
    {
        $languages = $this->businessSettingRepo->getFirstWhere(params: ['type' => 'pnc_language']);
        $categories = $this->categoryRepo->getListWhere(filters: ['position' => 0], dataLimit: 'all');
        $brands = $this->brandRepo->getListWhere(filters: ['status' => 1], dataLimit: 'all');
        $brandSetting = getWebConfig(name: 'product_brand');
        $digitalProductSetting = getWebConfig(name: 'digital_product');
        $colors = $this->colorRepo->getList(orderBy: ['name' => 'desc'], dataLimit: 'all');
        $attributes = $this->attributeRepo->getList(orderBy: ['name' => 'desc'], dataLimit: 'all');
        $languages = getWebConfig(name: 'pnc_language') ?? null;
        $defaultLanguage = $languages[0];
        $digitalProductFileTypes = ['audio', 'video', 'document', 'software'];
        $digitalProductAuthors = $this->authorRepo->getListWhere(dataLimit: 'all');
        $publishingHouseList = $this->publishingHouseRepo->getListWhere(dataLimit: 'all');

        return view(Product::ADD[VIEW], compact('languages', 'categories', 'brands', 'brandSetting', 'digitalProductSetting', 'colors', 'attributes', 'languages', 'defaultLanguage', 'digitalProductFileTypes', 'digitalProductAuthors', 'publishingHouseList'));
    }

    public function add(ProductAddRequest $request, ProductService $service): JsonResponse|RedirectResponse
    {
        if ($request->ajax()) {
            return response()->json([], 200);
        }

        $dataArray = $service->getAddProductData(request: $request, addedBy: 'seller');
        $savedProduct = $this->productRepo->add(data: $dataArray);
        $this->productRepo->addRelatedTags(request: $request, product: $savedProduct);
        $this->translationRepo->add(request: $request, model: 'App\Models\Product', id: $savedProduct->id);
        $this->updateProductAuthorAndPublishingHouse(request: $request, product: $savedProduct);

        // Digital Product Variation
        $digitalFileArray = $service->getAddProductDigitalVariationData(request: $request, product: $savedProduct);
        foreach ($digitalFileArray as $digitalFile) {
            $this->digitalProductVariationRepo->add(data: $digitalFile);
        }

        $this->productSeoRepo->add(data: $service->getProductSEOData(request: $request, product: $savedProduct, action: 'add'));

        ToastMagic::success(translate('product_added_successfully'));
        return redirect()->route('vendor.products.list', ['type' => 'all']);
    }

    public function getUpdateView(string|int $id): RedirectResponse|View
    {
        $product = $this->productRepo->getFirstWhereWithoutGlobalScope(params: ['id' => $id, 'user_id' => auth('seller')->id(), 'added_by' => 'seller'], relations: ['translations', 'seoInfo', 'digitalProductAuthors', 'digitalProductPublishingHouse']);
        if (!$product) {
            ToastMagic::error(translate('invalid_product'));
            return redirect()->route('vendor.products.list', ['type' => 'all']);
        }
        $productAuthorIds = $this->productService->getProductAuthorsInfo(product: $product)['ids'];
        $productPublishingHouseIds = $this->productService->getProductPublishingHouseInfo(product: $product)['ids'];

        $product['colors'] = json_decode($product['colors']);
        $categories = $this->categoryRepo->getListWhere(filters: ['position' => 0], dataLimit: 'all');
        $brands = $this->brandRepo->getListWhere(filters: ['status' => 1], dataLimit: 'all');
        $brandSetting = getWebConfig(name: 'product_brand');
        $digitalProductSetting = getWebConfig(name: 'digital_product');
        $colors = $this->colorRepo->getList(orderBy: ['name' => 'desc'], dataLimit: 'all');
        $attributes = $this->attributeRepo->getList(orderBy: ['name' => 'desc'], dataLimit: 'all');
        $languages = getWebConfig(name: 'pnc_language') ?? null;
        $defaultLanguage = $languages[0];
        $digitalProductFileTypes = ['audio', 'video', 'document', 'software'];
        $digitalProductAuthors = $this->authorRepo->getListWhere(dataLimit: 'all');
        $publishingHouseList = $this->publishingHouseRepo->getListWhere(dataLimit: 'all');

        return view(Product::UPDATE[VIEW], compact('product', 'categories', 'brands', 'brandSetting', 'digitalProductSetting', 'colors', 'attributes', 'languages', 'defaultLanguage', 'digitalProductFileTypes', 'digitalProductAuthors', 'publishingHouseList', 'productAuthorIds', 'productPublishingHouseIds'));
    }

    public function update(ProductUpdateRequest $request, ProductService $service, string|int $id): JsonResponse|RedirectResponse
    {
        if ($request->ajax()) {
            return response()->json([], 200);
        }

        $product = $this->productRepo->getFirstWhereWithoutGlobalScope(params: ['id' => $id], relations: ['translations', 'seoInfo']);
        $dataArray = $service->getUpdateProductData(request: $request, product: $product, updateBy: 'seller');
        $this->updateProductAuthorAndPublishingHouse(request: $request, product: $product);

        $this->productRepo->update(id: $id, data: $dataArray);
        $this->productRepo->addRelatedTags(request: $request, product: $product);
        $this->translationRepo->update(request: $request, model: 'App\Models\Product', id: $id);

        self::getDigitalProductUpdateProcess($request, $product);

        $this->productSeoRepo->updateOrInsert(
            params: ['product_id' => $product['id']],
            data: $service->getProductSEOData(request: $request, product: $product, action: 'update')
        );

        $updatedProduct = $this->productRepo->getFirstWhere(params: ['id' => $product['id']]);
        $this->updateRestockRequestListAndNotify(product: $product, updatedProduct: $updatedProduct);
        $this->updateStockClearanceProduct(product: $updatedProduct);

        ToastMagic::success(translate('product_updated_successfully'));
        return redirect()->route(Product::VIEW[ROUTE], ['id' => $product['id']]);
    }

    public function updateStockClearanceProduct($product): void
    {
        $config = $this->stockClearanceSetupRepo->getFirstWhere(params: [
            'setup_by' => $product['added_by'] == 'admin' ? $product['added_by'] : 'vendor',
            'shop_id' => $product['added_by'] == 'admin' ? 0 : $product?->seller?->shop?->id,
        ]);
        $stockClearanceProduct = $this->stockClearanceProductRepo->getFirstWhere(params: ['product_id' => $product['id']]);

        if ($config && $config['discount_type'] == 'product_wise' && $stockClearanceProduct && $stockClearanceProduct['discount_type'] == 'flat') {
            $minimumPrice = $product['unit_price'];
            foreach ((json_decode($product['variation'], true) ?? []) as $variation) {
                if ($variation['price'] < $minimumPrice) {
                    $minimumPrice = $variation['price'];
                }
            }

            if ($minimumPrice < $stockClearanceProduct['discount_amount']) {
                $this->stockClearanceProductRepo->updateByParams(params: ['product_id' => $product['id']], data: ['is_active' => 0]);
            }
        }
    }

    public function updateProductAuthorAndPublishingHouse(object|array $request, object|array $product): void
    {
        if ($request['product_type'] == 'digital') {
            if ($request->has('authors')) {
                $authorIds = [];
                foreach ($request['authors'] as $author) {
                    $authorId = $this->authorRepo->updateOrCreate(params: ['name' => $author], value: ['name' => $author]);
                    $authorIds[] = $authorId?->id;
                }

                foreach ($authorIds as $author) {
                    $productAuthorData = ['author_id' => $author, 'product_id' => $product->id];
                    $this->digitalProductAuthorRepo->updateOrCreate(params: $productAuthorData, value: $productAuthorData);
                }

                $this->digitalProductAuthorRepo->deleteWhereNotIn(filters: ['product_id' => $product->id], whereNotIn: ['author_id' => $authorIds]);
            } else {
                $this->digitalProductAuthorRepo->delete(params: ['product_id' => $product->id]);
            }

            if ($request->has('publishing_house')) {
                $publishingHouseIds = [];
                foreach ($request['publishing_house'] as $publishingHouse) {
                    $publishingHouseId = $this->publishingHouseRepo->updateOrCreate(params: ['name' => $publishingHouse], value: ['name' => $publishingHouse]);
                    $publishingHouseIds[] = $publishingHouseId?->id;
                }

                foreach ($publishingHouseIds as $publishingHouse) {
                    $publishingHouseData = ['publishing_house_id' => $publishingHouse, 'product_id' => $product->id];
                    $this->digitalProductPublishingHouseRepo->updateOrCreate(params: $publishingHouseData, value: $publishingHouseData);
                }
                $this->digitalProductPublishingHouseRepo->deleteWhereNotIn(filters: ['product_id' => $product->id], whereNotIn: ['publishing_house_id' => $publishingHouseIds]);
            } else {
                $this->digitalProductPublishingHouseRepo->delete(params: ['product_id' => $product->id]);
            }
        } else {
            $this->digitalProductAuthorRepo->delete(params: ['product_id' => $product->id]);
            $this->digitalProductPublishingHouseRepo->delete(params: ['product_id' => $product->id]);
        }
    }


    public function getDigitalProductUpdateProcess($request, $product): void
    {
        if ($request->has('digital_product_variant_key') && !$request->hasFile('digital_file_ready')) {
            $getAllVariation = $this->digitalProductVariationRepo->getListWhere(filters: ['product_id' => $product['id']]);
            $getAllVariationKey = $getAllVariation->pluck('variant_key')->toArray();
            $getRequestVariationKey = $request['digital_product_variant_key'];
            $differenceFromDB = array_diff($getAllVariationKey, $getRequestVariationKey);
            $differenceFromRequest = array_diff($getRequestVariationKey, $getAllVariationKey);
            $newCombinations = array_merge($differenceFromDB, $differenceFromRequest);

            foreach ($newCombinations as $newCombination) {
                if (in_array($newCombination, $request['digital_product_variant_key'])) {
                    $uniqueKey = strtolower(str_replace('-', '_', $newCombination));

                    $fileItem = null;
                    if ($request['digital_product_type'] == 'ready_product') {
                        $fileItem = $request->file('digital_files.' . $uniqueKey);
                    }
                    $uploadedFile = '';
                    if ($fileItem) {
                        $uploadedFile = $this->fileUpload(dir: 'product/digital-product/', format: $fileItem->getClientOriginalExtension(), file: $fileItem);
                    }
                    $this->digitalProductVariationRepo->add(data: [
                        'product_id' => $product['id'],
                        'variant_key' => $request->input('digital_product_variant_key.' . $uniqueKey),
                        'sku' => $request->input('digital_product_sku.' . $uniqueKey),
                        'price' => currencyConverter(amount: $request->input('digital_product_price.' . $uniqueKey)),
                        'file' => $uploadedFile,
                    ]);
                }
            }

            foreach ($differenceFromDB as $variation) {
                $variation = $this->digitalProductVariationRepo->getFirstWhere(params: ['product_id' => $product['id'], 'variant_key' => $variation]);
                if ($variation) {
                    // $this->deleteFile(filePath: '/product/digital-product/' . $variation['file']);
                    $this->digitalProductVariationRepo->delete(params: ['id' => $variation['id']]);
                }
            }

            foreach ($getAllVariation as $variation) {
                if (in_array($variation['variant_key'], $request['digital_product_variant_key'])) {
                    $uniqueKey = strtolower(str_replace('-', '_', $variation['variant_key']));

                    $fileItem = null;
                    if ($request['digital_product_type'] == 'ready_product') {
                        $fileItem = $request->file('digital_files.' . $uniqueKey);
                    }
                    $uploadedFile = $variation['file'] ?? '';
                    $variation = $this->digitalProductVariationRepo->getFirstWhere(params: ['product_id' => $product['id'], 'variant_key' => $variation['variant_key']]);
                    if ($fileItem) {
                        $uploadedFile = $this->fileUpload(dir: 'product/digital-product/', format: $fileItem->getClientOriginalExtension(), file: $fileItem);
                    }
                    $this->digitalProductVariationRepo->updateByParams(params: ['product_id' => $product['id'], 'variant_key' => $variation['variant_key']], data: [
                        'variant_key' => $request->input('digital_product_variant_key.' . $uniqueKey),
                        'sku' => $request->input('digital_product_sku.' . $uniqueKey),
                        'price' => currencyConverter(amount: $request->input('digital_product_price.' . $uniqueKey)),
                        'file' => $uploadedFile,
                    ]);
                }

                if ($request['product_type'] == 'physical' || $request['digital_product_type'] == 'ready_after_sell') {
                    $variation = $this->digitalProductVariationRepo->getFirstWhere(params: ['product_id' => $product['id'], 'variant_key' => $variation['variant_key']]);
                    if ($variation && $variation['file']) {
                        // $this->deleteFile(filePath: '/product/digital-product/' . $variation['file']);
                        $this->digitalProductVariationRepo->updateByParams(params: ['id' => $variation['id']], data: ['file' => '']);
                    }
                    if ($request['product_type'] == 'physical') {
                        $variation->delete();
                    }
                }
            }
        } else {
            $this->digitalProductVariationRepo->delete(params: ['product_id' => $product['id']]);
        }
    }

    public function getView(string|int $id): View|RedirectResponse
    {
        $vendorId = auth('seller')->id();
        $productActive = $this->productRepo->getFirstWhereActive(params: ['id' => $id, 'user_id' => $vendorId]);
        $relations = ['category', 'brand', 'reviews', 'rating', 'orderDetails', 'orderDelivered', 'translations', 'seoInfo', 'clearanceSale' => function ($query) {
            return $query->active();
        }];
        $product = $this->productRepo->getFirstWhereWithoutGlobalScope(params: ['id' => $id, 'user_id' => $vendorId], relations: $relations);
        if (!$product) {
            return redirect()->route('vendor.products.list', ['type' => 'all']);
        }
        $isActive = $this->productRepo->getWebFirstWhereActive(params: ['id' => $id]);
        $product['priceSum'] = $product?->orderDelivered->sum('price');
        $product['qtySum'] = $product?->orderDelivered->sum('qty');
        $product['discountSum'] = $product?->orderDelivered->sum('discount');

        $productColors = [];
        $colors = json_decode($product['colors'], true);
        foreach ($colors as $color) {
            $getColor = $this->colorRepo->getFirstWhere(params: ['code' => $color]);
            if ($getColor) {
                $productColors[$getColor['name']] = $colors;
            }
        }

        $reviews = $this->reviewRepo->getListWhere(orderBy: ['created_at' => 'desc'], filters: ['product_id' => ['product_id' => $id], 'whereNull' => ['column' => 'delivery_man_id']], dataLimit: getWebConfig(name: 'pagination_limit'));
        return view(Product::VIEW[VIEW], compact('product', 'reviews', 'productActive', 'productColors', 'isActive'));
    }

    public function exportList(Request $request, string $type): BinaryFileResponse
    {
        $vendorId = auth('seller')->id();
        $vendor = $this->vendorRepo->getFirstWhere(params: ['id' => $vendorId]);
        $filters = [
            'added_by' => 'seller',
            'seller_id' => $vendorId,
            'brand_id' => $request['brand_id'],
            'category_id' => $request['category_id'],
            'sub_category_id' => $request['sub_category_id'],
            'sub_sub_category_id' => $request['sub_sub_category_id'],
            'request_status' => $type == 'new-request' ? 0 : ($type == 'approved' ? 1 : ($type == 'denied' ? 2 : 'all')),
        ];
        $products = $this->productRepo->getListWhere(orderBy: ['id' => 'desc'], searchValue: $request['searchValue'], filters: $filters, relations: ['translations'], dataLimit: 'all');

        $category = (!empty($request['category_id']) && $request->has('category_id')) ? $this->categoryRepo->getFirstWhere(params: ['id' => $request['category_id']]) : 'all';
        $subCategory = (!empty($request->sub_category_id) && $request->has('sub_category_id')) ? $this->categoryRepo->getFirstWhere(params: ['id' => $request['sub_category_id']]) : 'all';
        $subSubCategory = (!empty($request->sub_sub_category_id) && $request->has('sub_sub_category_id')) ? $this->categoryRepo->getFirstWhere(params: ['id' => $request['sub_sub_category_id']]) : 'all';
        $brand = (!empty($request->brand_id) && $request->has('brand_id')) ? $this->brandRepo->getFirstWhere(params: ['id' => $request->brand_id]) : 'all';
        $seller = (!empty($request->seller_id) && $request->has('seller_id')) ? $this->sellerRepo->getFirstWhere(params: ['id' => $request->seller_id]) : '';
        $data = [
            'data-from' => 'vendor',
            'vendor' => $vendor,
            'products' => $products,
            'category' => $category,
            'sub_category' => $subCategory,
            'sub_sub_category' => $subSubCategory,
            'brand' => $brand,
            'searchValue' => $request['searchValue'],
            'type' => $request->type ?? '',
            'seller' => $seller,
            'status' => $request->status ?? '',
        ];
        return Excel::download(new ProductListExport($data), ucwords($request['type']) . '-' . 'product-list.xlsx');
    }

    public function exportRestockList(Request $request): BinaryFileResponse
    {
        $vendorId = auth('seller')->id();
        $filters = [
            'added_by' => 'seller',
            'seller_id' => $vendorId,
            'brand_id' => $request['brand_id'],
            'category_id' => $request['category_id'],
            'sub_category_id' => $request['sub_category_id'],
        ];

        $startDate = '';
        $endDate = '';
        if (isset($request['restock_date']) && !empty($request['restock_date'])) {
            $dates = explode(' - ', $request['restock_date']);
            $startDate = Carbon::createFromFormat('m/d/Y', $dates[0])->startOfDay();
            $endDate = Carbon::createFromFormat('m/d/Y', $dates[1])->endOfDay();
        }
        $restockProducts = $this->restockProductRepo->getListWhereBetween(
            orderBy: ['updated_at' => 'desc'],
            searchValue: $request['searchValue'],
            filters: $filters,
            relations: ['product'],
            whereBetween: 'created_at',
            whereBetweenFilters: $startDate && $endDate ? [$startDate, $endDate] : [],
            dataLimit: 'all',
        );
        $brand = (!empty($request->brand_id) && $request->has('brand_id')) ? $this->brandRepo->getFirstWhere(params: ['id' => $request->brand_id]) : 'all';
        $category = (!empty($request['category_id']) && $request->has('category_id')) ? $this->categoryRepo->getFirstWhere(params: ['id' => $request['category_id']]) : 'all';
        $subCategory = (!empty($request->sub_category_id) && $request->has('sub_category_id')) ? $this->categoryRepo->getFirstWhere(params: ['id' => $request['sub_category_id']]) : 'all';

        $data = [
            'products' => $restockProducts,
            'category' => $category,
            'subCategory' => $subCategory,
            'brand' => $brand,
            'searchValue' => $request['searchValue'],
            'startDate' => $startDate,
            'endDate' => $endDate,
        ];
        return Excel::download(new RestockProductListExport($data), 'restock-product-list.xlsx');
    }

    public function getSkuCombinationView(Request $request, ProductService $service): JsonResponse
    {
        $product = $this->productRepo->getFirstWhere(params: ['id' => $request['product_id']], relations: ['digitalVariation', 'seoInfo']);
        $combinationView = $service->getSkuCombinationView(request: $request, product: $product);
        return response()->json(['view' => $combinationView]);
    }

    public function getDigitalVariationCombinationView(Request $request, ProductService $service): JsonResponse
    {
        $product = $this->productRepo->getFirstWhere(params: ['id' => $request['product_id']], relations: ['digitalVariation']);
        $combinationView = $service->getDigitalVariationCombinationView(request: $request, product: $product);
        return response()->json(['view' => $combinationView]);
    }

    public function deleteDigitalVariationFile(Request $request, ProductService $service): JsonResponse
    {
        $variation = $this->digitalProductVariationRepo->getFirstWhere(params: ['product_id' => $request['product_id'], 'variant_key' => $request['variant_key']]);
        if ($variation) {
            $this->deleteFile(filePath: '/product/digital-product/' . $variation['file']);
            $this->digitalProductVariationRepo->updateByParams(params: ['id' => $variation['id']], data: ['file' => null]);
            return response()->json([
                'status' => 1,
                'message' => translate('delete_successful')
            ]);
        }
        return response()->json([
            'status' => 0,
            'message' => translate('delete_unsuccessful')
        ]);
    }

    public function getCategories(Request $request, ProductService $service): JsonResponse
    {
        $parentId = $request['parent_id'];
        $filter = ['parent_id' => $parentId];
        $categories = $this->categoryRepo->getListWhere(filters: $filter, dataLimit: 'all');
        $dropdown = $service->getCategoryDropdown(request: $request, categories: $categories);

        $childCategories = '';
        if (count($categories) == 1) {
            $subCategories = $this->categoryRepo->getListWhere(filters: ['parent_id' => $categories[0]['id']], dataLimit: 'all');
            $childCategories = $service->getCategoryDropdown(request: $request, categories: $subCategories);
        }

        return response()->json([
            'select_tag' => $dropdown,
            'sub_categories' => count($categories) == 1 ? $childCategories : '',
        ]);
    }

    public function updateStatus(Request $request): JsonResponse
    {
        $status = $request['status'];
        $productId = $request['id'];
        $product = $this->productRepo->getFirstWhere(params: ['id' => $productId, 'user_id' => auth('seller')->id()]);
        $success = 0;

        if ($status == 1 && $product['request_status'] == 1) {
            $this->productRepo->update(id: $productId, data: ['status' => $status]);
            $success = 1;
        } elseif ($status != 1) {
            $this->productRepo->update(id: $productId, data: ['status' => $status ?? 0]);
            $success = 1;
        }

        return response()->json([
            'success' => $success,
            'message' => $success ? translate("status_updated_successfully") : translate("status_updated_failed") . ' ' . translate("Product_must_be_approved"),
        ], 200);
    }

    public function getBarcodeView(Request $request, string|int $id): View|RedirectResponse
    {
        if ($request['limit'] > 270) {
            ToastMagic::warning(translate('you_can_not_generate_more_than_270_barcode'));
            return back();
        }
        $product = $this->productRepo->getFirstWhere(params: ['id' => $id, 'user_id' => auth('seller')->id()]);
        $rangeData = range(1, $request->limit ?? 4);
        $barcodes = array_chunk($rangeData, 24);
        return view(Product::BARCODE_VIEW[VIEW], compact('product', 'barcodes'));
    }

    public function delete(string|int $id, ProductService $service): RedirectResponse
    {
        $product = $this->productRepo->getFirstWhere(params: ['id' => $id, 'user_id' => auth('seller')->id()]);

        if ($product) {
            $this->translationRepo->delete(model: 'App\Models\Product', id: $id);
            $this->cartRepo->delete(params: ['product_id' => $id]);
            $this->wishlistRepo->delete(params: ['product_id' => $id]);
            $this->flashDealProductRepo->delete(params: ['product_id' => $id]);
            $this->dealOfTheDayRepo->delete(params: ['product_id' => $id]);
            $service->deleteImages(product: $product);
            $this->productRepo->delete(params: ['id' => $id]);
            ToastMagic::success(translate('product_removed_successfully'));
        } else {
            ToastMagic::error(translate('invalid_product'));
        }

        return back();
    }

    public function getStockLimitListView(Request $request): View
    {
        $vendorId = auth('seller')->id();
        $stockLimit = getWebConfig(name: 'stock_limit');
        $sortOrderQty = $request['sortOrderQty'];
        $searchValue = $request['searchValue'];
        $withCount = ['orderDetails'];
        $status = $request['status'];
        $filters = [
            'added_by' => 'seller',
            'request_status' => 1,
            'product_type' => 'physical',
            'seller_id' => $vendorId,
        ];

        $orderBy = [];
        if ($sortOrderQty == 'quantity_asc') {
            $orderBy = ['current_stock' => 'asc'];
        } else if ($sortOrderQty == 'quantity_desc') {
            $orderBy = ['current_stock' => 'desc'];
        } elseif ($sortOrderQty == 'order_asc') {
            $orderBy = ['order_details_count' => 'asc'];
        } elseif ($sortOrderQty == 'order_desc') {
            $orderBy = ['order_details_count' => 'desc'];
        } elseif ($sortOrderQty == 'default') {
            $orderBy = ['id' => 'asc'];
        }

        $products = $this->productRepo->getStockLimitListWhere(orderBy: $orderBy, searchValue: $searchValue, filters: $filters, withCount: $withCount, relations: ['translations'], dataLimit: getWebConfig(name: WebConfigKey::PAGINATION_LIMIT));
        return view(Product::STOCK_LIMIT[VIEW], compact('products', 'searchValue', 'status', 'sortOrderQty', 'stockLimit'));
    }

    public function updateQuantity(Request $request): RedirectResponse
    {
        $variations = [];
        $stockCount = $request['current_stock'];
        if ($request->has('type')) {
            foreach ($request['type'] as $key => $str) {
                $item = [];
                $item['type'] = $str;
                $item['price'] = currencyConverter(amount: abs($request['price_' . str_replace('.', '_', $str)]));
                $item['sku'] = $request['sku_' . str_replace('.', '_', $str)];
                $item['qty'] = abs($request['qty_' . str_replace('.', '_', $str)]);
                $variations[] = $item;
            }
        }
        $dataArray = [
            'current_stock' => $stockCount,
            'variation' => json_encode($variations),
        ];

        if ($stockCount >= 0) {
            $product = $this->productRepo->getFirstWhere(params: ['id' => $request['product_id']]);
            $this->productRepo->updateByParams(params: ['id' => $request['product_id']], data: $dataArray);
            $updatedProduct = $this->productRepo->getFirstWhere(params: ['id' => $request['product_id']]);
            $this->updateRestockRequestListAndNotify(product: $product, updatedProduct: $updatedProduct);

            ToastMagic::success(translate('product_quantity_updated_successfully'));
            return back();
        }
        ToastMagic::warning(translate('product_quantity_can_not_be_less_than_0_'));
        return back();
    }

    public function deleteImage(Request $request, ProductService $service): RedirectResponse
    {
        $this->deleteFile(filePath: '/product/' . $request['image']);
        $product = $this->productRepo->getFirstWhere(params: ['id' => $request['id']]);

        if (count(json_decode($product['images'])) < 2) {
            ToastMagic::warning(translate('you_can_not_delete_all_images'));
            return back();
        }
        $imageProcessing = $service->deleteImage(request: $request, product: $product);
        $updateData = [
            'images' => json_encode($imageProcessing['images']),
            'color_image' => json_encode($imageProcessing['color_images']),
        ];
        $this->productRepo->update(id: $request['id'], data: $updateData);

        ToastMagic::success(translate('product_image_removed_successfully'));
        return back();
    }

    public function getVariations(Request $request): JsonResponse
    {
        $product = $this->productRepo->getFirstWhere(params: ['id' => $request['id']]);
        $restockId = $request['restock_id'];
        $restockVariants = $this->restockProductRepo->getListWhereBetween(filters: ['product_id' => $request['id']])?->pluck('variant')->toArray() ?? [];

        return response()->json([
            'view' => view(Product::GET_VARIATIONS[VIEW], compact('product', 'restockId', 'restockVariants'))->render()
        ]);
    }

    public function getBulkImportView(): View
    {
        return view(Product::BULK_IMPORT[VIEW]);
    }

    public function importBulkProduct(Request $request, ProductService $service): RedirectResponse
    {
        $dataArray = $service->getImportBulkProductData(request: $request, addedBy: 'seller');
        if (!$dataArray['status']) {
            ToastMagic::error($dataArray['message']);
            return back();
        }

        $this->productRepo->addArray(data: $dataArray['products']);
        ToastMagic::success($dataArray['message']);
        return back();
    }

    public function getSearchedProductsView(Request $request): JsonResponse
    {
        $searchValue = $request['searchValue'] ?? null;
        $products = $this->productRepo->getListWhere(
            searchValue: $searchValue,
            filters: [
                'added_by' => 'seller',
                'seller_id' => auth('seller')->id(),
                'status' => 1,
                'category_id' => $request['category_id'],
                'code' => $request['name'] ?? null,
            ],
            dataLimit: getWebConfig(name: 'pagination_limit')
        );
        return response()->json([
            'count' => $products->count(),
            'result' => view(Product::SEARCH[VIEW], compact('products'))->render(),
        ]);
    }


    public function getProductGalleryView(Request $request): View
    {
        $vendorId = auth('seller')->id();
        $searchValue = $request['searchValue'];
        $filters = [
            'added_by' => 'seller',
            'searchValue' => $searchValue,
            'request_status' => 1,
            'seller_id' => $vendorId,
            'brand_id' => $request['brand_id'],
            'category_id' => $request['category_id'],
        ];
        $products = $this->productRepo->getListWhere(orderBy: ['id' => 'desc'], searchValue: $request['searchValue'], filters: $filters, relations: ['translations'], dataLimit: getWebConfig(WebConfigKey::PAGINATION_LIMIT));

        $products->map(function ($product) {
            if ($product->product_type == 'physical' && count(json_decode($product->choice_options)) > 0 || count(json_decode($product->colors)) > 0) {
                $colorName = [];
                $colorsCollection = collect(json_decode($product->colors));
                $colorsCollection->map(function ($color) use (&$colorName) {
                    $colorName[] = $this->colorRepo->getFirstWhere(['code' => $color])->name;
                });
                $product['colorsName'] = $colorName;
            }
        });

        $brands = $this->brandRepo->getListWhere(filters: ['status' => 1], dataLimit: 'all');

        $categories = $this->categoryRepo->getListWhere(filters: ['position' => 0], dataLimit: 'all');

        return view(Product::PRODUCT_GALLERY[VIEW], compact('products', 'brands', 'categories', 'searchValue'));

    }

    public function getStockLimitStatus(Request $request): JsonResponse
    {
        $vendorId = auth('seller')->id();
        $filters = [
            'added_by' => 'seller',
            'product_type' => 'physical',
            'request_status' => $request['status'],
            'seller_id' => $vendorId,
        ];
        $products = $this->productRepo->getStockLimitListWhere(filters: $filters, dataLimit: 'all');
        if ($products->count() == 1) {
            $product = $products->first();
            $thumbnail = getStorageImages(path: $product->thumbnail_full_url, type: 'backend-product');
            return response()->json(['status' => 'one_product', 'product_count' => 1, 'product' => $product, 'thumbnail' => $thumbnail]);
        } else {
            return response()->json(['status' => 'multiple_product', 'product_count' => $products->count()]);
        }
    }

    public function deletePreviewFile(Request $request): JsonResponse
    {
        $product = $this->productRepo->getFirstWhereWithoutGlobalScope(params: ['id' => $request['product_id']]);
        $this->productService->deletePreviewFile(product: $product);
        $this->productRepo->update(id: $request['product_id'], data: ['preview_file' => null]);
        return response()->json([
            'status' => 1,
            'message' => translate('Preview_file_deleted')
        ]);
    }
}
