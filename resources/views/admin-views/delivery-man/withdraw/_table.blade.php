<div class="table-responsive">
    <table id="datatable"
           class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table w-100">
        <thead class="thead-light thead-50 text-capitalize">
        <tr>
            <th>{{translate('SL')}}</th>
            <th>{{translate('amount')}}</th>
            <th>{{translate('name') }}</th>
            <th>{{translate('request_time')}}</th>
            <th class="text-center">{{translate('status')}}</th>
            <th class="text-center">{{translate('action')}}</th>
        </tr>
        </thead>
        <tbody>
            @foreach($withdrawRequests as $key=>$withdraw)
            <tr>
                <td>{{$withdrawRequests->firstItem()+$key}}</td>
                <td>{{setCurrencySymbol(amount: usdToDefaultCurrency(amount: $withdraw['amount']), currencyCode: getCurrencyCode())}}</td>

                <td>
                    @if ($withdraw->deliveryMan)
                        <span
                            class="title-color hover-c1">{{ $withdraw->deliveryMan->f_name . ' ' . $withdraw->deliveryMan->l_name }}</span>
                    @else
                        <span>{{translate('not_found')}}</span>
                    @endif
                </td>
                <td>{{ date_format( $withdraw->created_at, 'd-M-Y, h:i:s A') }}</td>
                <td class="text-center">
                    @if($withdraw->approved==0)
                        <label class="badge badge-info text-bg-info">{{translate('pending')}}</label>
                    @elseif($withdraw->approved==1)
                        <label class="badge badge-success text-bg-success">{{translate('approved')}}</label>
                    @else
                        <label class="badge badge-danger text-bg-danger">{{translate('denied')}}</label>
                    @endif
                </td>
                <td>
                    <div class="d-flex justify-content-center">
                        @if (isset($withdraw->deliveryMan))
                            <button
                                data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithdraw"
                                class="btn btn-outline-info icon-btn withdraw-info-show"
                                data-action="{{route('admin.delivery-man.withdraw-view',[$withdraw['id']])}}"
                                title="{{translate('view')}}">
                                <i class="fi fi-rr-eye"></i>
                            </button>
                        @else
                            <a class="btn btn-outline-info icon-btn disabled" href="#">
                                <i class="fi fi-rr-eye"></i>
                            </a>
                        @endif
                    </div>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

@if(count($withdrawRequests)==0)
    @include('layouts.admin.partials._empty-state',['text'=>'no_withdraw_request_found'],['image'=>'default'])
@endif
