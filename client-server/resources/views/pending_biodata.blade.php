@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Bio Data Forms Pending Approval</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                {{-- <li class="breadcrumb-item"><a href="{{route('AllSavings')}}">All Savings</a></li> --}}
                                <li class="breadcrumb-item active" aria-current="page">Bio Data Pending Approval</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                </div>
            </div>
        </div>

        <!-- END FOR TODAY -->

        <div class="col-md-12 col-lg-12 col-sm-12">
            <div class="card">
                <div class="card-body table-holder px-2">
                    <table width="100%" id="example" class="display">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>FWP Number</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Occupation</th>
                                <th>Date Filled</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($users as $user)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $user->user->name }}</td>
                                    <td>{{ $user->user->fwpnumber }}</td>
                                    <td>{{ $user->user->phone1 }}</td>
                                    <td>{{ $user->user->email }}</td>
                                    <td>{{ $user->address }}</td>
                                    <td>{{ $user->occupation }}</td>
                                    <td>{{ $user->created_at }}</td>
                                    <td>
                                        <a href="{{ route('biodata1', $user->user->id) }}"
                                            class="btn btn-sm btn-outline-warning custom-designed-btn"><i
                                                class="fa fa-eye"></i> Details</a>
                                        <a href="#" data-toggle="modal" data-target="#exampleModal{{ $user->id }}"
                                            class="btn btn-sm btn-outline-warning custom-designed-btn"><i
                                                class="fa fa-check"></i> Approve</a>
                                    </td>
                                </tr>
                                <!-- approve -->
                                <div class="modal" id="exampleModal{{ $user->id }}" tabindex="-1"
                                    role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header bg-warning">
                                                <h5 class="modal-title text-white font-14">APPROVE DETAILS FOR
                                                    {{ strtoupper($user->user->name) }}</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form method="POST" action="{{ route('approveBio') }}">
                                                @csrf
                                                <div class="modal-body">
                                                    <div class="form-group text-center">
                                                        <h2 class="text-warning"><i class="fa fa-exclamation"
                                                                aria-hidden="true"></i></h2>
                                                        <h4>Are You sure you want to Approve this
                                                            Information?</h4>
                                                    </div>
                                                    <input type="hidden" name="id" value="{{ $user->id }}">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button"
                                                        class="btn btn-outline-secondary btn-sm modal-close"
                                                        data-dismiss="modal"><i class="mdi mdi-close-circle"></i>
                                                        Close</button>
                                                    <button type="submit"
                                                        class="btn btn-sm btn-outline-warning custom-designed-btn"><i
                                                            class="fa fa-check" aria-hidden="true"></i> Approve</button>
                                                </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                                <!-- approve ends -->
                            @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
@endsection
