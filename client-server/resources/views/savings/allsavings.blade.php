@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345')}}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">All Member Savings</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{route('savings')}}">Savings Summary</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><a href="{{ route('AllSavings') }}">All Member Savings</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    
                </div>
            </div>
        </div>
        
            <!-- END FOR TODAY -->
        
        <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card">
                    <div class="card-body" style="max-width: 1300px;">
                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <form method="POST" action="{{ route('fiter_all_avings') }}">
                                        @csrf
                                <div class="row">
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group">
                                            <label>From</label>
                                            <input type="date" name="from" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group">
                                            <label>To</label>
                                            <input type="date" name="to" class="form-control" required value="{{ date('Y-m-d') }}">
                                        </div>
                                    </div>
                                     <div class="col-md-4 col-lg-3 col-sm-4">
                                        <button class="btn btn-outline-primary btn-sm custom-designed-btn" name="filter" type="submit" style="margin-top: 34px;"><i class="fa fa-filter"></i> Filter</button>
                                    </div>
                                </div>
                            </form>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                
                            </div>
                        </div>
                            <div class="table-responsive">
                                <table width="100%" id="example" class="display">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Name</th>
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
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>Name</th>
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
                                            <th>Status</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach($details as $detail)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $detail['name'] }}</td>
                                            <td>{{ $detail['fwpnumber'] }}</td>
                                            <td>{{ number_format($detail['monthly']) }}</td>
                                            <td>{{ number_format($detail['late_payment']) }}</td>
                                            <td>{{ number_format($detail['late_meeting']) }}</td>
                                            <td>{{ number_format($detail['absenteeism']) }}</td>
                                            <td>{{ number_format($detail['marriage']) }}</td>
                                            <td>{{ number_format($detail['birth'])  }}</td>
                                            <td>{{ number_format($detail['death'])  }}</td>
                                            <td>{{ number_format($detail['graduation'])  }}</td>
                                            <td>{{ number_format($detail['consecration'])  }}</td>
                                            <td>{{ number_format($detail['sickness'])  }}</td>
                                            <td style="white-space: nowrap;">{{ $detail['date']  }}</td>
                                            <td>@if($detail['status']=="Approved")
                                                <span class="badge badge-success" style="padding: 7px">Approved</span>
                                                @else
                                                <span class="badge badge-warning">Pending</span>
                                                @endif
                                            </td>
                                        </tr>
                                        @endforeach
                                        <tr>
                                            <td><strong>TOTALS</strong></td>
                                            <td></td>
                                            <td></td>
                                            <td><strong>{{ number_format($totals['totaldeposit']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totallatepay']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totallatemeet']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totalabs']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totalmar']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totalbirth']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totaldeath']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totalgrad']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totalcons']) }}</strong></td>
                                            <td><strong>{{ number_format($totals['totalsick']) }}</strong></td>
                                             <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                    </div>  
                </div>
        </div>
    </div>
@endsection