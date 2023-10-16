@section('dynamic-js')
<script src="{{ asset('/dist/js/loans.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')

{{-- loan details --}}
@include('Loans.guarantor_requests')

{{-- withdrawing loan --}}
@include('Loans.withdraw')

{{-- Deleting modal alert for loans --}}
@include('Loans.delete')

{{-- adding loans modal --}}
@include('Loans.create')

<div class="page-wrapper row">
    <div class="page-breadcrumb col-md-11 mr-1">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h4 class="page-title">Loan Requests</h4>
                <div class=" d-flex align-items-center">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Loan Requests</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="col-md-6">
                @if (Auth()->user()->userType == 'chairman' || Auth()->user()->userType == 'treasurer')
                @else
                <div class="btn-group btn-sm float-right" role="group" aria-label="Basic example">
                    @if ($loans <= 0) <button type="button" class="btn btn-sm btn-outline-primary loanmember"
                        data-toggle="modal" data-target="#loans">
                        <i class="fa fa-plus"></i> New Loan
                        </button>
                        @endif
                        <button type="button" class="btn btn-sm btn-outline-success notification" data-toggle="modal"
                            data-target="#guarantor">
                            Guarator Request
                            <!-- <i class="fa fa-bell"> -->
                            <span
                                class="badge badge-primary"><strong>{{ count($guarantor_requests) }}</strong></span></i>
                            <span class="badge2 badge3 badge-quarantor custom-badge badge-default"></span>
                        </button>
                </div>
                @endif
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <span class="connection-check text-danger ml-4" style="font-size: 12px;"></span>
            <!-- column -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body table-holder px-2">
                        <div class="table-responsive">
                            <table id="example" class="table hover table-bordered" data-page-length="10">
                                <thead>
                                    <tr>
                                        <th>Actions</th>
                                        <th>Status</th>
                                        <th>Loan Amount</th>
                                        <th>Months</th>
                                        <th>Processing Fee</th>
                                        <th>Loan Return</th>
                                        <th>Reducing Balance</th>
                                        <th>Disbursed Amount</th>
                                        <th>Guarantors</th>
                                        <th>Payments</th>
                                        <th>Deadline</th>
                                        <th>Requested Date</th>
                                        <th>Transaction Date</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Actions</th>
                                        <th>Status</th>
                                        <th>Loan Amount</th>
                                        <th>Months</th>
                                        <th>Processing Fee</th>
                                        <th>Loan Return</th>
                                        <th>Reducing Balance</th>
                                        <th>Disbursed Amount</th>
                                        <th>Guarantors</th>
                                        <th>Payments</th>
                                        <th>Deadline</th>
                                        <th>Requested Date</th>
                                        <th>Transaction Date</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    @foreach ($user_loans as $loan)
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
                                                    @if ($loan->status == 'waiting_guarantor')
                                                    <a class="mt-1 edit-btn text-primary dropdown-item"
                                                        data-id="{{ $loan->id }}" href="#">
                                                        <i class="fa fa-edit"></i> Edit
                                                    </a>
                                                    <a class="mt-1 dropdown-item text-danger delete-btn"
                                                        data-id="{{ $loan->id }}" href="#">
                                                        <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                                    </a>
                                                    @endif
                                                    @if ($loan->status == 'approved')
                                                    <a class="mt-1 dropdown-item text-warning widtraw-loan-btn"
                                                        data-id="{{ $loan->id }}" data-loanfees="{{ $loan->processingfee }}"
                                                        href="#">
                                                        <i class="fa fa-reply" aria-hidden="true"></i> Withdraw
                                                    </a>
                                                    @endif
                                                    @if ($loan->status == 'running')
                                                    <a class="mt-1 dropdown-item text-success clear-loan-btn"
                                                        data-id="{{ $loan->id }}" href="#">
                                                        <i class="fa fa-check"></i> Request Clearance
                                                    </a>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            @switch($loan->status)
                                            @case("waiting_guarantor")
                                            <h5><strong class="badge badge-pill custom-bg badge-primary">Waiting</strong>
                                            </h5>
                                            @break
                                            @case("pending")
                                            <h5><strong class="badge badge-pill badge-primary">Pending</strong></h5>
                                            @break
                                            @case("recommended")
                                            <h5><strong class="badge badge-pill badge-warning">Recommended</strong></h5>
                                            @break
                                            @case("declined")
                                            <h5><strong class="badge badge-pill badge-secondary">Declined</strong></h5>
                                            @break
                                            @case("cancelled")
                                            <h5><strong class="badge badge-pill badge-danger">Cancelled</strong></h5>
                                            @break
                                            @case("withdrawn")
                                            <h5><strong class="badge badge-pill badge-danger">Withdrawn</strong></h5>
                                            @break
                                            @case("approved")
                                            <h5><strong class="badge badge-pill badge-success">Approved</strong></h5>
                                            @break
                                            @case("running")
                                            <h5><strong class="badge badge-pill badge-success">Running</strong></h5>
                                            @break
                                            @case("pay")
                                            <h5><strong class="badge badge-pill badge-success">Under Clearance</strong>
                                            </h5>
                                            @break
                                            @case("cleared")
                                            <h5><strong class="badge badge-pill badge-default">Cleared</strong>
                                            </h5>
                                            @break
                                            @default
                                            @endswitch
                                        </td>
                                        <td><span class="font-14">{{ number_format($loan->loanamount) }}</span></td>
                                        <td><span class="font-14">
                                                {{ $loan->months_elapsed }} from {{ $loan->monthstaken }}
                                            </span>
                                        </td>
                                        <td><span class="font-14">{{ number_format($loan->processingfee) }}</span></td>
                                        <td><span class="font-14">{{ number_format($loan->return) }}</span></td>
                                        <td><span class="font-14">{{ number_format($loan->reducing_balance) }}</span></td>
                                        <td><span class="font-14">{{ number_format(round(intval($loan->disbursed))) }}</span></td>
                                        <td><span class="font-14">{{ count($loan->guarantors) }}</span></td>
                                        <td><span class="font-14">{{ count($loan->payments) }}</span></td>
                                        <td><span class="font-14">{{ $loan->last_payment }}</span></td>
                                        <td><span class="font-14">{{ $loan->request_date }}</span></td>
                                        <td><span class="font-14">{{ $loan->created_at->diffForHumans() }}</span></td>
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