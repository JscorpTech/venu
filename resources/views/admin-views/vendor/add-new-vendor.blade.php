@extends('layouts.admin.app')

@section('title', translate('add_new_Vendor'))

@section('content')
    <div class="content container-fluid main-card {{Session::get('direction') }}">
        <div class="mb-4">
            <h2 class="h1 mb-0 text-capitalize d-flex align-items-center gap-2">
                <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/add-new-seller.png') }}" class="mb-1" alt="">
                {{ translate('add_new_Vendor') }}
            </h2>
        </div>

        <form action="{{ route('admin.vendors.add') }}" method="post" enctype="multipart/form-data"
              id="add-vendor-form" data-message="{{ translate('want_to_add_this_vendor').'?'}}"
              data-redirect-route="{{ route('admin.vendors.vendor-list') }}">
            @csrf
            <div class="card">
                <div class="card-body">
                    <input type="hidden" name="status" value="approved">
                    <h3 class="mb-0 text-capitalize d-flex align-items-center gap-2 border-bottom pb-3 mb-4 pl-4">
                        <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/vendor-information.png') }}"
                             class="mb-1" alt="">
                        {{ translate('vendor_information') }}
                    </h3>
                    <div class="row align-items-center">
                        <div class="col-lg-6 mb-4 mb-lg-0">
                            <div class="form-group">
                                <label for="exampleFirstName"
                                       class="mb-2 d-flex gap-1 align-items-center">{{ translate('first_name') }}</label>
                                <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                       name="f_name" value="{{ old('f_name') }}" placeholder="{{ translate('ex') }}: Jhone"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="exampleLastName"
                                       class="mb-2 d-flex gap-1 align-items-center">{{ translate('last_name') }}</label>
                                <input type="text" class="form-control form-control-user" id="exampleLastName"
                                       name="l_name" value="{{ old('l_name') }}" placeholder="{{ translate('ex') }}: Doe"
                                       required>
                            </div>
                            <div class="form-group mb-3">
                                <label for="phone_number"
                                       class=" mb-2">{{translate('phone_number')}}</label>
                                <input class="form-control form-control-user"
                                       type="tel" value=""
                                       placeholder="{{ translate('ex').': 017xxxxxxxx' }}" name="phone" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <div class="d-flex justify-content-center">
                                    <img class="upload-img-view" id="viewer"
                                         src="{{ dynamicAsset(path: 'public/assets/back-end/img/400x400/img2.jpg') }}"
                                         alt="{{ translate('banner_image') }}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="mb-2 d-flex gap-1 align-items-center">{{ translate('vendor_Image') }} <span
                                        class="text-info">({{ translate('ratio') }} {{ translate('1') }}:{{ translate('1') }})</span>
                                </div>
                                <div class="custom-file text-left">
                                    <input type="file" name="image" id="custom-file-upload"
                                           class="custom-file-input image-input"
                                           data-image-id="viewer"
                                           accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                    <label class="custom-file-label"
                                           for="custom-file-upload">{{ translate('upload_image') }}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mt-3">
                <div class="card-body">
                    <input type="hidden" name="status" value="approved">
                    <h3 class="mb-0 text-capitalize d-flex align-items-center gap-2 border-bottom pb-3 mb-4 pl-4">
                        <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/vendor-information.png') }}"
                             class="mb-1" alt="">
                        {{ translate('account_information') }}
                    </h3>
                    <div class="row">
                        <div class="col-lg-4 form-group">
                            <label for="exampleInputEmail"
                                   class="mb-2 d-flex gap-1 align-items-center">{{ translate('email') }}</label>
                            <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                   name="email" value="{{ old('email') }}"
                                   placeholder="{{ translate('ex').':'.'Jhone@company.com'}}" required>
                        </div>
                        <div class="col-lg-4 form-group">
                            <label for="user_password" class="mb-2 d-flex gap-1 align-items-center">
                                {{ translate('password') }}
                                <span class="input-label-secondary cursor-pointer d-flex" data-bs-toggle="tooltip"
                                      data-bs-title="{{ translate('The_password_must_be_at_least_8_characters_long_and_contain_at_least_one_uppercase_letter').','.translate('_one_lowercase_letter').','.translate('_one_digit_').','.translate('_one_special_character').','.translate('_and_no_spaces').'.'}}">
                                <i class="fi fi-rr-info"></i>
                            </span>
                            </label>
                            <div class="input-group">
                                <input type="password" class="js-toggle-password form-control password-check"
                                       name="password" required id="user_password" minlength="8"
                                       placeholder="{{ translate('password_minimum_8_characters') }}">
                                <div id="changePassTarget" class="input-group-append changePassTarget">
                                    <a class="text-body-light" href="javascript:">
                                        <i id="changePassIcon" class="fi fi-rr-eye"></i>
                                    </a>
                                </div>
                            </div>
                            <span class="text-danger mx-1 password-error"></span>
                        </div>
                        <div class="col-lg-4 form-group">
                            <label for="confirm_password"
                                   class="mb-2 d-flex gap-1 align-items-center">{{ translate('confirm_password') }}</label>
                            <div class="input-group">
                                <input type="password" class="js-toggle-password form-control" name="confirm_password"
                                       required id="confirm_password" placeholder="{{ translate('confirm_password') }}">
                                <div id="changeConfirmPassTarget" class="input-group-append changePassTarget">
                                    <a class="text-body-light" href="javascript:">
                                        <i id="changeConfirmPassIcon" class="fi fi-rr-eye"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="pass invalid-feedback">{{ translate('repeat_password_not_match').'.'}}</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-3">
                <div class="card-body">
                    <h3 class="mb-0 text-capitalize d-flex align-items-center gap-2 border-bottom pb-3 mb-4 pl-4">
                        <img src="{{ dynamicAsset(path: 'public/assets/back-end/img/vendor-information.png') }}"
                             class="mb-1" alt="">
                        {{ translate('shop_information') }}
                    </h3>

                    <div class="row">
                        <div class="col-lg-6 form-group">
                            <label for="shop_name"
                                   class="mb-2 d-flex gap-1 align-items-center">{{ translate('shop_name') }}</label>
                            <input type="text" class="form-control form-control-user" id="shop_name" name="shop_name"
                                   placeholder="{{ translate('ex').':'.translate('Jhon') }}" value="{{ old('shop_name') }}"
                                   required>
                        </div>
                        <div class="col-lg-6 form-group">
                            <label for="shop_address"
                                   class="mb-2 d-flex gap-1 align-items-center">{{ translate('shop_address') }}</label>
                            <textarea name="shop_address" class="form-control text-area-max" id="shop_address" rows="1"
                                      placeholder="{{ translate('ex').':'.translate('doe') }}">{{ old('shop_address') }}</textarea>
                        </div>
                        <div class="col-lg-6 form-group">
                            <div class="d-flex justify-content-center">
                                <img class="upload-img-view" id="viewerLogo"
                                     src="{{ dynamicAsset(path: 'public/assets/back-end/img/400x400/img2.jpg') }}"
                                     alt="{{ translate('banner_image') }}"/>
                            </div>

                            <div class="mt-4">
                                <div class="d-flex gap-1 align-items-center mb-2">
                                    {{ translate('shop_logo') }}
                                    <span class="text-info">({{ translate('ratio').' '.'1:1'}})</span>
                                </div>

                                <div class="custom-file">
                                    <input type="file" name="logo" id="logo-upload"
                                           class="custom-file-input image-input"
                                           data-image-id="viewerLogo"
                                           accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                    <label class="custom-file-label"
                                           for="logo-upload">{{ translate('upload_logo') }}</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 form-group">
                            <div class="d-flex justify-content-center">
                                <img class="upload-img-view upload-img-view__banner" id="viewerBanner"
                                     src="{{ dynamicAsset(path: 'public/assets/back-end/img/400x400/img2.jpg') }}"
                                     alt="{{ translate('banner_image') }}"/>
                            </div>
                            <div class="mt-4">
                                <div class="d-flex gap-1 align-items-center mb-2">
                                    {{ translate('shop_banner') }}
                                    <span
                                        class="text-info">{{ THEME_RATIO[theme_root_path()]['Store cover Image'] }}</span>
                                </div>

                                <div class="custom-file">
                                    <input type="file" name="banner" id="banner-upload"
                                           class="custom-file-input image-input"
                                           data-image-id="viewerBanner"
                                           accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                    <label class="custom-file-label text-capitalize"
                                           for="banner-upload">{{ translate('upload_Banner') }}</label>
                                </div>
                            </div>
                        </div>

                        @if(theme_root_path() == "theme_aster")
                            <div class="col-lg-6 form-group">
                                <div class="d-flex justify-content-center">
                                    <img class="upload-img-view upload-img-view__banner" id="viewerBottomBanner"
                                         src="{{ dynamicAsset(path: 'public/assets/back-end/img/400x400/img2.jpg') }}"
                                         alt="{{ translate('banner_image') }}"/>
                                </div>

                                <div class="mt-4">
                                    <div class="d-flex gap-1 align-items-center title-color mb-2">
                                        {{ translate('shop_secondary_banner') }}
                                        <span
                                            class="text-info">{{ THEME_RATIO[theme_root_path()]['Store Banner Image'] }}</span>
                                    </div>

                                    <div class="custom-file">
                                        <input type="file" name="bottom_banner" id="bottom-banner-upload"
                                               class="custom-file-input image-input"
                                               data-image-id="viewerBottomBanner"
                                               accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label text-capitalize"
                                               for="bottom-banner-upload">{{ translate('upload_bottom_banner') }}</label>
                                    </div>
                                </div>
                            </div>
                        @endif

                    </div>

                    <div class="d-flex align-items-center justify-content-end gap-10">
                        <input type="hidden" name="from_submit" value="admin">
                        <button type="reset" class="btn btn-secondary reset-button">{{ translate('reset') }} </button>
                        <button type="submit" class="btn btn-primary btn-user">{{ translate('submit') }}</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection

@push('script')
    <script src="{{ dynamicAsset(path: 'public/assets/new/back-end/js/admin/vendor.js') }}"></script>
@endpush
