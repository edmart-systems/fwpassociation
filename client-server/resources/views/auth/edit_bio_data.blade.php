@extends('layouts.app')
@section('content')
    {{-- profile --}}
    <div class="page-wrapper row">
        <div class="page-breadcrumb col-md-11 mr-1">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h4 class="page-title">Bio Data for {{ $bio->name }}</h4>
                    <div class=" d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('editBioRequest') }}">Editing Requests</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Edit Bio Data</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mt-4">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-xlg-12 col-md-12 mr-auto ml-auto mt-2">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-horizontal form-material" style="margin: 2px 4rem 2px 4rem;"
                                    action="{{ route('editBio') }}" method="POST">
                                    @csrf

                                    @if ($bio->bio)
                                        <input type="hidden" value="{{ $bio->bio->user_id }}" name="uid">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-12">Current Address</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="Address"
                                                            value="{{ $bio->bio->address }}" class="form-control"
                                                            name="address" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Occupation</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="Your Occupation"
                                                            value="{{ $bio->bio->occupation }}" class="form-control"
                                                            name="occupation" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Nationality</label>
                                                    <div class="col-md-12">
                                                        <input type="teaxt" placeholder="E.g. Ugandan"
                                                            value="{{ $bio->bio->nationality }}" class="form-control"
                                                            name="nationality" required>
                                                    </div>
                                                </div>
                                                @php
                                                    $min = date('Y-m-d', strtotime(date('Y-m-d') . ' - 15 years'));
                                                @endphp
                                                <div class="form-group">
                                                    <label class="col-md-12">Date Of Birth</label>
                                                    <div class="col-md-12">
                                                        <input type="date" value="{{ $bio->bio->dob }}"
                                                            class="form-control" name="dob" max="@php
                                                                echo $min;
                                                            @endphp"
                                                            required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">NIN</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="Your NIN Number"
                                                            class="form-control" name="nin"
                                                            value="{{ $bio->bio->nin }}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Passport Number</label>
                                                    <div class="col-md-12">
                                                        <input name="passport" type="text"
                                                            placeholder="Your Passport Number" class="form-control"
                                                            value="{{ $bio->bio->passport }}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Marital Status</label>
                                                    <div class="col-md-12">
                                                        <select name="marital" id="marital" class="form-control" required
                                                            id="marital" onchange="changeMaritalStatus(this.value)">
                                                            <option value="{{ $bio->bio->marital }}" selected>
                                                                {{ $bio->bio->marital }}</option>
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
                                                        <input name="spouse" id="spouse-value" type="text"
                                                            placeholder="Your Spouse Name" class="form-control"
                                                            value="{{ $bio->bio->spouse }}">
                                                    </div>
                                                </div>
                                                <script>
                                                    changeMaritalStatus(document.getElementById('marital').value);

                                                    function changeMaritalStatus(status) {
                                                        console.log(status);
                                                        if (status == 'Married') {
                                                            document.getElementById('spouse').style.display = 'block';
                                                        } else {
                                                            document.getElementById('spouse-value').value = '';
                                                            document.getElementById('spouse').style.display = 'none';
                                                        }
                                                    }
                                                </script>
                                                <div class="form-group">
                                                    <label class="col-md-12">Father's Status</label>
                                                    <div class="col-md-12">
                                                        <select name="fstatus" id="fstatus" class="form-control" required
                                                            onchange="changeFather1(this.value)">
                                                            @php
                                                                if ($bio->bio->father != '') {
                                                                    echo '<option selected value="1">Living</option> <option value="0">Deceased</option>';
                                                                } else {
                                                                    echo '<option value="1">Living</option> <option selected value="0">Deceased</option>';
                                                                }
                                                            @endphp
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="father1">
                                                    <label class="col-md-12">Father's Name</label>
                                                    <div class="col-md-12">
                                                        <input name="father" id="father-value" type="text"
                                                            placeholder="Enter N/A for Not Applicable"
                                                            class="form-control" value="{{ $bio->bio->father }}">
                                                    </div>
                                                </div>
                                                <script>
                                                    const statusval = document.getElementById('fstatus');
                                                    changeFather1(statusval.value);

                                                    function changeFather1(status) {
                                                        if (status == '1') {
                                                            document.getElementById('father1').style.display = 'block';
                                                        } else {
                                                            document.getElementById('father-value').value = '';
                                                            document.getElementById('father1').style.display = 'none';
                                                        }
                                                    }
                                                </script>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-md-12">Mother's Status</label>
                                                    <div class="col-md-12">
                                                        <select name="mstatus" id="mstatus" class="form-control" required
                                                            onchange="changeMother(this.value)">
                                                            @php
                                                                if ($bio->bio->mother != '') {
                                                                    echo '<option selected value="1">Living</option> <option value="0">Deceased</option>';
                                                                } else {
                                                                    echo '<option value="1">Living</option> <option selected value="0">Deceased</option>';
                                                                }
                                                            @endphp
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="mother1">
                                                    <label class="col-md-12">Mother's Name</label>
                                                    <div class="col-md-12">
                                                        <input name="mother" id="mother-value" type="text"
                                                            placeholder="Enter N/A for Not Applicable"
                                                            class="form-control" value="{{ $bio->bio->mother }}">
                                                    </div>
                                                </div>
                                                <script>
                                                    const momStatusVal = document.getElementById('mstatus');
                                                    changeMother(momStatusVal.value);

                                                    function changeMother(status) {
                                                        if (status == '1') {
                                                            document.getElementById('mother1').style.display = 'block';
                                                        } else {
                                                            document.getElementById('mother-value').value = '';
                                                            document.getElementById('mother1').style.display = 'none';
                                                        }
                                                    }
                                                </script>
                                                <div class="form-group">
                                                    <label class="col-md-12">Children <small>(Seperate Names with
                                                            Commas)</small></label>
                                                    <div class="col-md-12">
                                                        <textarea name="children" cols="3" rows="3" class="form-control"
                                                            placeholder="Enter Names Seperated with Commas">{{ $bio->bio->children }}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Next Of Kin Full Name</label>
                                                    <div class="col-md-12">
                                                        <input name="nxtofkin" type="text" placeholder="Enter Next Of Kin"
                                                            class="form-control" value="{{ $bio->bio->nextofkin }}"
                                                            required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Next Of Kin Address</label>
                                                    <div class="col-md-12">
                                                        <input name="nxtaddress" type="text"
                                                            placeholder="Your Next Of Kin Address" class="form-control"
                                                            value="{{ $bio->bio->nextofkinaddress }}" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Next Of Kin Contact</label>
                                                    <div class="col-md-12">
                                                        <input name="nextcont" type="number"
                                                            placeholder="Enter Next Of Kin Contact" class="form-control"
                                                            value="{{ $bio->bio->nxtcont }}" required>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-md-12">Next Of Kin Email</label>
                                                    <div class="col-md-12">
                                                        <input name="nextemail" type="email"
                                                            placeholder="Enter Next Of Kin Email" class="form-control"
                                                            value="{{ $bio->bio->nxtemail }}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Next Of Kin NIN Number</label>
                                                    <div class="col-md-12">
                                                        <input name="nxtnin" type="text"
                                                            placeholder="Enter Next Of Kin NIN Number"
                                                            class="form-control" value="{{ $bio->bio->nxtnin }}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-12">Relationship with Next Of Kin</label>
                                                    <div class="col-md-12">
                                                        <input name="relationship" type="text"
                                                            placeholder="Enter Your Relationship with Next Of Kin"
                                                            class="form-control" value="{{ $bio->bio->relationship }}"
                                                            required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <button type="submit"
                                                    class="btn btn-outline-success float-right custom-designed-btn btn-sm">
                                                    <i class="fa fa-save"></i>
                                                    Update Bio
                                                </button>
                                            </div>
                                        </div>
                                    @endif
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
