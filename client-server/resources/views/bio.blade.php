{{-- @extends('layouts.app')
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
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30">
                                    <img src={{ asset('profiles/' . $bio->image) }} class="rounded-circle" width="150" />
                                    <h4 class="card-title m-t-10">{{ $bio->name }}</h4>
                                    <h6 class="card-subtitle">
                                        @if ($bio->userType == 'chairman')
                                            {{ 'The Chairperson' }}
                                        @elseif ($bio->userType == 'treasurer')
                                            {{ 'Secretary for Finance and Projects' }}
                                        @else
                                            {{ $bio->userType }}
                                        @endif
                                    </h6>
                                    <span>Status:
                                        <span
                                            class="{{ $bio->status === 'Activated' ? 'label label-success label-rounded' : 'label label-danger label-rounded' }}">{{ $bio->status }}</span>
                                    </span>
                                </center>
                            </div>
                            <div>
                                <hr>
                            </div>
                            <div class="card-body">
                                <small class="text-muted">Email address: </small>
                                <h6>{{ $bio->email }}</h6>
                                <small class="text-muted p-t-30 db">Phone 1:</small>
                                <h6>{{ $bio->phone1 }}</h6>
                                <small class="text-muted p-t-30 db">Phone 2:</small>
                                <h6>{{ $bio->phone2 }}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-body">
                                @if ($bio->bio)
                                    <div class="row">
                                        <div class="col-md-6">
                                            <dl>
                                                <dt>Current Address</dt>
                                                <dd>{{ $bio->bio->address }}</dd>
                                                <dt>Occupation</dt>
                                                <dd>{{ $bio->bio->occupation }}</dd>
                                                <dt>Nationality</dt>
                                                <dd>{{ $bio->bio->nationality }}</dd>
                                                <dt>Date Of Birth</dt>
                                                <dd>{{ $bio->bio->dob }}</dd>
                                                <dt>NIN Number</dt>
                                                <dd>{{ $bio->bio->nin }}</dd>
                                                <dt>Father</dt>
                                                <dd>{{ $bio->bio->father }}</dd>
                                                <dt>Mother</dt>
                                                <dd>{{ $bio->bio->mother }}</dd>
                                                <dt>Marital Status</dt>
                                                <dd>{{ $bio->bio->marital }}</dd>

                                            </dl>
                                        </div>
                                        <div class="col-md-6">
                                            <dl>
                                                <dt>Spouse Name</dt>
                                                <dd>{{ $bio->bio->spouse }}</dd>
                                                <dt>Passport Number</dt>
                                                <dd>{{ $bio->bio->passport }}</dd>
                                                <dt>Children</dt>
                                                <dd>{{ $bio->bio->children }}</dd>
                                                <dt>Next Of Kin</dt>
                                                <dd>{{ $bio->bio->nextofkin }}</dd>
                                                <dt>Next Of Kin Address</dt>
                                                <dd>{{ $bio->bio->nextofkinaddress }}</dd>
                                                <dt>Next Of Kin Contact</dt>
                                                <dd>{{ $bio->bio->nxtcont }}</dd>
                                                <dt>Next Of Kin Email Address</dt>
                                                <dd>{{ $bio->bio->nxtemail }}</dd>
                                                <dt>Next Of Kin NIN Number</dt>
                                                <dd>{{ $bio->bio->nxtnin }}</dd>
                                                <dt>Relationship with Next Of Kin</dt>
                                                <dd>{{ $bio->bio->relationship }}</dd>
                                            </dl>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection --}}


