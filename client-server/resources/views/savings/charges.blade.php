@section('dynamic-js')
    <script src="{{ asset('/dist/js/loans.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Charges</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Charges</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    <div align="right">
                        @if (Auth()->user()->userType === 'treasurer' || Auth()->user()->userType === 'chairman')
                        <a  class="btn btn-sm float-right mb-2 custom-designed-btn" data-toggle="modal" data-target="#charge">
                            <span class="togglsave"><i class="fa fa-plus"></i> New Charge</span>
                            @endif
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <span class="connection-check text-danger ml-4" style="font-size: 12px;"></span>
                <!-- column -->
                <div class="col-12">
                    <div class="card">
                        <div class="card-body table-holder px-2">
                            <div class="table-responsive">
                                <table id="example" class="table hover table-bordered" width="100%" data-page-length="10">
                                    <thead>
                                        <tr>
                                            @if (Auth()->user()->userType === 'treasurer' || Auth()->user()->userType === 'chairman')
                                            <th>Actions</th>
                                            @endif
                                            <th>User Name</th>
                                            <th>User Number</th>
                                            <th>Charge Amount</th>
                                            <th style="min-width: 30%;">Reason</th>
                                            <th>Date Charged</th>
                                            <th>Recorded</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            @if (Auth()->user()->userType === 'treasurer' || Auth()->user()->userType === 'chairman')
                                            <th>Actions</th>
                                            @endif
                                            <th>User Name</th>
                                            <th>User Number</th>
                                            <th>Charge Amount</th>
                                            <th style="min-width: 30%;">Reason</th>
                                            <th>Date Charged</th>
                                            <th>Recorded</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                            @foreach($myarr as $charge)
                                            <tr>
                                                @if (Auth()->user()->userType === 'treasurer' || Auth()->user()->userType === 'chairman')
                                                <td>
                                                <div class="dropdown">
                                                    <button
                                                        class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle"
                                                        type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                                        aria-haspopup="true" aria-expanded="false">
                                                        Action
                                                    </button>
                                                    <div class="dropdown-menu px-1 hadow-lg bg-white"
                                                            aria-labelledby="dropdownMenuButton">
                                                        <a class="mt-1 dropdown-item text-primary" href="#"
                                                            data-toggle="modal" data-target="#edit{{ $charge['id'] }}">
                                                            <i class="fa fa-edit"></i> Edit
                                                        </a>
                                                        <a class="mt-1 dropdown-item text-danger" href="#"
                                                            data-toggle="modal" data-target="#delete{{ $charge['id'] }}">
                                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                                        </a>
                                                    </div>
                                                </div>
                                                </td>
                                                @endif
                                                
                                                <td>
                                                    <span class="font-14">
                                                        {{ $charge['name'] }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                        {{ $charge['fwpnumber'] }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                    {{ number_format($charge['amount']) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                            {{ $charge['reason'] }}
                                                        </span>
                                                </td>
                                                <td><span class="font-14">
                                                    {{ $charge['date'] }}
                                                </span></td>
                                                <td><span class="font-14">
                                                    {{ $charge['date_added'] }}
                                                </span></td>
                                            </tr>
<!-- Modal for eding charge -->
   <div class="modal fade" id="edit{{ $charge['id'] }}" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="chargesTitle"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title font-24" id="savingsTitle">Edit Charge for {{ $charge['name'] }}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="POST" action="edit/charge">
            <div class="modal-body">
                    @csrf
                            <div class="form-group font-20">
                                <input type="hidden" name="id" value="{{ $charge['id'] }}">
                                <h6 class="font-20">Member<span class="text-danger">*</span></h6>
                                <select class="browser-default custom-select" name="member">
                                    <option selected disabled value="">Select Member</option>
                                    <?php
                                    $users = DB::table('users')
                                        ->where('users.fwpnumber', '!=', 'NONE_CP')
                                        ->where('users.fwpnumber', '!=', 'NONE_TR')
                                        ->get();
                                    foreach ($users as $user) {
                                        $user = json_decode(json_encode($user), true); ?>
                                        <option value="<?php echo $user['id']; ?>" <?php if($charge['user']==$user['id']){echo "selected";} ?>><?php echo $user['fwpnumber']." | ".$user['name']; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="nomembername yesmembername">
                                <div class="align-items-center d-flex justify-content-center">
                                    <span class="fwpmembername"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="monthly_contribution">Charge Amount<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required name="amount" value="{{ number_format($charge['amount']) }}" onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="ml-auto">
                                <label>Payment Date</label>
                                <input class="form-control monthpaymentx" max="<?php echo date('Y-m-d'); ?>" type="date"
                                    value="{{ $charge['date'] }}" name="date" required />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Reason:</label>
                                <textarea class="form-control" name="reason">{{ $charge['reason'] }}</textarea>
                              </div>
                </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary btn-sm modal-close" data-dismiss="modal"><i
                                class="mdi mdi-close-circle"></i> CLOSE</button>
                        <button type="submit" class="btn btn-sm custom-designed-btn"><i class="mdi mdi-check"></i> UDATE</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal Ends -->

    <!-- Delete Charge -->
    <!-- Deleting Saving -->
        <div class="modal" id="delete{{ $charge['id'] }}" tabindex="-1"
            role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-danger">
                        <h5 class="modal-title text-white font-14">DELETE CHARGE FOR
                            {{ strtoupper($charge['name']) }}</h5>
                        <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="{{ route('delete_charge') }}">
                        @csrf
                        <div class="modal-body">
                            <div class="form-group text-center">
                                <h2 class="text-danger"><i class="fa fa-exclamation"
                                        aria-hidden="true"></i></h2>
                                <h4 class="text-danger">Are You sure you want to delete this
                                    Charge !</h2>
                                    <strong>This is a permanet action.</strong>
                            </div>
                            <input type="hidden" name="charge_id"
                                value="{{ $charge['id'] }}">
                        </div>
                        <div class="modal-footer">
                            <button type="button"
                                class="btn btn-outline-secondary btn-sm modal-close"
                                data-dismiss="modal"><i class="mdi mdi-close-circle"></i>
                                Close</button>
                            <button type="submit" class="btn btn-outline-danger btn-sm"><i
                                    class="fa fa-trash" aria-hidden="true"></i> Confirm
                                Delete</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>
        <!-- Delete ends -->
                                            @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="charge" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="chargesTitle"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title font-24" id="savingsTitle">New Charge</h6>
            </div>
            <form method="POST" action="/add/charge">
            <div class="modal-body">
                    @csrf
                            <div class="form-group font-20">
                                <h6 class="font-20">Member<span class="text-danger">*</span></h6>
                                <select class="browser-default custom-select" name="member">
                                    <option selected disabled value="">Select Member</option>
                                    <?php
                                    $users = DB::table('users')
                                        ->where('users.fwpnumber', '!=', 'NONE_CP')
                                        ->where('users.fwpnumber', '!=', 'NONE_TR')
                                        ->get();
                                    foreach ($users as $user) {
                                        $user = json_decode(json_encode($user), true);
                                        echo "<option value='" . $user['id'] . "'>" . $user['fwpnumber']." | ".$user['name'] . '</option>';
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="nomembername yesmembername">
                                <div class="align-items-center d-flex justify-content-center">
                                    <span class="fwpmembername"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="monthly_contribution">Charge Amount<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required name="amount" placeholder="Amount" onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="ml-auto">
                                <label>Payment Date</label>
                                <input class="form-control monthpaymentx" max="<?php echo date('Y-m-d'); ?>" type="date"
                                    value="<?php echo date('Y-m-d'); ?>" name="date" required />
                            </div>
                            <div class="form-group">
                                <label class="control-label">Reason:</label>
                                <textarea class="form-control" name="reason" placeholder="Enter Reason"></textarea>
                              </div>
                </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary btn-sm modal-close" data-dismiss="modal" onclick="window.location.reload()"><i
                                class="mdi mdi-close-circle"></i> Close</button>
                        <button type="submit" class="btn btn-sm custom-designed-btn"><i class="mdi mdi-check"></i> Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
