@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345')}}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Rejected Savings</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Rejected Savings</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    <!-- <div class="text-right upgrade-btn"> 
                    @if ((Auth()->user()->userType==="treasurer"))
                        <a  class="btn btn-primary btn-sm float-right mb-2 add-saving" data-toggle="modal" data-target="#savings" style="color: white; background-color: orange; border: none;">
                            <span class="togglsave"><i class="fa fa-plus"></i> Add Savings</span>
                        </a>
                    @endif
                    </div> -->
                </div>
            </div>
        </div>
        
            <!-- END FOR TODAY -->
        
        <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card">
                    <div class="card-body  table-holder px-2">
                        <div class="table-responsive">
                                <table id="example" class="table hover table-bordered" width="100%" data-page-length="10">
                                    <thead>
                                        <tr>
                                            <th>Action</th>
                                            <th>No</th>
                                            <th>Reason</th>
                                            <th>Member</th>
                                            <th>FWP Number</th>
                                            <th>Total Deposit</th>
                                            <th>Late Payment</th>
                                            <th>Late Meeting</th>
                                            <th>Absenteeism</th>
                                            <th>Marriage</th>
                                            <th>Birth</th>
                                            <th>Death</th>
                                            <th>Graduation</th>
                                            <th>Consecration</th>
                                            <th>Sickness</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($details as $detail)
                                        <tr>
                                            <td>
                                                @if ((Auth()->user()->userType==="treasurer"))
                                                <button class="btn btn-sm btn-outline-primary custom-designed-btn" title="Edit" data-toggle="modal" data-target="#edit{{ $detail['id'] }}"><i class="fa fa-edit"></i></button>
                                                <a href="{{ route('delete_savings',$detail['id']) }}" class="btn btn-sm btn-outline-danger" title="Delete"><i class="fa fa-trash"></i></a>
                                                @endif
                                                @if ((Auth()->user()->userType==="chairman"))
                                                <a href="{{ route('approveSaving',$detail['id']) }}" class="btn btn-sm btn-outline-primary" title="Approve"><i class="fa fa-check"></i>Approve</a>
                                                <button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#exampleModal{{ $detail['id'] }}" title="Decline"><i class="fa fa-times"></i> Decline</button>
                                                @endif
                                            </td>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $detail['message'] }}</td>
                                            <td>{{ $detail['username'] }}</td>
                                            <td>{{ $detail['fwpnumber'] }}</td>
                                            <td>{{ number_format($detail['monthly']) }}</td>
                                            <td>{{ number_format($detail['late_payment']) }}</td>
                                            <td>{{ number_format($detail['late_meeting']) }}</td>
                                            <td>{{ number_format($detail['absenteeism']) }}</td>
                                            <td>{{ number_format($detail['marriage']) }}</td>
                                            <td>{{ number_format($detail['birth']) }}</td>
                                            <td>{{ number_format($detail['death']) }}</td>
                                            <td>{{ number_format($detail['graduation']) }}</td>
                                            <td>{{ number_format($detail['consecration']) }}</td>
                                            <td>{{ number_format($detail['sickness'])  }}</td>
                                            <td style="white-space: nowrap;">{{ $detail['date']  }}</td>
                                        </tr>
    <!-- Decline a saving -->
<div class="modal fade" id="exampleModal{{ $detail['id'] }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalLabel">Decline Savings for {{ $detail['username'] }} for {{ $detail['date'] }}</h6>
      </div>
      <form method="POST" action="{{ route('declineSaving') }}">
        @csrf
      <div class="modal-body">
          <div class="form-group">
            <input type="hidden" name="saving" value="{{ $detail['id'] }}">
            <label class="control-label">Message:</label>
            <textarea class="form-control" name="message" placeholder="Enter Reason" required></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
        <button type="submit" class="btn btn-danger btn-sm"><i class="fa fa-arrow-right"></i> Decline</button>
      </div>
  </form>
    </div>
  </div>
</div>

