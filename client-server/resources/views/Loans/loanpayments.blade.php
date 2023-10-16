@extends('layouts.app')
@section('content')
    <div class="page-wrapper row">
        <div class="page-breadcrumb col-md-11 mr-1">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h4 class="page-title">Loan Payments</h4>
                    <div class=" d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('allLoans') }}">Running Loans</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Loan Payments</li>
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
                                            <h5>Loan Balance:
                                                {{ number_format(intVal($loan_details->reducing_balance)) }}/=
                                            </h5>
                                        </strong>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body rounded-top">
                                    <div class="col-md-12 custom-color">
                                        <h6>Member Name/Number</h6>
                                        <strong class="text-muted font-12">{{ $loan_details->user->name }} -
                                            {{ $loan_details->user->fwpnumber }}</strong>
                                        <hr>
                                        <h6>Total Paid</h6>
                                        <p>{{ number_format(intVal($totalPayment)) }}</p>
                                        <hr>
                                        <h6>Disbursed Amount</h6>
                                        <p>{{ number_format(intVal($loan_details->disbursed)) }}</p>
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
                                        <a href="javascript:void();" data-target="#payment" data-toggle="pill"
                                            class="nav-link active show custom-pills"><i class="icon-user"></i> <span
                                                class="hidden-xs">Payment</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void();" data-target="#payments" data-toggle="pill"
                                            class="nav-link custom-pills"><i class="icon-envelope-open"></i> <span
                                                class="hidden-xs">Payment Logs</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void();" data-target="#guarantors" data-toggle="pill"
                                            class="nav-link custom-pills"><i class="icon-user"></i> <span
                                                class="hidden-xs">Guarantors</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:void();" data-target="#cheque" data-toggle="pill"
                                            class="nav-link custom-pills"><i class="icon-note"></i> <span
                                                class="hidden-xs">Cheque Details</span></a>
                                    </li>
                                </ul>
                                <div class="tab-content p-3">
                                    <div class="tab-pane active show" id="payment">
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <div class="alert-icon">
                                                <i class="icon-info"></i>
                                            </div>
                                            <div class="alert-message">
                                                Payment Mode:
                                                @if ($loan_details->payment_mode == 'lump')
                                                    <strong>lump sum Payment</strong>
                                                @else
                                                    <strong>Instalment Payments</strong>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="row d-flex">
                                            <div class="col-md-8 mx-auto">
                                                <form method="POST" action="{{ route('payLoan') }}">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="form-group font-14 col-md-12 col-sm-12">
                                                                <label for="desc">Payment Amount
                                                                    <span class="text-danger">*</span>
                                                                </label>
                                                                @if ($loan_details->payment_mode == 'lump')
                                                                    <input type="text" disabled class="form-control"
                                                                        value="{{ number_format($loan_details->reducing_balance) }}"
                                                                        onkeyup="this.value=addCommas(this.value);"
                                                                        required>
                                                                    <input type="hidden" class="form-control"
                                                                        value="{{ number_format($loan_details->reducing_balance) }}"
                                                                        name="amount" id="amount">
                                                                @else
                                                                    <input type="text" class="form-control"
                                                                        onkeyup="this.value=addCommas(this.value);"
                                                                        name="amount" required id="amount">
                                                                @endif
                                                                <input type="hidden" name="loans_id"
                                                                    value="{{ $loan_details->id }}">
                                                            </div>
                                                            <div class="form-group font-14 col-md-12 col-sm-12">
                                                                <label for="desc">Payment Date <span
                                                                        class="text-danger">*</span></label>
                                                                <input type="date" name="payment_date" id="payment_date"
                                                                    class="form-control" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" btn-id="" btn-action="save" id="pay-btn"
                                                            class="btn btn-outline-success custom-designed-btn btn-sm">
                                                            <i class="fa fa-check-circle"></i> Make Payment
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="guarantors">
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
                                                                            @case(" NONE")
                                                                                <h5><strong
                                                                                        class="badge badge-pill badge-primary">Pending</strong>
                                                                                </h5>
                                                                            @break
                                                                            @case(" approved")
                                                                                <h5><strong
                                                                                        class="badge badge-pill badge-success">Accepted</strong>
                                                                                </h5>
                                                                            @break
                                                                            @case(" declined")
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
                                                <strong>Loan Payments Logs</strong>
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
                                                        <span><strong>Balance: <span
                                                                    class="custom-color">{{ number_format($payment->balance) }}</span></strong>
                                                            <br>
                                                            <span class="text-muted"><strong>Payment Date:
                                                                </strong>
                                                                <small>
                                                                    {{ \Carbon\Carbon::parse($payment->date)->diffForHumans() }}
                                                                </small>
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
                                    <div class="tab-pane" id="cheque">
                                        <div class="card">
                                            <div class="card-body">
                                                <center class="m-t-30">
                                                    <img src={{ asset('cheques/' . $disburse->cheque_image) }}
                                                        class="rounded" height="300" />
                                                </center>
                                            </div>
                                            <div>
                                                <hr>
                                            </div>
                                            <div class="card-body">
                                                <small class="text-muted">Cheque Number: </small>
                                                <span>{{ $disburse->cheque_no }}</span>
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
