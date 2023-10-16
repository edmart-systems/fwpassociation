@section('dynamic-js')
    <script src="{{ asset('/dist/js/loans.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Approved Loans</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Approved Loans</li>
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
                                            <th>Amount</th>
                                            <th>Months Taken</th>
                                            <th>Processing Fee</th>
                                            <th>Disbursed</th>
                                            <th>Return</th>
                                            <th>User Name</th>
                                            <th>User Number</th>
                                            <th>Payment Date</th>
                                            <th>Date of Creation</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Actions</th>
                                            <th>Status</th>
                                            <th style="min-width: 40%;">Description</th>
                                            <th>Amount</th>
                                            <th>Months Taken</th>
                                            <th>Processing Fee</th>
                                            <th>Disbursed</th>
                                            <th>Return</th>
                                            <th>User Name</th>
                                            <th>User Number</th>
                                            <th>Payment Date</th>
                                            <th>Date of Creation</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ($loans as $loan)
                                            <tr>
                                                {{-- More for comments of loans modal --}}


                                                <div class="modal fade" id="finance-more-{{ $loan['id'] }}"
                                                    tabindex="-1" role="dialog" aria-labelledby="loansTitle"
                                                    aria-hidden="true">
                                                    <div class="modal-dialog modal-lg modal-dialog-centered"
                                                        role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title font-15" id="loansTitle">Loan
                                                                    Comments</h5>
                                                                <button type="button" class="close"
                                                                    data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <form id="finance-loan-form">
                                                                <div class="modal-body">
                                                                    <div class="alert alert-info alert-dismissible"
                                                                        role="alert">
                                                                        <div class="alert-icon">
                                                                            <i class="icon-info"></i>
                                                                        </div>
                                                                        <div class="alert-message">
                                                                            <strong>Loan Comments While in Process</strong>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        @if (count($loan['comments']) > 0)
                                                                            @foreach ($loan['comments'] as $comment)
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
                                                                                        <small
                                                                                            class="text-danger">{{ $comment->action }}</small>
                                                                                    </span>
                                                                                    <br>
                                                                                    <span class="text-muted"><strong>Date:
                                                                                        </strong><small>{{ $comment->created_at->diffForHumans() }}</small>
                                                                                    </span>
                                                                                    <p>{{ $comment->message }}</p>
                                                                                    <hr>
                                                                                </div>
                                                                            @endforeach
                                                                        @else
                                                                            <div class="col-md-12 text-canter">
                                                                                <span class="text-muted"><strong>No
                                                                                        Comments on Loan Made
                                                                                        Yet.</strong></span>
                                                                                <hr>
                                                                            </div>
                                                                        @endif
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-outline-secondary btn-sm modal-close"
                                                                        data-dismiss="modal"><i
                                                                            class="mdi mdi-close-circle"></i> Close</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>


                                                {{-- More for re recomend a loans modal --}}
                                                <div class="modal fade" id="disburse-loan-{{ $loan['id'] }}"
                                                    data-backdrop="static" tabindex="-1" role="dialog"
                                                    aria-labelledby="loansTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-md modal-dialog-centered"
                                                        role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title font-15" id="loansdisburseTitle">
                                                                    Disburse Loan</h5>
                                                                <button type="button" class="close"
                                                                    data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <form enctype="multipart/form-data" method="POST"
                                                                action="{{ route('disburseLoan') }}">
                                                                @csrf
                                                                <div class="modal-body">
                                                                    <div class="row">
                                                                        <div
                                                                            class="form-group font-14 col-md-10  m-auto col-sm-12">
                                                                            <strong for="desc">Amount to disburse
                                                                            </strong>
                                                                            <p><strong
                                                                                    class="custom-color">{{ number_format($loan['disbursed']) }}
                                                                                    /=</strong></p>
                                                                        </div>
                                                                        <div
                                                                            class="form-group font-14 col-md-10  m-auto col-sm-12">
                                                                            <label for="desc">Cheque Number
                                                                                <span class="text-danger">*</span>
                                                                            </label>
                                                                            <input type="text" class="form-control"
                                                                                name="cheque_no" required id="cheque_no">
                                                                            <input type="hidden" name="loans_id"
                                                                                value="{{ $loan['id'] }}">
                                                                        </div>

                                                                        <div
                                                                            class="form-group font-14 col-md-10 m-auto col-sm-12">
                                                                            <label for="desc" class="mt-3">Upload
                                                                                Check Photo
                                                                                (<span
                                                                                    class="text-danger">Optional</span>)
                                                                            </label>
                                                                            <input type="file" name="cheque_image"
                                                                                id="cheque_image" class="form-control"
                                                                                accept="image/*">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-outline-secondary btn-sm"
                                                                        data-dismiss="modal">
                                                                        <i class="mdi mdi-close-circle"></i> Close
                                                                    </button>
                                                                    <button type="submit" btn-id="" btn-action="save"
                                                                        id="disburse-btn"
                                                                        class="btn btn-outline-success custom-designed-btn btn-sm">
                                                                        <i class="fa fa-check-circle"></i> Disburse Loan
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                                {{-- -------------------------------- --}}
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
                                                            {{-- <a class="mt-1 dropdown-item custom-color" data-toggle="modal"
                                                                data-target="#finance-more-{{ $loan['id'] }}" href="#">
                                                                <i class="fa fa-eye" aria-hidden="true"></i> More ...
                                                            </a> --}}
                                                            <a class="mt-1 dropdown-item custom-color"
                                                                href="{{ route('loansDetails', $loan['id']) }}">
                                                                <i class="fa fa-eye" aria-hidden="true"></i> More
                                                            </a> Details
                                                            </a>
                                                            <a class="mt-1 dropdown-item text-success disburse-loan"
                                                                data-toggle="modal"
                                                                data-target="#disburse-loan-{{ $loan['id'] }}"
                                                                data-id="{{ $loan['id'] }}" href="#">
                                                                <i class="fa fa-check"></i> Disburse
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    @if ($loan['status'] === 'approved')
                                                        <h5>
                                                            <strong class="badge badge-pill badge-success">Approved</strong>
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
                                                    <span class="font-14">{{ $loan['monthstaken'] }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                        {{ number_format($loan['processingfees']) }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span
                                                        class="font-14">{{ number_format($loan['disbursed']) }}</span>
                                                </td>
                                                <td>
                                                    <span
                                                        class="font-14">{{ number_format($loan['return']) }}</span>
                                                </td>
                                                <td><span class="font-14">{{ $loan['user']['name'] }}</span></td>
                                                <td><span class="font-14">{{ $loan['user']['fwpnumber'] }}</span>
                                                </td>
                                                <td><span class="font-14">{{ $loan['last_payment'] }}</span></td>
                                                <td><span class="font-14">{{ $loan['created_at'] }}</span></td>
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
