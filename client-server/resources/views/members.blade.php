@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="alert alert-danger d-none alert-dismissible fade show" role="alert">
            <span>An error occuired, try again later</span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="page-breadcrumb col-md-11 mr-1">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h4 class="page-title">Association Members</h4>
                    <div class=" d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Association Members</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mt-4">
            <div class="container">
                <div class="row">
                    @if ($users->count() > 0)
                        @foreach ($users as $user)
                            <div class="col-lg-4 col-xlg-3 col-md-5">
                                <div class="card">
                                    <div class="card-body">
                                        <center class="m-t-30">
                                            <img src={{ asset('profiles/' . $user->image) }} class="rounded-circle"
                                                width="150" />
                                            <h4 class="card-title m-t-10">{{ $user->name }}</h4>
                                            <h6 class="card-subtitle">
                                                @if ($user->userType == 'chairman')
                                                    {{ 'The Chairperson' }}
                                                @elseif ($user->userType == 'treasurer')
                                                    {{ 'Secretary for Finance and Projects' }}
                                                @else
                                                    {{ $user->userType }}
                                                @endif
                                            </h6>
                                            <span>Status:
                                                <span
                                                    class="{{ $user->status === 'Activated' ? 'label label-success label-rounded' : 'label label-danger label-rounded' }}">{{ $user->status }}</span>
                                            </span>
                                        </center>
                                    </div>
                                    <div>
                                        <hr>
                                    </div>
                                    <div class="card-body">
                                        <small class="text-muted">Email address: </small>
                                        <h6>{{ $user->email }}</h6>
                                        <small class="text-muted p-t-30 db">Name:</small>
                                        <h6>{{ $user->name }}</h6>
                                        <small class="text-muted p-t-30 db">Phone 1:</small>
                                        <h6>{{ $user->phone1 }}</h6>
                                        <small class="text-muted p-t-30 db">Phone 2:</small>
                                        <h6>{{ $user->phone2 }}</h6>
                                        <small class="text-muted p-t-30 db">Actions to User:</small>
                                        <br class="mt-1 mb-2" />
                                        <div>
                                            @if (Auth()->user()->userType === 'chairman')
                                                @if ($user->status === 'Deactivated')
                                                    <button class="btn btn-sm btn-outline-success action"
                                                        data-id={{ $user->id }} btn-action="activate"><i
                                                            class="mdi mdi-check"></i>Activate</button>
                                                @elseif ($user->status === 'New')
                                                    <button class="btn btn-sm btn-outline-success action"
                                                        data-id={{ $user->id }} btn-action="newactivate"><i
                                                            class="mdi mdi-close-circle"></i>Activate</button>
                                                @elseif ($user->status === 'Deactivated')
                                                    <button class="btn btn-sm btn-outline-danger action"
                                                        data-id={{ $user->id }} btn-action="deactivate"><i
                                                            class="mdi mdi-close-circle"></i>Deactivate</button>
                                                @endif
                                            @endif
                                            @if (Auth()->user()->userType == 'chairman' || Auth()->user()->userType == 'treasurer' || Auth()->user()->userType == 'Vice Chairperson' || Auth()->user()->userType == 'General Secretary' || Auth()->user()->userType == 'Information and Publicity')
                                                <a href="{{ route('biodata1', $user->id) }}"><button
                                                        class="btn btn-sm btn-outline-warning action"><i
                                                            class="fas fa-eye"></i> View Bio</button></a>
                                            @elseif (Auth::user()->id == $user->id)
                                                <a href="{{ route('biodata1', $user->id) }}"><button
                                                        class="btn btn-sm btn-outline-warning action"><i
                                                            class="fas fa-eye"></i> View Bio</button></a>
                                            @endif
                                            @if (Auth()->user()->userType === 'chairman')
                                                <button class="btn btn-sm btn-outline-info action float-right"
                                                    data-id={{ $user->id }} btn-action="reset"><i
                                                        class="fas fa-cog"></i> reset</button>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
