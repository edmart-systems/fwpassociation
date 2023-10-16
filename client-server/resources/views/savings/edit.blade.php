@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Edit Savings Details</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('savings') }}">savings</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('view_savings') }}">Savings Details</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Edit Details</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row d-flex">
            <div class="col-md-10 mx-auto row d-flex">
                <div class="col-md-12">
                    <form class="row" method="POST" action="{{ route('update_saving') }}">
                        @csrf
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Member<span class="text-danger">*</span></label>
                                <select class="browser-default custom-select" name="savingscate" id="savingscate_edit">
                                    <option selected value="{{ $editDetails['user_id'] }}">
                                        {{ $editDetails['fwpnumber'] . ' | ' . $editDetails['name'] }}
                                    </option>
                                    <?php
                                    $users = DB::table('users')
                                        ->where('users.fwpnumber', '!=', 'NONE_CP')
                                        ->where('users.fwpnumber', '!=', 'NONE_TR')
                                        ->get();
                                    foreach ($users as $user) {
                                        $user = json_decode(json_encode($user), true);
                                        echo "<option value='" . $user['id'] . "'>" . $user['fwpnumber'] . ' | ' . $user['name'] . '</option>';
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="monthly_contribution">Contribution<span class="text-danger">*</span></label>
                                <input type="number" class="form-control" required name="monthly_contribution"
                                    value="{{ $editDetails['monthly_contribution'] }}" placeholder="00">
                                <input type="hidden" name="id" value="{{ $editDetails['id'] }}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="ml-auto">
                                <label>Month</label>
                                <input class="form-control monthpayment" id="late_edit" max="<?php echo date('Y-m-d'); ?>"
                                    type="date" value="{{ $editDetails['date'] }}" name="month" />
                            </div>
                        </div>

                        <div class="col-md-12">
                            <hr class="my-3">
                            <strong class="docs-normal">Fines</strong>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                {{-- input to hold user arreas --}}
                                <input type="hidden" name="arreas-holder" class="arreas-holder">
                                <label for="late_payment">Late Payment</label>
                                <input type="number" class="form-control qty" required name="late_payment"
                                    id="late_payment_edit" value="{{ $editDetails['late_payment'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="late_meeting">Late for meetings</label>
                                <input type="number" class="form-control qty" required name="late_meeting"
                                    id="late_meeting_edit" value="{{ $editDetails['late_meeting'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="absenteeism">Absenteeism</label>
                                <input type="number" class="form-control qty" required name="absenteeism"
                                    id="absenteeism_edit" value="{{ $editDetails['absenteeism'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <hr class="my-3">
                            <strong class="docs-normal">Events</strong>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="marriage">Marriage</label>
                                <input type="number" class="form-control qty" required name="marriage" id="marriage_edit"
                                    value="{{ $editDetails['marriage'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="birth">Birth</label>
                                <input type="number" class="form-control qty" required name="birth" id="birth_edit"
                                    placeholder="00" value="{{ $editDetails['birth'] }}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="graduation">Graduation</label>
                                <input type="number" class="form-control qty" required name="graduation"
                                    id="graduation_edit" value="{{ $editDetails['graduation'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="consecration">Consecration</label>
                                <input type="number" class="form-control qty" required name="consecration"
                                    id="consecration_edit" value="{{ $editDetails['consecration'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="sickness">Sickness</label>
                                <input type="number" class="form-control qty" required name="sickness" id="sickness_edit"
                                    value="{{ $editDetails['sickness'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="death">Death</label>
                                <input type="number" class="form-control qty" required name="death_edit" id="death"
                                    value="{{ $editDetails['death'] }}" placeholder="00">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="modal-footer">
                                <a href="{{ route('view_savings') }}" type="button"
                                    class="btn btn-outline-danger btn-sm modal-close" data-dismiss="modal"><i
                                        class="mdi mdi-close-circle"></i> Close</a>
                                <button type="submit" btn-id="" btn-action="save" id="save-btn"
                                    class="btn btn-outline-success btn-sm"><i class="fa fa-save"></i> Save
                                    Change</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
