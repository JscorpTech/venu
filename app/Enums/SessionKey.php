<?php

namespace App\Enums;

enum SessionKey
{
    const ADMIN_RECAPTCHA_KEY = 'adminRecaptchaSessionKey';
    const ADMIN_SMS_TEST_RECAPTCHA_KEY = 'adminSMSRecaptchaSessionKey';
    const VENDOR_RECAPTCHA_KEY = 'vendorRecaptchaSessionKey';
    const CURRENT_USER = 'current_user';
    const CART_NAME = 'cart_name';
    const LAST_ORDER = 'last_order';
    const PRODUCT_COMPARE_LIST = 'compare_list';
    const FORGOT_PASSWORD_IDENTIFY = 'forgot_password_identity';
}
