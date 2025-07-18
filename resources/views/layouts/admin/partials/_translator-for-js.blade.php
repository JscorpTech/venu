<span id="call-demo-message" data-title="{{ translate('Information') }}" data-text="{{ translate("this_option_is_disabled_for_demo").'!' }}"></span>

<span id="get-update-status-message" data-text="{{ translate("status_updated_successfully") }}"
      data-error="{{ translate("status_update_failed") }}">
</span>
<span id="get-update-success-message" data-text="{{ translate("updated_successfully") }}"></span>
<span id="get-extension-text-message" data-text="{{ translate("extension") }}"></span>
<span id="get-deleted-message" data-text="{{ translate("deleted_successfully") }}"></span>
<span id="get-confirm-and-cancel-button-text" data-sure="{{ translate('are_you_sure').'?' }}"
      data-delete-text="{{ translate('once_deleted_you_will_not_be_able_to_recover_this').'!' }}"
      data-confirm="{{ translate('yes') }}" data-cancel="{{ translate('no') }}"></span>
<span id="get-confirm-and-cancel-button-text-for-delete"
      data-sure="{{ translate('are_you_sure_you_want_to_delete_this').'?' }}"
      data-text="{{ translate('you_will_not_be_able_to_revert_this').'!' }}"
      data-confirm="{{ translate('yes_delete_it') }}" data-cancel="{{ translate('cancel') }}"></span>
<span id="get-confirm-and-cancel-button-text-for-blog-category-delete"
      data-sure="{{ translate('are_you_sure_to_delete_this_category').'?' }}"
      data-image="{{dynamicAsset(path: 'public/assets/back-end/img/delete-blog-category.png') }}"
      data-text="{{ translate('once_you_delete_it_this_will_permanently_remove_it_from_the_Category_list_and_cannot_be_accessed').'!' }}"
      data-confirm="{{ translate('yes_delete') }}" data-cancel="{{ translate('not_now') }}" data-cancel-color="#F4F4F4"
      data-confirm-color="#FF6767"></span>
<span id="get-copy-to-clipboard" data-success="{{ translate('copied_to_the_clipboard') }}"></span>
<span id="get-input-file-text" data-error="{{ translate('The_file_upload_field_is_required') }}"></span>
<span id="get-success-text" data-success="{{ translate('successfully_updated') }}"></span>
<span id="get-email-and-otp-verification-info-message"
      data-info="{{ translate('both_Phone_&_Email_verification_can_not_be_active_at_a_time') }}"></span>
<span id="get-select-country-text" data-text="{{ translate('select_country') }}"></span>
<span id="get-date-range-message" data-error="{{ translate('invalid_date_range').'!' }}"></span>
<span id="get-minimum-amount-message"
      data-error="{{ translate('minimum_amount_can_not_be_greater_than_maximum_amount').'!' }}"></span>
<span id="get-file-upload-field-required-message"
      data-error="{{ translate('the_file_upload_field_is_required').'!' }}"></span>
<span id="select-minimum-one-box-message" data-warning="{{ translate('select_minimum_one_selection_box') }}"></span>
<span id="get-product-status-message"
      data-error="{{ translate("status_updated_failed").'.'.' '.translate("product_must_be_approved").'.' }}"></span>
<span id="get-featured-status-message" data-success="{{ translate("featured_status_updated_successfully") }}"></span>
<span id="get-multiple-image-text"
      data-on-extension-err="{{ translate('please_only_input_png_or_jpg_type_file') }}"
      data-on-size-err="{{ translate('file_size_too_big') }}">
</span>

<span id="get-logout-text" data-title="{{ translate('do_you_want_to_sign_out').'?' }}"
      data-confirm="{{ translate('yes') }}" data-cancel="{{ translate('no') }}"
      data-deny="{{ translate('do_not_Logout') }}"></span>
<span id="get-select-product-text" data-text="{{ translate('select_product') }}"></span>
<span id="change-language-message" data-text="{{ translate('want_to_change_this_language').'?' }}"></span>
<span id="get-quantity-check-message"
      data-warning="{{ translate('please_enter_a_valid_integer_for_current_stock') }}"></span>
<span id="password-error-message" data-max-character="{{ translate('at_least_8_characters').'.' }}"
      data-uppercase-character="{{ translate('at_least_one_uppercase_letter_').'(A...Z)'.'.' }}"
      data-lowercase-character="{{ translate('at_least_one_uppercase_letter_').'(a...z)'.'.' }}"
      data-number="{{ translate('at_least_one_number').'(0...9)'.'.' }}"
      data-symbol="{{ translate('at_least_one_symbol').'(!...%)'.'.' }}"></span>
