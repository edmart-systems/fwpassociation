@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Savings Details</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('savings') }}">Savings Summary</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Savings Details</li>
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
                <div class="card-body table-holder px-2">
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <h6 class="navbar-heading p-0 text-muted">
                                <span class="docs-normal" style="color: orange">Saving Logs for
                                    {{ strtoupper($user->name) }}</span>
                            </h6>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12" align="right">
                            <a href="{{ route('savings') }}"><button class="btn btn-warning btn-sm"><i
                                        class="fa fa-undo"></i> Back</button></a>
                        @if (Auth()->user()->userType==="treasurer" || Auth()->user()->userType==="chairman")
                            <a  class="btn btn-primary btn-sm float-right add-saving" style="color: white; background-color: rgb(75, 51, 8); border: none;" href="{{ route('indsavingsprint',$user->id) }}">
                                <span class="togglsave"><i class="fa fa-print"></i> Print</span>
                            </a>
                        @endif
                        </div>
                    </div>
                    <hr class="my-3">

                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                    <h6>Member Name</h6>
                                    <h6>FWP Number</h6>
                                    <h6>Social Contributions</h6>
                                    <h6>Total Fines</h6>
                                    <h6>Total Deposits</h6>
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                    <h6>{{ strtoupper($user->name) }}</h6>
                                    <h6>{{ $user->fwpnumber }}</h6>
                                    <h6>{{ number_format($totalsoc) }}/=</h6>
                                    <h6>{{ number_format($totalfin) }}/=</h6>
                                    <h6>{{ number_format($totaldep) }}/=</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                    <h6>Expected Savings</h6>
                                    <h6>Amount Due to Member</h6>
                                    <h6>90% of Amount Due</h6>
                                    <h6>Arrears</h6>
                                    <h6>Running Loan</h6>
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                    <h6>{{ number_format($expected) }}/=</h6>
                                    <h6>{{ number_format($due_amount) }}</h6>
                                    <h6>{{ number_format(0.9 * $due_amount) }}</h6>
                                    <h6>{{ number_format($arrears) }}/= </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-3">
                </div>
            </div>

            <!-- ============= -->
            <div class="card">
                <div class="card-body table-holder px-2">
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <form method="POST" action="{{ route('filter_individial_savings') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group">
                                            <label>From</label>
                                            <input type="date" name="from" class="form-control" required>
                                            <input type="hidden" name="member" class="form-control"
                                                value="{{ $user->id }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-4">
                                        <div class="form-group">
                                            <label>To</label>
                                            <input type="date" name="to" class="form-control" required
                                                value="{{ date('Y-m-d') }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-3 col-sm-4">
                                        <button class="btn btn-outline-primary btn-sm custom-designed-btn" name="filter"
                                            type="submit" style="margin-top: 34px;"><i class="fa fa-filter"></i>
                                            Filter</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12" align="right">
                            <a href="{{ route('savings_profile', $user->id) }}"><button
                                    class="btn btn-outline-primary btn-sm custom-designed-btn" style="margin-top: 34px;"><i
                                        class="fa fa-eye"></i>View All</button></a>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table id="example" class="table hover table-bordered" width="100%" data-page-length="10">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Total Deposit</th>
                                    <th>Late Payments</th>
                                    <th>Late for Meeting</th>
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
                                @foreach ($details as $detail)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ number_format($detail['monthly']) }}</td>
                                        <td>{{ number_format($detail['late_payment']) }}</td>
                                        <td>{{ number_format($detail['late_meeting']) }}</td>
                                        <td>{{ number_format($detail['absenteeism']) }}</td>
                                        <td>{{ number_format($detail['marriage']) }}</td>
                                        <td>{{ number_format($detail['birth']) }}</td>
                                        <td>{{ number_format($detail['death']) }}</td>
                                        <td>{{ number_format($detail['graduation']) }}</td>
                                        <td>{{ number_format($detail['consecration']) }}</td>
                                        <td>{{ number_format($detail['sickness']) }}</td>
                                        <td style="white-space: nowrap;">{{ $detail['date'] }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
