<div class="modal fade" id="loans" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="loansTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-15" id="loansTitle">Loan Application Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="loan-form">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 col-sm-6">
                            <h6 class="font-15 mt-3">Member's Name:</h6>
                            <?php
                            $users = DB::table('users')
                                ->where('id', '=', auth()->id())
                                ->first();
                            echo "<strong class='custom-color font-14'>" . $users->name . ' </strong>';
                            echo '(' . $users->fwpnumber . '</span>)';
                            ?>
                        </div>
                        <div class="col-md-6 col-lg-3 col-sm-6">
                            <h6 class="font-15 mt-3">Total Amount Due</h6>
                            <input type="hidden" class="form-control form-control-sm" name="total-amount"
                                id="total-amount" readonly>
                            <strong class='custom-color font-14' id="total-amount-span"></strong>
                        </div>
                        <div class="col-md-6 col-lg-3 col-sm-6">
                            <h6 class="font-15 mt-3">75% Of Total Amount</h6>
                            <input type="hidden" class="form-control form-control-sm" value="" required
                                name="expected_loan" id="expected_loan" readonly>
                            <strong class='custom-color font-14' id="expected_loan_span"></strong>
                        </div>
                        <div class="col-md-6 col-lg-3 col-sm-6">
                            <h6 class="font-15 mt-3">Loan Limit</h6>
                            <input type="hidden" class="form-control form-control-sm" value="" required
                                name="loan_limit" id="loan_limit" readonly>
                            <strong class='custom-color font-14 loan_limit_span'></strong>
                        </div>
                    </div>
                    <hr />
                    <div class="row d-flex">
                        <div class="row col-md-10 col-sm-12 mx-auto">
                            <div class="form-group mt-2 font-14 col-md-6 col-sm-6">
                                <label for="loan_amount">Loan Amount <span class="text-danger">*</span></label>
                                (<small>Between
                                    <strong class='custom-color font-12 loan_limit_span'></strong>
                                    and
                                    <strong class='custom-color font-12'>500,000 UGX</strong>
                                </small>)
                                <input type="text" class="form-control form-control-sm" required name="loan_amount"
                                    id="loan_amount" placeholder="please input amount"
                                    onkeyup="this.value=addCommas(this.value);">
                                <small class="text-danger loan-amount-validity"></small>
                            </div>
                            <div class="form-group mt-2 font-14 col-md-6 col-sm-6">
                                <label for="months_taken">Months Taken <span class="text-danger">*</span></label>
                                <select class="browser-default custom-select" id="months_taken" required
                                    name="months_taken">
                                    <option selected disabled value="">Select Months</option>
                                    <option value="1">One Month</option>
                                    <option value="2">Two Months</option>
                                    <option value="3">Three Months</option>
                                </select>
                            </div>
                            <div class="form-group mt-2 font-14 col-md-6 col-sm-6">
                                <label for="payment_mode">Payment Mode <span class="text-danger">*</span></label>
                                <select class="browser-default custom-select" id="payment_mode" required
                                    name="payment_mode">
                                    <option selected disabled value="">Select Payment Mode</option>
                                    <option value="instalments">Installment Payments</option>
                                    <option value="lump">lump sum Payment</option>
                                </select>
                            </div>
                            <div class="form-group mt-2 font-14 col-md-6 col-sm-6">
                                <label for="desc">Reason/Description <span class="text-danger">*</span></label>
                                <textarea type="text" id="reasondesc" name="desc"
                                    class="form-control form-control-sm desc" required maxlength="250"
                                    placeholder="Reason for requesting" id="desc" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="container resty lily">
                        <hr />
                        <div class="row d-flex">
                            <div class="col-md-12 col-lg-10 col-sm-12 row mx-auto">
                                <div class="row mb-3">
                                    <strong>Please attach Guarantor</strong>
                                </div>
                                <div class="col-md-12 col-lg-12 col-sm-12 row">
                                    <div class="form-group col-md-4 col-sm-6">
                                        <label for="guarantor">Guarantor' Name<span
                                                class="text-danger">*</span></label>
                                        <select class="browser-default custom-select" name="guarantor"
                                            id="guarantor_id">
                                            <option selected disabled value="">Select Member</option>
                                            @foreach ($guarantors as $guarantor)
                                                <option value="{{ $guarantor['user_id'] }}">
                                                    {{ $guarantor['user_number'] }} | {{ $guarantor['user_name'] }},
                                                    Limit: {{ number_format(0.75 * $guarantor['due_amount']) }}/=</option>
                                            @endforeach
                                        </select>
                                        <small class="text-danger g_select d-none">Guarantor Required</small>
                                    </div>
                                    <div class="form-group col-md-4 mt-2 col-sm-6">
                                        <label for="g_amount">Guarantor' Amount <small
                                                class="text-danger">*</small></label>
                                        <input type="text" class="form-control form-control-sm" name="g_amount"
                                            id="g_amount" onkeyup="this.value=addCommas(this.value);">
                                        <small class="text-danger g_amount d-none">Guarantor Amount Required</small>
                                        <small class="text-danger g_vlidation"></small>
                                    </div>
                                    <div class="form-group mt-4 col-md-4 col-sm-6">
                                        <a name="" id="add-guarantor" btn-action="save" btn-id="" href="#"
                                            class="btn mt-3 btn-sm btn-primary" role="button">
                                            <i class="fa fa-plus-square" aria-hidden="true"></i> Guarantor
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12 col-sm-12">
                                    <div class="table-responsive">
                                        <table class="table"
                                            style="border-left: none; border-right: none; border-top: none;">
                                            <thead>
                                                <tr>
                                                    <th style="border-left: none; border-right: none;">Name</th>
                                                    <th style="border-left: none; border-right: none;">Amount Garanteed
                                                    </th>
                                                    <th style="border-left: none; border-right: none;">Guarantor's
                                                        Limit</th>
                                                    <th style="border-left: none; border-right: none;">Action</th>
                                                </tr>
                                            </thead>

                                            {{-- data being fetched fro jQuery --}}
                                            <tbody class="temp-guarantor"></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row justify-content-between">
                        <div class="col-md-4">
                            <strong class="font-15">Processing Fee: </strong>
                            <strong class='custom-color font-14 ml-2' id="fee_span"></strong>
                            <input type="hidden" class="form-control form-control-sm" required name="fee" id="fee"
                                readonly>
                            <br>
                            <strong class="font-15">Arreas: </strong>
                            <strong class='custom-color font-14 ml-2' id="arrears_span"></strong>
                        </div>
                        <div class="col-md-4">
                            <strong class="font-15">Expected Loan Return: </strong>
                            <strong class='custom-color font-14 ml-2' id="fee_return"></strong>
                            <input type="hidden" class="form-control form-control-sm" required name="return" id="return"
                                readonly>
                            <br>
                            <strong class="font-15">Disburse Amount: </strong>
                            <strong class='custom-color font-14 ml-2' id="disburse_span"></strong>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger btn-sm modal-close" data-dismiss="modal"><i
                            class="mdi mdi-close-circle"></i> Close</button>
                    <button type="submit" btn-id="" btn-action="save" id="loanrequest-btn"
                        class="btn btn-outline-primary btn-sm"><i class="mdi mdi-check"></i> Request Loan</button>
                </div>
            </form>
        </div>
    </div>
</div>
