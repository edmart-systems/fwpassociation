@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345') }}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Requests For Editing Bio Data For Members</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                {{-- <li class="breadcrumb-item"><a href="{{route('AllSavings')}}">All Savings</a></li> --}}
                                <li class="breadcrumb-item active" aria-current="page">Editing Bio Data Requests</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    {{-- <div class="text-right upgrade-btn">
                    @if (Auth()->user()->userType === 'treasurer')
                        <a  class="btn btn-primary btn-sm float-right mb-2 add-saving" data-toggle="modal" data-target="#savings" style="color: white; background-color: orange; border: none;">
                            <span class="togglsave"><i class="fa fa-plus"></i> Add Savings</span>
                        </a>
                    @endif
                    </div> --}}
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-12 col-sm-12">
            <div class="card">
                <div class="card-body table-holder px-2">
                    <table width="100%" id="example" class="display">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>FWP Number</th>
                                <th>Description</th>
                                <th>Date Submitted</th>
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
                                    <td>{{ $user->created_at->diffForHumans() }}</td>
                                    <td>
                                        <a href="/biodata/{{ $user->user_id }}"
                                            class="btn btn-sm btn-outline-warning custom-designed-btn">
                                            <i class="fa fa-edit"></i> Edit Bio Data
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
