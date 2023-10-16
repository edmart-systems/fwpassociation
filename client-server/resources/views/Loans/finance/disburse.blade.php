<div class="modal fade" id="disburse-loan" data-backdrop="static" tabindex="-1" role="dialog"
    aria-labelledby="loansTitle" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-15" id="loansdisburseTitle">Disburse Loan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form enctype="multipart/form-data" method="POST" action="{{ route('disburseLoan') }}">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group font-14 col-md-10  m-auto col-sm-12">
                            <strong for="desc">Amount to disburse
                            </strong>
                            <p><strong class="custom-color">{{ number_format($loan['disbursed']) }} /=</strong></p>
                        </div>
                        <div class="form-group font-14 col-md-10  m-auto col-sm-12">
                            <label for="desc">Cheque Number
                                <span class="text-danger">*</span>
                            </label>
                            <input type="text" class="form-control" name="cheque_no" required id="cheque_no">
                            <input type="hidden" name="loans_id" value="{{ $loan['id'] }}">
                        </div>

                        <div class="form-group font-14 col-md-10 m-auto col-sm-12">
                            <label for="desc" class="mt-3">Upload Check Photo
                                (<span class="text-danger">Optional</span>)
                            </label>
                            <input type="file" name="cheque_image" id="cheque_image" class="form-control"
                                accept="image/*">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">
                        <i class="mdi mdi-close-circle"></i> Close
                    </button>
                    <button type="submit" btn-id="" btn-action="save" id="disburse-btn"
                        class="btn btn-outline-success custom-designed-btn btn-sm">
                        <i class="fa fa-check-circle"></i> Disburse Loan
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
