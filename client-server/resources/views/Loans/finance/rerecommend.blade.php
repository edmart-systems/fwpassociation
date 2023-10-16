<div class="modal fade" id="finance-rerecommend" data-backdrop="static" tabindex="-1" role="dialog"
    aria-labelledby="loansTitle" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-15" id="loansTitle">Rerecommend Loan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="rerecommend-loan">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group font-14 col-md-12 col-sm-12">
                            <label for="desc">Reason/Description for Recommending Again
                                <span class="text-danger">*</span>
                            </label>
                            <textarea type="text" id="finance_rerecommend_res" name="finance_Rerecommend_res"
                                class="form-control form-control-sm desc" required maxlength="250"
                                placeholder="Reason for requesting" rows="5"></textarea>
                            <input type="hidden" id="rerecommend_id_holder" value="{{ $loan['id'] }}" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">
                        <i class="mdi mdi-close-circle"></i> Close
                    </button>
                    <button type="submit" btn-id="" btn-action="save" id="rerecommend-finance-btn"
                        class="btn btn-outline-success btn-sm">
                        <i class="fa fa-check-circle"></i> Rerecommend Loan
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