@extends('layouts.app')
@section('content')
    {{-- profile --}}
    <div class="page-wrapper row">
        <div class="page-breadcrumb col-md-11 mr-1">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h4 class="page-title">Bio Data for {{ Auth()->user()->name }}</h4>
                    <div class=" d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Member Bio Data</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mt-4">
            <div class="container">
                <div class="row">
                    @if (Auth::user()->userType != 'Member' || Auth::user()->id == $bio->id)
                        @if ($bio->bio == '' && Auth::user()->id == $bio->id)
                            <div class="col-lg-12 col-xlg-12 col-md-12 mr-auto ml-auto mt-2">
                                <div class="card">
                                    <div class="card-body">
                                        <form class="form-horizontal form-material" style="margin: 2px 4rem 2px 4rem;"
                                            action="{{ route('editBio') }}" method="POST">
                                            @csrf
                                            <input type="hidden" value="{{ Auth()->user()->id }}" name="uid">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-12">Current Address</label>
                                                        <div class="col-md-12">
                                                            <input type="text" placeholder="Address" value=""
                                                                class="form-control form-control-sm" name="address"
                                                                required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Occupation</label>
                                                        <div class="col-md-12">
                                                            <input type="text" placeholder="Your Occupation" value=""
                                                                class="form-control form-control-sm" name="occupation"
                                                                required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Nationality</label>
                                                        <div class="col-md-12">
                                                            <input type="teaxt" placeholder="E.g. Ugandan" value=""
                                                                class="form-control form-control-sm" name="nationality"
                                                                required>
                                                        </div>
                                                    </div>
                                                    @php
                                                        $min = date('Y-m-d', strtotime(date('Y-m-d') . ' - 15 years'));
                                                    @endphp
                                                    <div class="form-group">
                                                        <label class="col-md-12">Date Of Birth</label>
                                                        <div class="col-md-12">
                                                            <input type="date" value="" class="form-control form-control-sm"
                                                                name="dob" max="@php
                                                                    echo $min;
                                                                @endphp" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">NIN</label>
                                                        <div class="col-md-12">
                                                            <input type="text" placeholder="Your NIN Number"
                                                                class="form-control form-control-sm" name="nin" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Passport Number</label>
                                                        <div class="col-md-12">
                                                            <input name="passport" type="text"
                                                                placeholder="Your Passport Number"
                                                                class="form-control form-control-sm">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Marital Status</label>
                                                        <div class="col-md-12">
                                                            <select name="marital" class="form-control form-control-sm"
                                                                required id="marital"
                                                                onchange="changeMaritalStatus(this.value)">
                                                                <option value="Married">Married</option>
                                                                <option value="Widowed">Widowed</option>
                                                                <option value="Divorced">Divorced</option>
                                                                <option value="Single">Single</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="spouse">
                                                        <label class="col-md-12">Spouse Name</label>
                                                        <div class="col-md-12">
                                                            <input name="spouse" type="text" placeholder="Your Spouse Name"
                                                                class="form-control form-control-sm" value="">
                                                        </div>
                                                    </div>
                                                    <script>
                                                        function changeMaritalStatus(status) {
                                                            if (status == 'Married') {
                                                                document.getElementById('spouse').style.display = 'block';
                                                            } else {
                                                                document.getElementById('spouse').style.display = 'none';
                                                            }
                                                        }
                                                    </script>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Father's Status</label>
                                                        <div class="col-md-12">
                                                            <select name="fstatus" class="form-control form-control-sm"
                                                                required onchange="changeFather1(this.value)">
                                                                <option value="1">Living</option>
                                                                <option value="0">Deceased</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        function changeFather1(status) {
                                                            if (status == '1') {
                                                                document.getElementById('father1').style.display = 'block';
                                                            } else {
                                                                document.getElementById('father1').style.display = 'none';
                                                            }
                                                        }
                                                    </script>
                                                    <div class="form-group" id="father1">
                                                        <label class="col-md-12">Father's Name</label>
                                                        <div class="col-md-12">
                                                            <input name="father" type="text"
                                                                placeholder="Enter N/A for Not Applicable"
                                                                class="form-control form-control-sm" value="" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="col-md-12">Mother's Status</label>
                                                        <div class="col-md-12">
                                                            <select name="mstatus" class="form-control form-control-sm"
                                                                required onchange="changeMother(this.value)">
                                                                <option value="1">Living</option>
                                                                <option value="0">Deceased</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        function changeMother(status) {
                                                            if (status == '1') {
                                                                document.getElementById('mother1').style.display = 'block';
                                                            } else {
                                                                document.getElementById('mother1').style.display = 'none';
                                                            }
                                                        }
                                                    </script>
                                                    <div class="form-group" id="mother1">
                                                        <label class="col-md-12">Mother's Name</label>
                                                        <div class="col-md-12">
                                                            <input name="mother" type="text"
                                                                placeholder="Enter N/A for Not Applicable"
                                                                class="form-control form-control-sm" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Children <small>(Seperate Names with
                                                                Commas)</small></label>
                                                        <div class="col-md-12">
                                                            <textarea name="children" class="form-control form-control-sm" placeholder="Enter Names Seperated with Commas">

                                                        </textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Next Of Kin Full Name</label>
                                                        <div class="col-md-12">
                                                            <input name="nxtofkin" type="text"
                                                                placeholder="Enter Next Of Kin"
                                                                class="form-control form-control-sm" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Next Of Kin Address</label>
                                                        <div class="col-md-12">
                                                            <input name="nxtaddress" type="text"
                                                                placeholder="Your Next Of Kin Address"
                                                                class="form-control form-control-sm" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Next Of Kin Contact</label>
                                                        <div class="col-md-12">
                                                            <input name="nextcont" type="text"
                                                                placeholder="Enter Next Of Kin Contact"
                                                                class="form-control form-control-sm" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Next Of Kin Email</label>
                                                        <div class="col-md-12">
                                                            <input name="nextemail" type="email"
                                                                placeholder="Enter Next Of Kin Email"
                                                                class="form-control form-control-sm" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Next Of Kin NIN Number</label>
                                                        <div class="col-md-12">
                                                            <input name="nxtnin" type="text"
                                                                placeholder="Enter Next Of Kin NIN Number"
                                                                class="form-control form-control-sm" value="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Relationship with Next Of Kin</label>
                                                        <div class="col-md-12">
                                                            <input name="relationship" type="text"
                                                                placeholder="Enter Your Relationship with Next Of Kin"
                                                                class="form-control form-control-sm" value="" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <input type="checkbox" required
                                                                style="width:20px; height: 20px"> I
                                                            {{ Auth::user()->name }} agree to the foregoing Constitution
                                                            and
                                                            adopt them for FWP and have resolved that I be duly registered
                                                            as a
                                                            member of the
                                                            Association.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button type="submit"
                                                        class="btn btn-outline-success float-right custom-designed-btn btn-sm">
                                                        <i class="fa fa-check"></i>
                                                        Submit Bio Data
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        @elseif ($bio->bio == '')
                            <div class="col-lg-12 col-xlg-12 col-md-12 mr-auto ml-auto mt-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="alert alert-warning" role="alert">
                                                    <strong>Bio Data For Member Not Available</strong>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @else
                            <div class="col-lg-12 col-xlg-12 col-md-12 mr-auto ml-auto mt-2">
                                <div class="row">
                                    <div class="col-lg-4 col-xlg-3 col-md-5">
                                        <div class="card">
                                            <div class="card-body">
                                                <center class="m-t-30">
                                                    <img src={{ asset('profiles/' . $bio->image) }}
                                                        class="rounded-circle" width="150" />
                                                    <h4 class="card-title m-t-10">{{ $bio->name }}</h4>
                                                    <h6 class="card-subtitle">
                                                        @if ($bio->userType == 'chairman')
                                                            {{ 'The Chairperson' }}
                                                        @elseif ($bio->userType == 'treasurer')
                                                            {{ 'Secretary for Finance and Projects' }}
                                                        @else
                                                            {{ $bio->userType }}
                                                        @endif
                                                    </h6>
                                                    <span>Status:
                                                        <span
                                                            class="{{ $bio->status === 'Activated' ? 'label label-success label-rounded' : 'label label-danger label-rounded' }}">{{ $bio->status }}</span>
                                                    </span>
                                                </center>
                                            </div>
                                            <div>
                                                <hr>
                                            </div>
                                            <div class="card-body">
                                                <small class="text-muted">Email address: </small>
                                                <h6>{{ $bio->email }}</h6>
                                                <small class="text-muted p-t-30 db">Phone 1:</small>
                                                <h6>{{ $bio->phone1 }}</h6>
                                                <small class="text-muted p-t-30 db">Phone 2:</small>
                                                <h6>{{ $bio->phone2 }}</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-xlg-9 col-md-7">
                                        <div class="card">
                                            <div class="card-body">
                                                @if ($bio->bio)
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <dl>
                                                                <dt>Current Address</dt>
                                                                <dd>{{ $bio->bio->address }}</dd>
                                                                <dt>Occupation</dt>
                                                                <dd>{{ $bio->bio->occupation }}</dd>
                                                                <dt>Nationality</dt>
                                                                <dd>{{ $bio->bio->nationality }}</dd>
                                                                <dt>Date Of Birth</dt>
                                                                <dd>{{ $bio->bio->dob }}</dd>
                                                                <dt>NIN Number</dt>
                                                                <dd>{{ $bio->bio->nin }}</dd>
                                                                <dt>Father</dt>
                                                                <dd>{{ $bio->bio->father }}</dd>
                                                                <dt>Mother</dt>
                                                                <dd>{{ $bio->bio->mother }}</dd>
                                                                <dt>Marital Status</dt>
                                                                <dd>{{ $bio->bio->marital }}</dd>

                                                            </dl>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <dl>
                                                                <dt>Spouse Name</dt>
                                                                <dd>{{ $bio->bio->spouse }}</dd>
                                                                <dt>Passport Number</dt>
                                                                <dd>{{ $bio->bio->passport }}</dd>
                                                                <dt>Children</dt>
                                                                <dd>{{ $bio->bio->children }}</dd>
                                                                <dt>Next Of Kin</dt>
                                                                <dd>{{ $bio->bio->nextofkin }}</dd>
                                                                <dt>Next Of Kin Address</dt>
                                                                <dd>{{ $bio->bio->nextofkinaddress }}</dd>
                                                                <dt>Next Of Kin Contact</dt>
                                                                <dd>{{ $bio->bio->nxtcont }}</dd>
                                                                <dt>Next Of Kin Email Address</dt>
                                                                <dd>{{ $bio->bio->nxtemail }}</dd>
                                                                <dt>Next Of Kin NIN Number</dt>
                                                                <dd>{{ $bio->bio->nxtnin }}</dd>
                                                                <dt>Relationship with Next Of Kin</dt>
                                                                <dd>{{ $bio->bio->relationship }} {{ $bio->bio->id }}
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>
                                                    @if (Auth()->user()->userType == 'Member')
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <div class="col-sm-12">
                                                                    <a name="" id="" data-toggle="modal"
                                                                        data-target="#editRequest"
                                                                        class="btn btn-outline-primary custom-designed-btn btn-sm"
                                                                        href="#" role="button">
                                                                        <i class="fa fa-edit"></i>
                                                                        Request Bio Data Edit
                                                                    </a>
                                                                </div>
                                                                <div class="modal" id="editRequest" tabindex="-1"
                                                                    role="dialog">
                                                                    <div class="modal-dialog" role="document">
                                                                        <form id="editbioemail">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title font-14">Request
                                                                                        Form
                                                                                        for Names Data</h5>
                                                                                    <button type="button"
                                                                                        class="close"
                                                                                        data-dismiss="modal"
                                                                                        aria-label="Close">
                                                                                        <span
                                                                                            aria-hidden="true">&times;</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <div class="form-group">
                                                                                        <label for="">
                                                                                            <b>
                                                                                                Enter the Messege.
                                                                                            </b>
                                                                                            <br>
                                                                                            <small class="text-primary">
                                                                                                Describe What you would like
                                                                                                the
                                                                                                General
                                                                                                Secretary to Edit in you
                                                                                                <b>Bio Data Details. e.g
                                                                                                    (Next
                                                                                                    Of
                                                                                                    Kin: Name...)</b>
                                                                                            </small>
                                                                                        </label>
                                                                                        <textarea class="form-control" required name="mesage" id="" rows="4"></textarea>
                                                                                        <input type="hidden" name="id"
                                                                                            value="{{ $bio->bio->id }}">
                                                                                    </div>
                                                                                    <div class="email-response"></div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn btn-outline-secondary btn-sm modal-close"
                                                                                        data-dismiss="modal">
                                                                                        <i
                                                                                            class="mdi mdi-close-circle"></i>
                                                                                        Close
                                                                                    </button>
                                                                                    <button id="submit-email" type="submit"
                                                                                        class="btn btn-outline-warning custom-designed-btn btn-sm">
                                                                                        Send Request <i
                                                                                            class="fa fa-paper-plane"
                                                                                            aria-hidden="true"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif
                    @else
                        <div class="col-lg-12 col-xlg-12 col-md-12 mr-auto ml-auto mt-2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="alert alert-danger" role="alert">
                                                <strong>Bio Data For Member Not Available Or You dont have permissions for
                                                    this page</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
