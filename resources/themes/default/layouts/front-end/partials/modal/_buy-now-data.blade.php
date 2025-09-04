<form action="{{ route('cart.add') }}" method="POST">
    @csrf
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h5 class="modal-title flex-grow-1 text-center" id="buyNowModalLabel">
            {{ translate('Shipping_Method') }}
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <input type="hidden" class="form-control" value="2" name="shipping_method_id">
    <input type="hidden" class="form-control" value="1" name="shipping_method_exist">

    <div class="row d-none">
        @foreach ($productData as $inputKey => $productInputData)
            <div class="col-6">
                <label>
                    {{ $inputKey }}
                </label>
                <input type="text" class="form-control" value="{{ $productInputData }}" name="{{ $inputKey }}">
            </div>
        @endforeach
    </div>

    <div class="d-flex justify-content-center mt-4">
        <button type="submit" class="btn text-white web--bg-primary">
            {{ translate('Proceed_to_Checkout') }}
        </button>
    </div>
</form>
