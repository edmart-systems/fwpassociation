@extends("layouts.app")
@section("content")
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row ">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12  mx-auto">
                <div class=" ">

                    <!-- Card body -->
                    @if((Auth()->user()->userType==="chairman")||(Auth()->user()->userType==="treasurer") || (Auth()->user()->userType=="Vice Chairperson")
                     || (Auth()->user()->userType=="General Secretary") || (Auth()->user()->userType=="Information and Publicity"))
                    <div class="card-body">
                        <!-- New code -->
                        <div class="container-fluid">
                            <h5 style="color: #FF8533;text-shadow: 2px 2px 4px #000000;font-size: 26px">
                                <strong>SAVINGS</strong>
                            </h5>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                          <h3>UGX: {{ number_format($data['savings']) }}/= </h3>
                                            <p> Total Deposits </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3>UGX: {{ number_format($data['totfine']) }}/= </h3>
                                            <p> Total Fines </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-credit-card" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['social']) }}/= </h3>
                                            <p> Social Contributions </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                          <h3> {{ number_format($data['expectedsavings']) }}/= </h3>
                                            <p> Expected Savings</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-users"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- cards -->
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="card  card-tasks">
                                    <div class="card-header ">
                                        <h4 class="card-title">Fines</h4>
                                    </div>
                                    <div class="card-body ">
                                        <div>
                                            <table class="table"
                                                style="border-left: none; border-right: none; border-top: none;height: 245px;">
                                                <thead>
                                                    <tr>
                                                        <th style="border-left: none; border-right: none;">SrNo</th>
                                                        <th style="border-left: none; border-right: none;">Fine</th>
                                                        <th style="border-left: none; border-right: none;">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            1</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Late Payments</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                           {{ number_format($data['late_payment']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            2</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Late for Meetings</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['late_meeting']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none; border-bottom: 1px solid #e4d8d8;">
                                                            3</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none; border-bottom: 1px solid #e4d8d8;">
                                                            Absenteeism</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none; border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['absenteeism']) }}/=</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="card  card-tasks">
                                    <div class="card-header ">
                                        <h4 class="card-title">Social Contributions</h4>
                                    </div>
                                    <div class="card-body ">
                                        <div class="table-responsive">
                                            <table class="table"
                                                style="border-left: none; border-right: none; border-top: none;">
                                                <thead>
                                                    <tr>
                                                        <th style="border-left: none; border-right: none;">SrNo</th>
                                                        <th style="border-left: none; border-right: none;">Contribution
                                                        </th>
                                                        <th style="border-left: none; border-right: none;">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            1</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Marriage</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['mariage']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            2</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Birth</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['birth']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            3</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Sickness </td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['sickness']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            4</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Death </td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['death']) }}/=</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- cards -->
                        <div class="container-fluid mt-4">
                            <hr>
                            <h5 style="color: #FF8533;text-shadow: 2px 2px 4px #000000;font-size: 26px">
                                <strong>LOANS</strong></h5>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ $data['running_loan'] }} Loans </h3>
                                            <p> Running/Current Loans </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-users"></i>
                                        </div>
                                        <a href="{{ route('allLoans') }}" class="card-box-footer">
                                            View More 
                                            <i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['expected_return']) }}/= </h3>
                                            <p> Expected due amount </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('allLoans') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['expectedloansdue']) }}/= </h3>
                                            <p> Current due amount </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('allLoans') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['totalExpenses']) }}/= </h3>
                                            <p> Expenses </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('allExpenses') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- New code end -->
                    </div>
                    @else
                    <div class="card-body">
                        <!-- New code -->
                        <div class="container-fluid">
                            <h5 style="color: #FF8533;text-shadow: 2px 2px 4px #000000;font-size: 26px">
                                <strong>SAVINGS</strong></h5>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3>UGX: {{ number_format($data['savings1']) }}/= </h3>
                                            <p> Total Deposits </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-equivalent" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3>UGX: {{ number_format($data['totfine1']) }}/= </h3>
                                            <p> Total Fines </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-credit-card" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['social1']) }}/= </h3>
                                            <p> Social Contributions </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['expectedsavings']) }}/= </h3>
                                            <p> Expected Savings</p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-users"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- cards -->
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="card  card-tasks">
                                    <div class="card-header ">
                                        <h4 class="card-title">Fines</h4>
                                    </div>
                                    <div class="card-body ">
                                        <div>
                                            <table class="table"
                                                style="border-left: none; border-right: none; border-top: none;height: 245px;">
                                                <thead>
                                                    <tr>
                                                        <th style="border-left: none; border-right: none;">SrNo</th>
                                                        <th style="border-left: none; border-right: none;">Fine</th>
                                                        <th style="border-left: none; border-right: none;">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            1</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Late Payments</td>1
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['late_payment1']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            2</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Late for Meetings</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['late_meeting1']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none; border-bottom: 1px solid #e4d8d8;">
                                                            3</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none; border-bottom: 1px solid #e4d8d8;">
                                                            Absenteeism</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none; border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['absenteeism1']) }}/=</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="card  card-tasks">
                                    <div class="card-header ">
                                        <h4 class="card-title">Social Contributions</h4>
                                    </div>
                                    <div class="card-body ">
                                        <div class="table-responsive">
                                            <table class="table"
                                                style="border-left: none; border-right: none; border-top: none;">
                                                <thead>
                                                    <tr>
                                                        <th style="border-left: none; border-right: none;">SrNo</th>
                                                        <th style="border-left: none; border-right: none;">Contribution
                                                        </th>
                                                        <th style="border-left: none; border-right: none;">Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            1</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Marriage</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['mariage1']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            2</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Birth</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['birth1']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            3</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Sickness </td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['sickness1']) }}/=</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            4</td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            Death </td>
                                                        <td class="text-left"
                                                            style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                            {{ number_format($data['death1']) }}/=</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- cards -->
                        <div class="container-fluid mt-4">
                            <hr>
                            <h5 style="color: #FF8533;text-shadow: 2px 2px 4px #000000;font-size: 26px">
                                <strong>LOANS</strong></h5>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ $data['running_loan1'] }} Loan </h3>
                                            <p> Running/Current Loan </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-tasks"></i>
                                        </div>
                                        <a href="{{ route('allLoans') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['expected_return1']) }}/= </h3>
                                            <p> Expected Return </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('allLoans') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['expectedloansdue1']) }}/= </h3>
                                            <p> Current due amount </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('allLoans') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6">
                                    <div class="card-box bg-blue">
                                        <div class="inner">
                                            <h3> {{ number_format($data['due_amount']) }}/= </h3>
                                            <p> Due Amount </p>
                                        </div>
                                        <div class="icon">
                                            <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                        </div>
                                        <a href="{{ route('savings') }}" class="card-box-footer">View More <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- New code end -->
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!--  -->
</div>
@endsection