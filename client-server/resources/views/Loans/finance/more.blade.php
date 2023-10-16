<div class="modal fade" id="finance-more" tabindex="-1" role="dialog" aria-labelledby="loansTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-15" id="loansTitle">Loan Comments</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="finance-loan-form">
                <div class="modal-body">
                    <div class="alert alert-info alert-dismissible" role="alert">
                        <div class="alert-icon">
                            <i class="icon-info"></i>
                        </div>
                        <div class="alert-message">
                            <strong>Loan Comments While in Process</strong>
                        </div>
                    </div>
                    <div class="row">
                        @if (count($loan['comments']) > 0)
                            @foreach ($loan['comments'] as $comment)
                                <div class="col-md-12">
                                    <strong>
                                        @if ($comment->user->userType == 'chairman')
                                            <h6>Chair Person</h6>
                                        @else
                                            <h6>Financial Secretary</h6>
                                        @endif
                                    </strong>
                                    <span>
                                        <strong>Action: </strong>
                                        <small class="text-danger">{{ $comment->action }}</small>
                                    </span>
                                    <br>
                                    <span class="text-muted"><strong>Date:
                                        </strong><small>{{ $comment->created_at->diffForHumans() }}</small>
                                    </span>
                                    <p>{{ $comment->message }}</p>
                                    <hr>
                                </div>
                            @endforeach
                        @else
                            <div class="col-md-12 text-canter">
                                <span class="text-muted"><strong>No Comments on Loan Made Yet.</strong></span>
                                <hr>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary btn-sm modal-close" data-dismiss="modal"><i
                            class="mdi mdi-close-circle"></i> Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