<span id="get-example-text" data-example="{{ translate('ex') }}"></span>
<span id="download-path-not-found-message" data-message="{{ translate('file_not_found').'!!!' }}"></span>
<span id="get-product-stock-message"
      data-out-of-stock="{{ translate('out_of_stock').'.'.translate('please_check_your_inventory_and_update') }}"
      data-limited-stock="{{ translate('There_is_not_enough_quantity_on_stock').'.'.translate('please_check_your_inventory') }}">
</span>

<span id="message-select-word" data-text="{{ translate('select') }}"></span>
<span id="message-yes-word" data-text="{{ translate('yes') }}"></span>
<span id="message-no-word" data-text="{{ translate('no') }}"></span>
<span id="message-cancel-word" data-text="{{ translate('cancel') }}"></span>
<span id="message-are-you-sure" data-text="{{ translate('are_you_sure') }} ?"></span>
<span id="message-invalid-date-range" data-text="{{ translate('invalid_date_range') }}"></span>
<span id="message-status-change-successfully" data-text="{{ translate('status_change_successfully') }}"></span>
<span id="message-are-you-sure-delete-this" data-text="{{ translate('are_you_sure_to_delete_this') }} ?"></span>
<span id="message-you-will-not-be-able-to-revert-this"
      data-text="{{ translate('you_will_not_be_able_to_revert_this') }}"></span>

<span class="please_fill_out_this_field" data-text="{{ translate('please_fill_out_this_field') }}"></span>
<span class="get-application-environment-mode"
      data-value="{{ env('APP_MODE') == 'demo' ? 'demo' : 'live' }}"></span>
<span id="get-currency-symbol" data-currency-symbol="{{ getCurrencySymbol(currencyCode: getCurrencyCode(type: 'default')) }}"></span>

<span id="get-product-stock-limit-title" data-title="{{ translate('warning') }}"></span>
<span id="get-product-stock-limit-image" data-warning-image="{{ dynamicAsset(path: 'public/assets/new/back-end/img/warning-2.png') }}"></span>
<span id="get-product-stock-limit-message" data-message-for-multiple="{{ translate('there_is_not_enough_quantity_on_stock') . ' . ' . translate('please_check_products_in_limited_stock') . '.' }}"
      data-message-for-three-plus-product="{{ translate('_more_products_have_low_stock') }}"
      data-message-for-one-product="{{ translate('this_product_is_low_on_stock') }}">
        </span>

<span class="system-default-country-code" data-value="{{ getWebConfig(name: 'country_code') ?? 'us' }}"></span>
<span id="get-confirm-and-cancel-button-text-for-delete-all-products"
      data-sure ="{{ translate('are_you_sure') . '?' }}"
      data-text="{{ translate('want_to_clear_all_stock_clearance_products?') . '!' }}"
      data-confirm="{{ translate('yes_delete_it') }}" data-cancel="{{ translate('cancel') }}"></span>
<span id="get-confirm-and-cancel-button-text-for-delete-country-name" data-sure ="{{ translate('are_you_sure').'?' }}"
      data-text="{{ translate('want_to_remove_country_name?').'!' }}"
      data-confirm="{{ translate('yes_delete_it') }}" data-cancel="{{ translate('cancel') }}"></span>
<span id="get-confirm-and-cancel-button-text-for-delete" data-sure ="{{ translate('are_you_sure_you_want_to_delete_this').'?' }}"
      data-text="{{ translate('you_will_not_be_able_to_revert_this').'!' }}"
      data-confirm="{{ translate('yes_delete_it') }}" data-cancel="{{ translate('cancel') }}"></span>
<span id="get-confirm-and-cancel-button-text" data-sure ="{{ translate('are_you_sure').'?' }}"
      data-delete-text="{{ translate('once_deleted_you_will_not_be_able_to_recover_this').'!' }}"
      data-confirm="{{ translate('yes') }}" data-cancel="{{ translate('no') }}"></span>

<span id="get-root-path-for-toggle-modal-image"
      data-path="{{ dynamicAsset(path: 'public/assets/new/back-end/img/modal') }}"></span>
<span id="get-decimal-point" data-decimal-point="{{ getWebConfig('decimal_point_settings') }}"></span>

