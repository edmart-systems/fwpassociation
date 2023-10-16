@section('dynamic-js')
    <script src="{{ asset('/dist/js/loans.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Cleared Loans</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Cleared Loans</li>
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
                        <div class="card-body table-holder px-2">
                            <div class="table-responsive">
                                <table id="example" class="table hover table-bordered" width="100%" data-page-length="10">
                                    <thead>
                                        <tr>
                                            <th>Actions</th>
                                            <th>Status</th>
                                            <th style="min-width: 40%;">Description</th>
                                            <th>Loan Amount</th>
                                            <th>Months Taken</th>
                                            <th>Processing Fee</th>
                                            <th>Loan Return</th>
                                            <th>User Name</th>
                                            <th>User Number</th>
                                            <th>Payment Date</th>
                                            <th>Date</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Actions</th>
                                            <th>Status</th>
                                            <th style="min-width: 40%;">Description</th>
                                            <th>Loan Amount</th>
                                            <th>Months Taken</th>
                                            <th>Processing Fee</th>
                                            <th>Loan Return</th>
                                            <th>User Name</th>
                                            <th>User Number</th>
                                            <th>Payment Date</th>
                                            <th>Date</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ($loans as $loan)
                                            <tr>
                                                <td>
                                                    <div class="dropdown">
                                                        <button
                                                            class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle"
                                                            type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            <i class="fa fa-cog" aria-hidden="true"></i> Action
                                                        </button>
                                                        <div class="dropdown-menu px-1 hadow-lg bg-white"
                                                            aria-labelledby="dropdownMenuButton">
                                                            <a class="mt-1 dropdown-item custom-color"
                                                                href="{{ route('loansDetails', $loan->id) }}">
                                                                <i class="fa fa-eye" aria-hidden="true"></i> Details
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <h5>
                                                        <strong
                                                            class="badge badge-pill badge-secondary">{{$loan->status}}</strong>
                                                    </h5>
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
                                                    <span class="font-14">{{ $loan['monthstaken'] }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                        {{ number_format($loan['processingfees']) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span
                                                        class="font-14">{{ number_format($loan['return']) }}</span>
                                                </td>
                                                <td><span class="font-14">{{ $loan['user']['name'] }}</span></td>
                                                <td><span class="font-14">{{ $loan['user']['fwpnumber'] }}</span>
                                                </td>
                                                <td><span class="font-14">{{ $loan['last_payment'] }}</span></td>
                                                <td><span class="font-14">{{ $loan['created_at']->diffForHumans() }}</span></td>
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
@endsection
