<div class="modal fade" id="finance-departure" data-backdrop="static" tabindex="-1" role="dialog"
    aria-labelledby="loansTitle" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-15 text-danger" id="loansTitle">Depart User From Association</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="depart-loan" enctype="multipart/form-data">
                @csrf
                <div class="modal fade" id="departure-confirm" data-backdrop="static" tabindex="-1" role="dialog"
                    aria-labelledby="loansTitle" aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-danger font-15" >Confirm</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form id="depart-confirm">
                                @csrf
                                <div class="modal-body">
                                    <div class="row d-flex">
                                        <ul class="custom-color dapart-details font-13">
                                            <dt>Member Name</dt>
                                            <dd>Bryan Austin</dd>
                                            <dt>Total Deposit</dt>
                                            <dd>700000</dd>
                                            <dt>Pay Out on Departure</dt>
                                            <dd>680000</dd>
                                        </ul>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">
                                        <i class="mdi mdi-close-circle"></i> Cancel
                                    </button>
                                    <button type="submit" btn-id="" btn-action="save" id="departure-confirm-btn"
                                        class="btn btn-outline-danger btn-sm">
                                        Depart <i class="fa fa-check-circle" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group font-14 col-md-6 col-sm-12">
                            <label for="member">Select Member
                                <span class="text-danger">*</span>
                            </label>
                              <select class="form-control" name="member_depart" id="member_depart">
                                  @foreach ($members as $user)
                                    <option>{{$user->name}} | {{$user->fwpnumber}}</option>
                                  @endforeach
                              </select>
                        </div>
                        <div class="form-group font-14 col-md-6 col-sm-12">
                            <label for="desc">Upload Cheque Image
                                <span class="text-danger">*</span>
                            </label>
                            <input class="form-control" type="file" name="depart_cheque" id="depart_cheque">
                        </div>
                        <div class="form-group font-14 col-md-6 col-sm-12">
                            <label for="desc">Check Number
                                <span class="text-danger">*</span>
                            </label>
                            <input class="form-control" type="text" name="c_number" id="c_number">
                        </div>
                        <div class="form-group font-14 col-md-6 col-sm-12">
                            <label for="member">Received By
                                <span class="text-danger">*</span>
                            </label>
                            <select class="form-control" name="received_by" id="received_by">
                                @foreach ($members as $user)
                                  <option>{{$user->name}} | {{$user->fwpnumber}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group font-14 col-md-12 col-sm-12">
                            <label for="desc">Reason/Description for Departure
                                <span class="text-danger">*</span>
                            </label>
                            <textarea type="text" id="finance_departure_res" name="finance_departure_res"
                                class="form-control form-control-sm desc" required maxlength="250"
                                placeholder="Reason for Depature" rows="5"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">
                        <i class="mdi mdi-close-circle"></i> Cancel
                    </button>
                    <a type="" btn-id="" btn-action="save" id="departure-finance-btn"
                        class="btn btn-outline-danger custom-designed-btn btn-sm" data-toggle="modal" data-target="#departure-confirm">
                        <i class="fa fa-ban" aria-hidden="true"></i> Depart Member
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
