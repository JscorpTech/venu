<div>
    <div class="text-center">
        <img width="100" class="mb-4" id="view-mail-icon"
             src="{{ $template->image_full_url['path'] ?? dynamicAsset(path: 'public/assets/back-end/img/email-template/registration-success.png')}}"
             alt="">
        <h3 class="mb-3 view-mail-title text-capitalize">
            {{$title ?? translate('registration_Approved')}}
        </h3>
    </div>
    <div class="view-mail-body">
        {!! $body !!}
    </div>
    <hr>
    @include('admin-views.business-settings.email-template.partials-design.footer')
</div>
