{{-- Guarantor --}}
<div class="modal fade" id="guarantor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Guarantor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table" style="border-left: none; border-right: none; border-top: none;">
                    <thead>
                        <tr>
                            <th style="border-left: none; border-right: none;">Action</th>
                            <th style="border-left: none; border-right: none;">Loan Applicant</th>
                            <th style="border-left: none; border-right: none;">Loan Amount</th>
                            <th style="border-left: none; border-right: none;">Guarator Amount</th>
                            <th style="border-left: none; border-right: none;">Months Taken</th>
                            <th style="border-left: none; border-right: none;">Date</th>
                        </tr>
                    </thead>
                    <tbody class="guarantor-requests">
                        @foreach ($guarantor_requests as $guarantor)
                            <tr>
                                <td class="text-left"
                                    style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                    <div class="dropdown">
                                        <button class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fa fa-cog" aria-hidden="true"></i> Action
                                        </button>
                                        <div class="dropdown-menu px-1 hadow-lg bg-white" aria-labelledby="dropdownMenuButton">
                                            <a class="mt-1 dropdown-item text-success yes-icon" id-data="{{$guarantor->id}}" loan-data="{{$guarantor->loans_id}}" href="#">
                                                <i class="fa fa-check" aria-hidden="true"></i> Accept
                                            </a>
                                            <a class="mt-1 dropdown-item text-danger refuse-icon" id-data="{{$guarantor->id}}" href="#">
                                                <i class="fa fa-times" aria-hidden="true"></i> Reject 
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-left"
                                    style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                    {{$guarantor->loans->user->name}}
                                </td>
                                <td class="text-left"
                                    style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                    {{number_format($guarantor->loans->loanamount)}}
                                </td>
                                <td class="text-left"
                                    style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                    {{number_format($guarantor->g_amount)}}
                                </td>
                                <td class="text-left"
                                    style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                    {{$guarantor->loans->monthstaken}}
                                </td>
                                <td class="text-left"
                                    style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                    {{$guarantor->created_at->diffForHumans()}}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-outline-secondary" data-dismiss="modal">
                    <i class="fa fa-times" aria-hidden="true"></i> Close
                </button>
            </div>
        </div>
    </div>
</div>