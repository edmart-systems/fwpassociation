@section('dynamic-js')
    <script src="{{ asset('/dist/js/loans.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper row">
        <div class="page-breadcrumb col-md-11 mr-1">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h4 class="page-title">Loan Details</h4>
                    <div class=" d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('loans') }}">User Loans</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Loan Details</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="profile-card-4 z-depth-3">
                            <div class="card">
                                <div class="card-body custom-bg rounded-top">
                                    <div class="col-md-12 text-white">
                                        <strong>
                                            <h4>Loan Balance</h4>
                                            <h5>{{ number_format(intVal($loan_details->reducing_balance)) }}
                                            </h5>
                                        </strong>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body rounded-top">
                                    <div class="col-md-12 custom-color">
                                        <h6>Payback Amount</h6>
                                        <p>{{ number_format(intVal($loan_details->return)) }}</p>
                                        <hr>
                                        <h6>Total Paid</h6>
                                        <p>{{ number_format(intVal($totalPayment)) }}</p>
                                        <hr>
                                        <h6>Disbursed Amount</h6>
                                        <p>{{ number_format(intVal($loan_details->disbursed)) }}</p>
                                        <hr>
                                        <h6>Amount Requested</h6>
                                        <p>{{ number_format(intVal($loan_details->loanamount)) }}</p>
                                        <hr>
                                        <h6>Processing Fees</h6>
                                        <p>{{ number_format(intVal($loan_details->processingfee)) }}</p>
                                        <hr>
                                        <h6>Months Taken</h6>
                                        <p>{{ number_format(intVal($loan_details->monthstaken)) }}</p>
                                    </div>
                                </div>
                                <div class="card-footer text-muted">
                                    <strong class="line-height-5">Requested Date:
                                        <small
                                            class="mfont-weight-bold ml-4">{{ $loan_details->created_at->diffForHumans() }}</small>
                                    </strong>
                                    <hr>
                                    <strong class="line-height-5">Payback Date:
                                        <small class="mfont-weight-bold ml-4">{{ $loan_details->last_payment }}</small>
                                        <br>
                                        Remaining Days: <small
                                            class="mfont-weight-bold ml-2">{{ \Carbon\Carbon::parse($loan_details->last_payment)->diffForHumans() }}</small>
                                    </strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card z-depth-3">
                            <div class="card-body">
                                <ul class="nav nav-pills nav-pills-primary nav-justified">
                                    <li class="nav-item">
                                        <a href="javascript:void();" data-target="#guarantors" data-toggle="pill"
                                            class="nav-link active show custom-pills"><i class="icon-user"></i> <span
                                                class="hidden-xs">Guarantors</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void();" data-target="#payments" data-toggle="pill"
                                            class="nav-link custom-pills"><i class="icon-envelope-open"></i> <span
                                                class="hidden-xs">Payments</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void();" data-target="#messages" data-toggle="pill"
                                            class="nav-link custom-pills"><i class="icon-note"></i> <span
                                                class="hidden-xs">Comments</span></a>
                                    </li>
                                </ul>
                                <div class="tab-content p-3">
                                    <div class="tab-pane active show" id="guarantors">
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <div class="alert-icon">
                                                <i class="icon-info"></i>
                                            </div>
                                            <div class="alert-message">
                                                <strong>Loan Guarantors</strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table"
                                                        style="border-left: none; border-right: none; border-top: none;">
                                                        <thead>
                                                            <tr>
                                                                <th style="border-left: none; border-right: none;">Name</th>
                                                                <th style="border-left: none; border-right: none;">Amount
                                                                    Garanteed
                                                                </th>
                                                                <th style="border-left: none; border-right: none;">Status
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach ($guarantors as $guarantor)
                                                                <tr>
                                                                    <td class="text-left"
                                                                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                                        {{ $guarantor->user->name }}
                                                                    </td>
                                                                    <td class="text-left"
                                                                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                                        {{ number_format($guarantor->g_amount) }}
                                                                    </td>
                                                                    <td class="text-left"
                                                                        style="border-left: none; border-right: none;border-bottom: 1px solid #e4d8d8;">
                                                                        @switch($guarantor->status)
                                                                            @case('NONE')
                                                                                <h5><strong
                                                                                        class="badge badge-pill badge-primary">Pending</strong>
                                                                                </h5>
                                                                            @break

                                                                            @case('approved')
                                                                                <h5><strong
                                                                                        class="badge badge-pill badge-success">Accepted</strong>
                                                                                </h5>
                                                                            @break

                                                                            @case('declined')
                                                                                <h5><strong
                                                                                        class="badge badge-pill badge-danger">Declined</strong>
                                                                                </h5>
                                                                            @break

                                                                            @default
                                                                        @endswitch
                                                                    </td>
                                                                </tr>
                                                            @endforeach
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="payments">
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <div class="alert-icon">
                                                <i class="icon-info"></i>
                                            </div>
                                            <div class="alert-message">
                                                <strong>Loan Payments Information</strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            @if (count($payments) > 0)
                                                @foreach ($payments as $payment)
                                                    <div class="col-md-12">
                                                        <strong>
                                                            <h6>Amount Paid : <span
                                                                    class="custom-color">{{ number_format($payment->amount) }}</span>
                                                            </h6>
                                                        </strong>
                                                        <span>
                                                            <strong>Balance:
                                                                <span class="custom-color">
                                                                    {{ number_format($payment->balance) }}
                                                                </span>
                                                            </strong>
                                                            <br>
                                                            <span class="text-muted">
                                                                <strong>Paid in: </strong>
                                                                <small>
                                                                    {{ $loan_details->months_elapsed }} Months
                                                                </small>
                                                            </span>
                                                            <br>
                                                            <span class="text-muted">
                                                                <strong>Payment Date: </strong>
                                                                <small>
                                                                    {{ $payment->date }}
                                                                </small>
                                                            </span>
                                                            <br>
                                                            <span class="text-muted">
                                                                <strong>Transaction Date: </strong>
                                                                <small>
                                                                    {{ $payment->created_at->diffForHumans() }}
                                                                </small>
                                                            </span>
                                                            <hr>
                                                    </div>
                                                @endforeach
                                            @else
                                                <div class="col-md-12 text-canter">
                                                    <span class="text-muted"><strong>No Payments Made Yet.</strong>
                                                        <hr>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="messages">
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <div class="alert-icon">
                                                <i class="icon-info"></i>
                                            </div>
                                            <div class="alert-message">
                                                <strong>Loan Comments While in Process</strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            @if (count($comments) > 0)
                                                @foreach ($comments as $comment)
                                                    <div class="col-md-12">
                                                        <strong>
                                                            @if ($comment->user->userType == 'chairman')
                                                                <h6>Chair Person</h6>
                                                            @else
                                                                <h6>Financial Secretary</h6>
                                                            @endif
                                                        </strong>
                                                        <span>
                                                            <strong>Action: </strong>
                                                            <small class="text-danger">{{ $comment->action }}</small>
                                                        </span>
                                                        <br>
                                                        <span class="text-muted">
                                                            <strong>Date:
                                                            </strong><small>{{ $comment->created_at->diffForHumans() }}</small>
                                                        </span>
                                                        <p>{{ $comment->message }}</p>
                                                        <hr>
                                                    </div>
                                                @endforeach
                                            @else
                                                <div class="col-md-12 text-canter">
                                                    <span class="text-muted">
                                                        <strong>No Comments on Loan Made Yet.</strong>
                                                    </span>
                                                    <hr>
                                                </div>
                                            @endif
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
