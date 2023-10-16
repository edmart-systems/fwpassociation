@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">All Recommended Expenses</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Expenses</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    <div class="text-right upgrade-btn">

                    </div>
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
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Requested By</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Action</th>
                                    <th>No</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Requested By</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                @foreach ($expenses as $expense)
                                    <tr>
                                        <td>
                                            @if ((Auth()->user()->userType === 'chairman'))
                                                <div class="dropdown">
                                                    <button
                                                        class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle"
                                                        type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                                        aria-haspopup="true" aria-expanded="false">
                                                        Action
                                                    </button>
                                                    <div class="dropdown-menu px-1 hadow-lg bg-white"
                                                        aria-labelledby="dropdownMenuButton">
                                                        <a class="mt-1 dropdown-item text-primary" href="#"
                                                            data-toggle="modal" data-target="#delete{{ $expense['id'] }}" style="display: block;width: 80px;">
                                                            Approve
                                                        </a>
                                                        <a class="mt-1 dropdown-item text-danger" href="#"
                                                            data-toggle="modal" data-target="#exampleModal{{ $expense['id'] }}" style="display: block;width: 80px;">
                                                            Decline
                                                        </a>
                                                    </div>
                                                </div>
                                            @endif
                                        </td>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ number_format($expense['budget']) }}</td>
                                        <td>{{ $expense['desc'] }}</td>
                                        <td>{{ $expense->user->name }}</td>
                                        <td>{{ $expense['status'] }}</td>
                                        <td style="white-space: nowrap;">{{ $expense['created_at'] }}</td>
                                    </tr>
                                    <div class="modal fade" id="exampleModal{{ $expense['id'] }}" tabindex="-1"
                                        role="dialog" aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h6 class="modal-title" id="exampleModalLabel">Decline Expense for
                                                        {{ $expense['budget'] }} for {{ $expense['date'] }}</h6>
                                                </div>
                                                <form method="POST" action="{{ route('expenseAction') }}">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input type="hidden" name="id"
                                                                value="{{ $expense['id'] }}">
                                                                <input type="hidden" name="action"
                                                                value="declined">
                                                            <label class="control-label">Message:</label>
                                                            <textarea class="form-control" name="reason"
                                                                placeholder="Enter Reason" required></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary btn-sm"
                                                            data-dismiss="modal"><i class="fa fa-times"></i>
                                                            Close</button>
                                                        <button type="submit" class="btn btn-danger btn-sm"><i
                                                                class="fa fa-arrow-right"></i> Decline</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Deleting Saving -->
                                    <div class="modal" id="delete{{ $expense['id'] }}" tabindex="-1"
                                        role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title font-14">APPROVE EXPENSE FOR
                                                        {{ strtoupper($expense->user->name) }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form method="POST" action="{{ route('expenseAction') }}">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="form-group text-center">
                                                            <h4 class="text-warning"><i class="fa fa-exclamation"
                                                                    aria-hidden="true"></i></h4>
                                                            <h4 class="text-warning">Are You sure you want to Approve this
                                                                Expense !</h2>
                                                                <strong>This is a permanet action.</strong>
                                                        </div>
                                                        <input type="hidden" name="id"
                                                            value="{{ $expense['id'] }}">
                                                            <input type="hidden" name="action" value="approved"/>
                                                            <input type="hidden" name="reason" value=""/>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                            class="btn btn-outline-secondary btn-sm modal-close"
                                                            data-dismiss="modal"><i class="mdi mdi-close-circle"></i>
                                                            Close</button>
                                                        <button type="submit" class="btn btn-outline-primary btn-sm"><i
                                                                class="fa fa-check" aria-hidden="true"></i> Approve</button>
                                                    </div>
                                                </form>


                                            </div>
                                        </div>
                                    </div>
                                    <!-- Delete ends -->

                                    <!-- Edit a saving -->
                                    <div class="modal fade" id="edit{{ $expense['id'] }}" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content ">
                                                <div class="modal-header">
                                                    <h6 class="modal-title" id="exampleModalLabel">Edit Expense for
                                                        {{ $expense->user->name }} for {{ $expense['date'] }}</h6>
                                                </div>
                                                <form method="POST" action="{{ route('editSaving') }}">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-md-12 col-lg-12 col-sm-12">
                                                                <input type="hidden" name="eId"
                                                                    value="{{ $expense['id'] }}">
                                                                <div class="form-group">
                                                                    <label>Budget<span
                                                                            class="text-danger">*</span></label>
                                                                    <input type="text" class="form-control" required
                                                                        name="budget"
                                                                        onkeyup="this.value=addCommas(this.value);"
                                                                        value="{{ number_format($expense['budget']) }}">
                                                                </div>
                                                                <div class="ml-auto">
                                                                    <label>Date</label>
                                                                    <input class="form-control monthpayment"
                                                                        max="<?php echo date('Y-m-d'); ?>" type="date"
                                                                        value="{{ $expense['date'] }}" name="date" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Description</label>
                                                                    <textarea name="desc" class="form-control" cols="30" rows="5" value="{{ $expense['desc'] }}"></textarea>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-outline-danger btn-sm"
                                                            data-dismiss="modal"><i class="fa fa-times"></i>
                                                            Close</button>
                                                        <button type="submit"
                                                            class="btn btn-outline-primary btn-sm custom-designed-btn"><i
                                                                class="fa fa-arrow-right"></i> Confirm</button>
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
