{{-- Widthdrawing modal alert for loans --}}
<div class="modal" id="confirm-withdraw-loans" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-14">CONFIRM PLEASE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="alert alert-warning" role="alert">
                      <h5 class="alert-heading text-center">Are You Sure</h4>
                      <small>This will cost you Loan Processing Fee of <strong class="loan-fees"></strong></small><br>
                      <small class="mb-0">You cannot Undo after withdrawing the Loan</small>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary btn-sm modal-close" data-dismiss="modal">
                    <i class="mdi mdi-close-circle"></i> Close</button>
                <button type="submit" class="btn btn-outline-danger btn-sm" id="withdraw-confirm" id-data="">
                    <i class="fa fa-reply" aria-hidden="true"></i> Withdraw Loan</button>
            </div>
        </div>
    </div>
</div>