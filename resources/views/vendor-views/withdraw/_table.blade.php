<div class="table-responsive">
    <table id="datatable"
           style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
           class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
        <thead class="thead-light thead-50 text-capitalize">
        <tr>
            <th>{{translate('SL')}}</th>
            <th>{{translate('amount')}}</th>
            <th>{{translate('request_time')}}</th>
            <th>{{translate('status')}}</th>
            <th class="text-center">{{translate('action')}}</th>
        </tr>
        </thead>
        <tbody>
        @if($withdrawRequests->count() > 0)
            @foreach($withdrawRequests as $key=>$withdrawRequest)
                <tr>
                    <td>{{$withdrawRequests->firstitem()+$key}}</td>
                    <td>
                        {{ setCurrencySymbol(amount: usdToDefaultCurrency(amount: $withdrawRequest['amount']), currencyCode: getCurrencyCode(type: 'default')) }}
                    </td>
                    <td>{{date("F jS, Y", strtotime($withdrawRequest->created_at))}}</td>
                    <td>
                        @if($withdrawRequest->approved==0)
                            <label class="badge badge-soft--primary">{{translate('pending')}}</label>
                        @elseif($withdrawRequest->approved==1)
                            <label class="badge badge-soft-success">{{translate('approved')}}</label>
                        @else
                            <label class="badge badge-soft-danger">{{translate('denied')}}</label>
                        @endif
                    </td>
                    <td class="text-center">
                        @if($withdrawRequest->approved==0)
                            <button id="{{route('vendor.business-settings.withdraw.close', [$withdrawRequest['id']])}}"
                                    data-action="{{ route('vendor.business-settings.withdraw.close', [$withdrawRequest['id']]) }}"
                                    class="btn btn--primary btn-sm close-request">
                                {{translate('close')}}
                            </button>
                        @else
                            <span class="btn btn--primary btn-sm disabled">
                                {{translate('close')}}
                            </span>
                        @endif
                    </td>
                </tr>
            @endforeach
        @endif
        </tbody>
    </table>
</div>
@if(count($withdrawRequests)==0)
    @include('layouts.vendor.partials._empty-state',['text'=>'no_withdraw_request_found'],['image'=>'default'])
@endif
<div class="table-responsive mt-4">
    <div class="px-4 d-flex justify-content-lg-end">
        {{$withdrawRequests->links()}}
    </div>
</div>
