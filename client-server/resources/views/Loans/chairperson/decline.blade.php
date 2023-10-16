<div class="modal fade" id="chairperson-decline" data-backdrop="static" tabindex="-1" role="dialog"
    aria-labelledby="loansTitle" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-15" id="loansTitle">Decline Loan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="chair-decline-loan">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group font-14 col-md-12 col-sm-12">
                            <label for="desc">Reason/Description for Declining
                                <span class="text-danger">*</span>
                            </label>
                            <textarea type="text" id="chairperson_decline_res" name="chairperson_decline_res"
                                class="form-control form-control-sm desc" required maxlength="250"
                                placeholder="Reason for Declining" rows="5"></textarea>
                            <input type="hidden" id="decline_id_holder" value="{{ $loan['id'] }}" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">
                        <i class="mdi mdi-close-circle"></i> Close
                    </button>
                    <button type="submit" btn-id="" btn-action="save" id="decline-chairperson-btn"
                        class="btn btn-outline-danger btn-sm">
                        <i class="fa fa-ban" aria-hidden="true"></i> Decline Loan
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
