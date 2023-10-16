@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Departure Requests</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('welcome') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Departure Requests</li>
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
                                            @if (Auth()->user()->userType === 'chairman')
                                            <th>Actions</th>
                                            @endif
                                            <th>Name</th>
                                            <th>FWP Number</th>
                                            <th>Reason</th>
                                            <th>Due Amount</th>
                                            <th>Pay Out Amount</th>
                                            <th>Status</th>
                                            <th>Requested</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            @if (Auth()->user()->userType === 'chairman')
                                            <th>Actions</th>
                                            @endif
                                            <th>Name</th>
                                            <th>FWP Number</th>
                                            <th>Reason</th>
                                            <th>Due Amount</th>
                                            <th>Pay Out Amount</th>
                                            <th>Status</th>
                                            <th>Requested</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ($requests as $depar)
                                        @if (Auth()->user()->userType === 'chairman' && $depar['status']=="1")
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
                                                            <a class="mt-1 dropdown-item text-primary" href="{{ route('approve_depart',['id'=>$depar['id']]) }}">
                                                                <i class="fa fa-check"></i> Approve
                                                            </a>
                                                            <a class="mt-1 dropdown-item text-danger" href="#"
                                                                data-toggle="modal" data-target="#decline{{ $depar['id'] }}">
                                                                <i class="fa fa-times" aria-hidden="true"></i> Decline
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                                @else
                                                <td></td>
                                            @endif
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
                                                    <span class="font-14">{{ number_format($depar['dueAmount']) }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ number_format($depar['payout']) }}</span>
                                                </td>
                                                <td class="text-left">
                                                    @switch($depar['status'])
                                                        @case("0")
                                                            <h5><strong
                                                                    class="badge badge-pill badge-primary">Pending</strong>
                                                            </h5>
                                                        @break
                                                        @case("1")
                                                            <h5><strong
                                                                    class="badge badge-pill badge-secondary">Recommended</strong>
                                                            </h5>
                                                        @break
                                                        @case("2")
                                                            <h5><strong
                                                                    class="badge badge-pill badge-success">Approved</strong>
                                                            </h5>
                                                        @break
                                                        @case("3")
                                                            <h5><strong
                                                                    class="badge badge-pill badge-danger">Departed</strong>
                                                            </h5>
                                                        @break
                                                        @case("4")
                                                            <h5><strong
                                                                    class="badge badge-pill badge-warning">Declined</strong>
                                                            </h5>
                                                        @break
                                                        @case("5")
                                                            <h5><strong
                                                                    class="badge badge-pill badge-info">Withdrawn</strong>
                                                            </h5>
                                                        @break
                                                        @default
                                                    @endswitch
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ $depar['date'] }}</span>
                                                </td>
                                            </tr>
<!-- Decline Departure request model -->
<div class="modal fade" id="decline{{ $depar['id'] }}" tabindex="-1"
        role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">DECLINE DEPARTURE REQUEST FOR
                        {{ strtoupper($depar['name']) }}</h6>
                </div>
                <form method="POST" action="{{ route('declinedepart') }}">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="hidden" name="reqt"
                                value="{{ $depar['id'] }}">
                            <label class="control-label">Message:</label>
                            <textarea class="form-control" name="message"
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
