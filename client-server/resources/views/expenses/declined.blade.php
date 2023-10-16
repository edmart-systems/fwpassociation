@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">All Declined Expense Requests</h4>
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
                                    <th>No</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Requested By</th>
                                    <th>Status</th>
                                    <th>Reason</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>No</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Requested By</th>
                                    <th>Status</th>
                                    <th>Reason</th>
                                    <th>Date</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                @foreach ($expenses as $expense)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ number_format($expense['budget']) }}</td>
                                        <td>{{ $expense['desc'] }}</td>
                                        <td>{{ $expense->user->name }}</td>
                                        <td>{{ $expense['status'] }}</td>
                                        <td>{{ $expense['reason'] }}</td>
                                        <td style="white-space: nowrap;">{{ $expense['created_at'] }}</td>
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
