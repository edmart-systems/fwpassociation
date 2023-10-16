@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Departed Members</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Departed Members</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 mb-2">
                </div>
                <!-- column -->
                <div class="col-12">
                    <div class="card">
                        <div class="card-body table-holder px-2">
                            <div class="table-responsive">
                                <table id="example" class="table hover table-bordered" width="100%" data-page-length="10">
                                    <thead>
                                        <tr>
                                            <th>SrNo</th>
                                            <th>Name</th>
                                            <th>FWP Number</th>
                                            <th>Reason</th>
                                            <th>Pay Out Amount</th>
                                            <th>Amount Paid</th>
                                            <th>Date Paid</th>
                                            <th>Cheque Number</th>
                                            <th>Savings</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>SrNo</th>
                                            <th>Name</th>
                                            <th>FWP Number</th>
                                            <th>Reason</th>
                                            <th>Pay Out Amount</th>
                                            <th>Amount Paid</th>
                                            <th>Date Paid</th>
                                            <th>Cheque Number</th>
                                            <th>Savings</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ($requests as $depar)
                                        @php
                                        $cheque = $depar['cheque'];
                                        @endphp
                                                <td>
                                                    <span class="font-14">
                                                       {{ $loop->iteration }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                        {{ $depar['name'] }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                        {{ $depar['fwpnumber'] }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">
                                                        {{ $depar['reason'] }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ number_format($depar['payout']) }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ number_format($depar['paid']) }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ $depar['date_paid'] }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ $depar['cheque_no'] }}</span>
                                                </td>
                                                <td><a href="{{ route('savings_profile',$depar['uid']) }}"  title="View Savings" class="btn btn-outline-success btn-sm"><i class="fa fa-money"></i>View Savings</a>
                                                </td>
                                                <td>
                                                    <div class="dropdown">
                                                        <button
                                                            class="btn custom-designed-btn btn-sm btn-outline-secondary dropdown-toggle"
                                                            type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            Action
                                                        </button>
                                                        <div class="dropdown-menu px-1 hadow-lg bg-white"
                                                            aria-labelledby="dropdownMenuButton">
                                                            <a target="_blank" class="mt-1 dropdown-item text-primary"
                                                                href="{{ url('/'.$cheque) }}">
                                                                <i class="fa fa-eye"></i> View Cheque
                                                            </a>
                                                            <a class="mt-1 dropdown-item text-danger" href="#"
                                                                data-toggle="modal"
                                                                data-target="#editpayout{{ $depar['id'] }}" title="Edit Pay Out">
                                                                <i class="fa fa-edit" aria-hidden="true"></i> Edit
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- Pay out model -->
                                            <div class="modal fade" id="editpayout{{ $depar['id'] }}" tabindex="-1"
                                                role="dialog" aria-labelledby="exampleModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h6 class="modal-title" id="exampleModalLabel">EDIT PAYOUT PAY OUT FOR MEMBER
                                                                {{ strtoupper($depar['name']) }}</h6>
                                                        </div>
                                                        <form method="POST" action="{{ route('editpayout') }}">
                                                            @csrf
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <input type="hidden" name="reqt"
                                                                        value="{{ $depar['id'] }}">
                                                                    <label>Paid Amount<span
                                                                            class="text-danger">*</span></label>
                                                                    <input type="text" class="form-control" required
                                                                        name="amount" value="{{ number_format($depar['paid']) }}" 
                                                                        onkeyup="this.value=addCommas(this.value);">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Payment Date<span
                                                                            class="text-danger">*</span></label>
                                                                    <input class="form-control" max="<?php echo date('Y-m-d'); ?>"
                                                                        type="date" value="{{ $depar['date_paid'] }}" name="date"
                                                                        required />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Cheque Number<span
                                                                            class="text-danger">*</span></label>
                                                                    <input class="form-control" type="number"
                                                                        name="cheque" required value="{{ $depar['cheque_no'] }}" />
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary btn-sm"
                                                                    data-dismiss="modal"><i class="fa fa-times"></i>
                                                                    Close</button>
                                                                <button type="submit" class="btn btn-danger btn-sm"><i
                                                                        class="fa fa-arrow-right"></i> Save Changes</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Modal ends -->
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
