@extends('layouts.app')
@section('content')

    {{-- departing modal for non admin users --}}
    @if (Auth()->user()->userType == 'chairman' || Auth()->user()->userType == 'treasurer')
    @else
        <div class="modal fade" id="user-depart" data-backdrop="static" tabindex="-1" role="dialog"
            aria-labelledby="loansTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-15" id="loansTitle">Depart From Association</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="{{ route('departRequest') }}">
                        @csrf
                        <div class="modal-body">
                            <input type="hidden" name="user_id" value="{{ Auth()->user()->id }}">
                            <div class="row d-flex">
                                <div class="font-14 col-md-10 col-sm-12 mx-auto">
                                    <div class="alert alert-danger mb-4" role="alert">
                                        <div class="media">
                                            <div class="media-body">
                                                <h5 class="mt-0">Warning!</h5>
                                                The departure request matures in not more than THREE(3) MONTHS.
                                                <br>
                                                Therefore, funds can be released before the three months.
                                                <br>
                                                The three months are used for administrative assessment.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="font-14 col-md-10 col-sm-12 mx-auto row">
                                    <div class="font-14 col-md-12 col-sm-12">
                                        <strong class="custom-color mt-4">More Details</strong>
                                        <hr>
                                    </div>
                                    <div class="font-14 col-md-6 col-sm-12 d-flex">
                                        <dl class="list-group list-group-flush mx-auto">
                                            <dt>Total Deposits</dt>
                                            <dd>{{ number_format($totaldep) }}</dd>
                                            <dt>Expected Savings</dt>
                                            <dd>{{ number_format($expected) }}</dd>
                                            <dt>Total Fines</dt>
                                            <dd>{{ number_format($totalfin) }}</dd>
                                            <dt>Social Contributions</dt>
                                            <dd>{{ number_format($totalsoc) }}</dd>
                                        </dl>
                                    </div>
                                    <div class="font-14 col-md-6 col-sm-12 d-flex">
                                        <dl class="list-group list-group-flush mx-auto">
                                            <dt>Due Amount</dt>
                                            <dd>{{ number_format($due_amount) }}</dd>
                                            <dt>Your Arrears</dt>
                                            <dd>{{ $arrears }}</dd>
                                            <dt>Total(Unpaid and Runinning) Loans </dt>
                                            <dd>
                                                {{ $totalLoans }}
                                                @if ($totalLoans > 0)
                                                    <strong class="text-danger font-12">
                                                        (Clear This Before Departure.)
                                                    </strong>
                                                @endif
                                            </dd>
                                            <dt>Disbursable Amount</dt>
                                            <dd class="text-decoration">
                                                <strong class="custom-color"> {{ number_format($due_amount * 0.9) }} </strong>
                                                <span class="custom-color font-12">
                                                    (90% of Amount Due.)
                                                </span>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>

                                <!-- ================== -->
                                @if ($totalLoans < 1)
                                <div class="font-14 col-md-10 col-sm-12 mx-auto row mt-4">
                                    <div class="font-14 col-md-12 col-sm-12">
                                        <strong class="custom-color mt-4">Reason For Departure</strong>
                                        <hr>
                                            <input type="hidden" name="payout" value="{{ $due_amount * 0.9 }}">
                                            <div class="form-group">
                                                <label>Reason</label>
                                                <textarea name="reason" class="form-control" placeholder="Enter Reason Here" required></textarea>
                                            </div>
                                    </div>
                                </div>
                                @endif
                                <!-- ========== -->
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">
                                <i class="mdi mdi-close-circle"></i> Cancelled
                            </button>
                            @if ($totalLoans > 0)
                                <button type="submit" disabled btn-id="" btn-action="save" id="user-depart"
                                    class="btn btn-outline-danger btn-sm">
                                    <i class="fa fa-ban" aria-hidden="true"></i> Continue Depart
                                </button>
                            @else
                                <button type="submit" name="depart" 
                                    class="btn btn-outline-danger btn-sm">
                                    <i class="fa fa-ban" aria-hidden="true"></i> Continue Depart
                                </button>
                            @endif
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endif

    {{-- profile --}}
    <div class="page-wrapper row">
        <div class="page-breadcrumb col-md-11 mr-1">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h4 class="page-title">User Profile</h4>
                    <div class=" d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-xlg-3 col-md-5 mt-2">
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30">
                                    <img src={{ asset('profiles/' . Auth()->user()->image) }} class="rounded-circle"
                                        width="150" />
                                    <h4 class="card-title m-t-10">{{ Auth()->user()->name }}</h4>
                                    <h6 class="card-subtitle">
                                        @if (Auth()->user()->userType == 'chairman')
                                            {{ 'The Chairperson' }}
                                        @elseif (Auth()->user()->userType=="treasurer")
                                            {{ 'Secretary for Finance and Projects' }}
                                        @else
                                            {{ Auth()->user()->userType }}
                                        @endif
                                    </h6>
                                </center>
                            </div>
                            <div>
                                <hr>
                            </div>
                            <div class="card-body">
                                <small class="text-muted">Email address </small>
                                <h6>{{ Auth()->user()->email }}</h6>
                                <small class="text-muted p-t-30 db">Name</small>
                                <h6>{{ Auth()->user()->name }}</h6>
                            </div>
                            @if (Auth()->user()->userType == 'chairman' || Auth()->user()->userType == 'treasurer')
                            @else
                                <div class="card-footer">
                                    <a class="btn btn-sm btn-outline-danger float-right" href="#" data-toggle="modal"
                                        data-target="#user-depart" role="button">
                                        <i class="fa fa-ban" aria-hidden="true"></i> Request Departure
                                    </a>
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="col-lg-7 col-xlg-8 col-md-6 mr-auto ml-auto mt-2">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-horizontal form-material" enctype="multipart/form-data"
                                    style="margin: 2px 4rem 2px 4rem;" action="{{ route('editUser') }}" method="POST">
                                    @csrf
                                    <input type="hidden" value="{{ Auth()->user()->id }}" name="uid">
                                    <div class="form-group">
                                        <label class="col-md-12">Full Name</label>
                                        <div class="col-md-12">
                                            <input id="name" type="text" placeholder="username"
                                                value="{{ Auth()->user()->name }}"
                                                class="form-control form-control-sm @error('name') is-invalid @enderror" name="name"
                                                required>
                                            @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <input id="email" type="email" placeholder="example@admin.com"
                                                value="{{ Auth()->user()->email }}"
                                                class="form-control form-control-sm @error('email') is-invalid @enderror"
                                                name="email">
                                            @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Phone Number 1</label>
                                        <div class="col-md-12">
                                            <input id="phone1" type="number" minlength="9" 
                                                value="{{ Auth()->user()->phone1 }}"
                                                class="form-control form-control-sm"
                                                name="phone1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Phone Number 2</label>
                                        <div class="col-md-12">
                                            <input id="phone2" type="number" minlength="9" 
                                                value="{{ Auth()->user()->phone2 }}"
                                                class="form-control"
                                                name="phone2">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Password</label>
                                        <div class="col-md-12">
                                            <input id="password" type="password"
                                                class="form-control form-control-sm @error('password') is-invalid @enderror"
                                                name="password" required>
                                            @error('password')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Confirm Password</label>
                                        <div class="col-md-12">
                                            <input id="password-confirm" name="password_confirmation" type="password"
                                                class="form-control form-control-sm" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">FWP Number</label>
                                        <div class="col-md-12">
                                            @if (Auth()->user()->userType == 'chairman' || Auth()->user()->userType == 'treasurer')
                                                <input id="fwpnumber" readonly type="text" placeholder="fwpnumber"
                                                    value="{{ Auth()->user()->fwpnumber }}"
                                                    class="form-control form-control-sm @error('fwpnumber') is-invalid @enderror"
                                                    name="fwpnumber" required>
                                            @else
                                                <input id="fwpnumber" type="text" placeholder="fwpnumber"
                                                    value="{{ Auth()->user()->fwpnumber }}"
                                                    readonly class="form-control form-control-sm @error('fwpnumber') is-invalid @enderror"
                                                    name="fwpnumber" required>
                                            @endif
                                            @error('fwpnumber')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Profile Image</label>
                                        <div class="col-md-12">
                                            <input id="image" name="image" type="file" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button type="submit" id="profile-btn"
                                                class="btn btn-outline-success float-right custom-designed-btn btn-sm">
                                                <i class="fa fa-save"></i>
                                                Update Profile
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
