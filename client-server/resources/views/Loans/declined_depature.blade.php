@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Declined Departure Requests</h4>
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
                                            <th>SrNo</th>
                                            <th>Name</th>
                                            <th>FWP Number</th>
                                            <th>Reason</th>
                                            <th>Declined By</th>
                                            <th>Requested</th>
                                            <th>Declined</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>SrNo</th>
                                            <th>Name</th>
                                            <th>FWP Number</th>
                                            <th>Reason</th>
                                            <th>Declined By</th>
                                            <th>Requested</th>
                                            <th>Declined</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        @foreach ($requests as $depar)
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
                                                    <span class="font-14">{{ ucfirst($depar['declinedby']) }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ $depar['made'] }}</span>
                                                </td>
                                                <td>
                                                    <span class="font-14">{{ $depar['declined'] }}</span>
                                                </td>
                                                <td><a href="{{ route('delete_declined',$depar['id']) }}" class="btn btn-sm btn-outline-warning custom-designed-btn" title="Delete declined request"><i class="fa fa-trash"></i></a></td>
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