<!-- Edit a saving -->
<div class="modal fade" id="edit{{ $detail['id'] }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <h6 class="modal-title" id="exampleModalLabel">Edit Saving for {{ $detail['username'] }} for {{ $detail['date'] }}</h6>
      </div>
      <form method="POST" action="{{ route('editSaving') }}">
        @csrf
      <div class="modal-body">
          <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <h6 class="modal-heading p-0 font-20">
                                <span class="docs-normal">Saving Details</span>
                            </h6>
                            <input type="hidden" name="saving" value="{{ $detail['id'] }}">
                            <div class="form-group">
                                <label for="monthly_contribution">Member<span class="text-danger">*</span></label>
                                <select class="browser-default custom-select" name="savingscate" id="savingscate">
                                    <option selected disabled value="">Select Member</option>
                                    <?php
                                    $users = DB::table('users')
                                        ->where('users.fwpnumber', '!=', 'NONE_CP')
                                        ->where('users.fwpnumber', '!=', 'NONE_TR')
                                        ->get();
                                    foreach ($users as $user) {
                                        $user = json_decode(json_encode($user), true); ?>
                                       <option value="<?php echo $user['id']; ?>" <?php if($user['id']==$detail['member']){ echo "selected"; } ?>> <?php echo $user['fwpnumber']." | ".$user['name']; ?></option>;
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="nomembername yesmembername">
                                <div class="align-items-center d-flex justify-content-center">
                                    <span class="fwpmembername"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="monthly_contribution">Contribution<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required name="monthly_contribution"
                                    onkeyup="this.value=addCommas(this.value);" value="{{ number_format($detail['monthly']) }}">
                            </div>
                            <div class="ml-auto">
                                <label>Payment Date</label>
                                <input class="form-control monthpayment" max="<?php echo date('Y-m-d'); ?>" type="date"
                                    value="{{ $detail['date'] }}" name="month" />
                            </div>
                            <div class="form-group">
                                <label>Arrears<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required name="arreasws"
                                     onkeyup="this.value=addCommas(this.value);" value="{{ number_format($detail['arrears']) }}">
                            </div>
                            <hr class="my-3">
                            <div class="form-group">
                                <label for="late_payment">Late Payment</label>
                                <input type="text" class="form-control qty" required name="late_payment" value="{{ number_format($detail['late_payment']) }}">
                            </div>
                            <div class="form-group">
                                <label>Late For Meetings</label>
                                <input type="text" required name="late_meeting" value="{{ number_format($detail['late_meeting']) }}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Absenteeism</label>
                                <input type="text" required name="absenteeism" value="{{ number_format($detail['absenteeism']) }}" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <h6 class="modal-heading p-0 font-20">
                                <span class="docs-normal">Events</span>
                            </h6>
                            <div class="form-group">
                                <label for="marriage">Marriage</label>
                                <input type="text" class="form-control qty" required name="marriage" value="{{ number_format($detail['marriage']) }}"
                                    placeholder="00" onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="form-group">
                                <label for="birth">Birth</label>
                                <input type="text" class="form-control qty" required name="birth" id="birth" placeholder="00"
                                    value="{{ number_format($detail['birth']) }}" onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="form-group">
                                <label for="graduation">Graduation</label>
                                <input type="text" class="form-control qty" required name="graduation" id="graduation"
                                    value="{{ number_format($detail['graduation']) }}" onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="form-group">
                                <label for="consecration">Consecration</label>
                                <input type="text" class="form-control qty" required name="consecration"
                                    value="{{ number_format($detail['consecration']) }}" onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="form-group">
                                <label for="sickness">Sickness</label>
                                <input type="text" class="form-control qty" required name="sickness" value="{{ number_format($detail['sickness']) }}"
                                 onkeyup="this.value=addCommas(this.value);">
                            </div>
                            <div class="form-group">
                                <label for="death">Death</label>
                                <input type="text" class="form-control qty" required name="death" value="{{ number_format($detail['death']) }}"
                                    onkeyup="this.value=addCommas(this.value);">
                            </div>
                        </div>
                    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger btn-sm" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
        <button type="submit" class="btn btn-outline-primary btn-sm custom-designed-btn"><i class="fa fa-arrow-right"></i> Confirm</button>
      </div>
  </form>
    </div>
  </div>
</div>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>

                    </div>  
                </div>
        </div>
    </div>
@endsection