@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Running Loans</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Running Loans</li>
                            </ol>
                        </nav>
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
                        <div class="card-body">
                            <ul class="nav nav-pills nav-pills-primary nav-justified">
                                <li class="nav-item">
                                    <a href="javascript:void();" data-target="#runningloans" data-toggle="pill"
                                        class="nav-link active show custom-pills"><i class="icon-user"></i> <span
                                            class="hidden-xs">Running loans</span></a>
                                </li>
                                <li class="nav-item">
                                    <a href="javascript:void();" data-target="#clearrequests" data-toggle="pill"
                                        class="nav-link custom-pills"><i class="icon-envelope-open"></i>
                                        <span class="hidden-xs">Clear Loan Requests
                                            @if (count($loanRequested) > 0)
                                                <span class="badge badge-success"
                                                    style="font-size: 15px">{{ count($loanRequested) }}</span>
                                            @endif
                                        </span>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content p-3">
                                <div class="tab-pane active show" id="runningloans">
                                    <strong class="font-12 custom-color">Non Cleared Running Loans</strong>
                                    <div class="card mt-2">
                                        <div class="card-body table-holder px-2">
                                            <div class="table-responsive">
                                                <table id="example" class="table hover table-bordered" width="100%"
                                                    data-page-length="10">
                                                    <thead>
                                                        <tr>
                                                            <th>Actions</th>
                                                            <th>Status</th>
                                                            <th style="min-width: 30%;">Description</th>
                                                            <th>Amount</th>
                                                            <th>Months</th>
                                                            <th>Processing Fee</th>
                                                            <th>Return</th>
                                                            <th>Reducing Balance</th>
                                                            <th>User Name</th>
                                                            <th>User Number</th>
                                                            <th>Deadline Date</th>
                                                            <th>Date of Transaction</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Actions</th>
                                                            <th>Status</th>
                                                            <th style="min-width: 30%;">Description</th>
                                                            <th>Amount</th>
                                                            <th>Months</th>
                                                            <th>Processing Fee</th>
                                                            <th>Return</th>
                                                            <th>Reducing Balance</th>
                                                            <th>User Name</th>
                                                            <th>User Number</th>
                                                            <th>Deadline Date</th>
                                                            <th>Date of Transaction</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        @foreach ($loans as $loan)
                                                            <tr>
                                                                <td>
                                                                    <div class="dropdown">
                                                                        <button
                                                                            class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle"
                                                                            type="button" id="dropdownMenuButton"
                                                                            data-toggle="dropdown" aria-haspopup="true"
                                                                            aria-expanded="false">
                                                                            <i class="fa fa-cog"
                                                                                aria-hidden="true"></i>
                                                                            Action
                                                                        </button>
                                                                        <div class="dropdown-menu px-1 hadow-lg bg-white"
                                                                            aria-labelledby="dropdownMenuButton">
                                                                            <a class="mt-1 dropdown-item custom-color"
                                                                                href="{{ route('loansRuningDetails', $loan->id) }}">
                                                                                <i class="fa fa-eye"
                                                                                    aria-hidden="true"></i>
                                                                                Details
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    @if ($loan['status'] === 'running')
                                                                        <h5>
                                                                            <strong
                                                                                class="badge badge-pill badge-success">Running</strong>
                                                                        </h5>
                                                                    @endif
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ $loan['desc'] }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ number_format($loan['loanamount']) }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ $loan['months_elapsed'] }} from
                                                                        {{ $loan['monthstaken'] }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ number_format($loan['processingfee']) }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span
                                                                        class="font-14">{{ number_format($loan['return']) }}</span>
                                                                </td>
                                                                <td>
                                                                    <span
                                                                        class="font-14">{{ number_format($loan['reducing_balance']) }}</span>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['user']['name'] }}</span>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['user']['fwpnumber'] }}</span>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['last_payment'] }}</span>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['created_at']->diffForHumans() }}</span>
                                                                </td>
                                                            </tr>
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="clearrequests">
                                    <strong class="font-12 custom-color mt-1 mb-1">Loan Payments Requests </strong>
                                    <div class="card mt-2">
                                        <div class="card-body table-holder px-2">
                                            <div class="table-responsive">
                                                <table id="example" class="table hover table-bordered" width="100%"
                                                    data-page-length="10">
                                                    <thead>
                                                        <tr>
                                                            <th>Actions</th>
                                                            <th>Name</th>
                                                            <th>Number</th>
                                                            <th style="min-width: 30%;">Description</th>
                                                            <th>Amount</th>
                                                            <th>Months</th>
                                                            <th>Processing Fee</th>
                                                            <th>Return</th>
                                                            <th>Reducing Balance</th>
                                                            <th>Deadline Date</th>
                                                            <th>Status</th>
                                                            <th>Date of Transaction</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Actions</th>
                                                            <th>Name</th>
                                                            <th>Number</th>
                                                            <th style="min-width: 30%;">Description</th>
                                                            <th>Amount</th>
                                                            <th>Months</th>
                                                            <th>Processing Fee</th>
                                                            <th>Return</th>
                                                            <th>Reducing Balance</th>
                                                            <th>Deadline Date</th>
                                                            <th>Status</th>
                                                            <th>Date of Transaction</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        @foreach ($loanRequested as $loan)
                                                            <tr>
                                                                <td>
                                                                    <div class="dropdown">
                                                                        <button
                                                                            class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle"
                                                                            type="button" id="dropdownMenuButton"
                                                                            data-toggle="dropdown" aria-haspopup="true"
                                                                            aria-expanded="false">
                                                                            <i class="fa fa-cog"
                                                                                aria-hidden="true"></i>
                                                                            Action
                                                                        </button>
                                                                        <div class="dropdown-menu px-1 hadow-lg bg-white"
                                                                            aria-labelledby="dropdownMenuButton">
                                                                            <a class="mt-1 dropdown-item custom-color"
                                                                                href="{{ route('loansRuningDetails', $loan->id) }}">
                                                                                <i class="fa fa-eye"
                                                                                    aria-hidden="true"></i>
                                                                                Details
                                                                            </a>
                                                                            <a class="mt-1 dropdown-item text-success"
                                                                                href="{{ route('loansRepayment', $loan->id) }}">
                                                                                <i class="fa fa-check-circle"></i> Make
                                                                                Payment
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['user']['name'] }}</span>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['user']['fwpnumber'] }}</span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ $loan['desc'] }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ number_format($loan['loanamount']) }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ $loan['months_elapsed'] }} from
                                                                        {{ $loan['monthstaken'] }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span class="font-14">
                                                                        {{ number_format($loan['processingfee']) }}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <span
                                                                        class="font-14">{{ number_format($loan['return']) }}</span>
                                                                </td>
                                                                <td>
                                                                    <span
                                                                        class="font-14">{{ number_format($loan['reducing_balance']) }}</span>
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['last_payment'] }}</span>
                                                                </td>
                                                                <td>
                                                                    @if ($loan['status'] === 'pay')
                                                                        <h5>
                                                                            <strong
                                                                                class="badge badge-pill badge-success">Clearance
                                                                                Requested</strong>
                                                                        </h5>
                                                                    @endif
                                                                </td>
                                                                <td><span
                                                                        class="font-14">{{ $loan['created_at']->diffForHumans() }}</span>
                                                                </td>
                                                            </tr>
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
                </div>
            </div>
        </div>
    </div>
@endsection
