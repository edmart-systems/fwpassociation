@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345') }}"></script>
@stop
{{-- @extends('layouts.app', ['noSideBar' => true]) --}}
@extends('layouts.app')
@section('content')
    <div class="page-wrapper">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">All Savings Details</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('savings') }}">savings</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Savings Details</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    <div class="text-right upgrade-btn">
                        <a href="#" data-toggle="modal" data-target="#pdfsaving"><i class="fas fa-eye fa-3x"
                                title="VIEW MEMBER'S SAVINGS"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row d-flex">
            <div class="col-md-10 mx-auto row d-flex">
                <div class="form-group col-md-6 col-sm-12">
                    <label for="">Member <span class="text-danger">*</span></label>
                    <select class="browser-default custom-select" name="category" id="category">
                        <option selected disabled>Select member</option>
                        @foreach ($data['users'] as $user)
                            <option value="{{ $user->id }}">{{ $user->fwpnumber . ' | ' . $user->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6 col-sm-12">
                    <label for="">Year <span class="text-danger">*</span></label>
                    <select name="subcategory" id="subcategory" class="form-control subcategory">
                        <option value="" selected disabled>Select Year</option>
                        <?php
                        $dates = range('2019', date('Y'));
                        foreach ($dates as $date) {
                            if (date('m', strtotime($date)) <= 6) {
                                //Upto June
                                $year = '2018' . '-' . $date;
                            } else {
                                //After June
                                $year = '2018' . '-' . ($date + 1);
                            }
                            echo "<option value='$year'>$year</option>";
                        }
                        ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="row d-flex mt-4">
            <div class="col-md-12 ml-4">
                <h4 class="card-subtitle">
                    <strong style="font-size: 15px;">
                        SAVINGS FOR:
                        <span class="fwpname" style="color: #ff8533; text-transform: uppercase;" type="text">
                            __________
                        </span>
                    </strong>
                </h4>
            </div>
        </div>
        <hr class="mx-3">
        <div class="row d-flex">
            <div class="col-lg-10 col-md-11 md-sm-12 row mx-auto">
                <div class="col-md-12 col-lg-6 col-sm-12">
                    {{-- getting the total contribution --}}
                    @php
                        $totalContrb = 0;
                        foreach ($data['savings'] as $saving) {
                            $totalContrb += $saving->monthly_contribution;
                        }
                    @endphp
                    <h5>Total Contribution:
                        <strong class="year-total float-right">{{ number_format($totalContrb) }}
                            UGX</strong>
                    </h5>
                    <h5>Savings Expenditure :
                        <strong class="expenditure float-right">{{ number_format($data['expendit']) }}
                            UGX</strong>
                    </h5>
                    <h5>Running Loan :
                        <strong class="loan float-right">{{ number_format($data['loan']) }} UGX</strong>
                    </h5>
                    <h5>Expected Loan Return :
                        <strong class="loanreturn float-right">{{ number_format($data['loanreturn']) }}
                            UGX</strong>
                    </h5>
                    <h5>Current Balance:
                        <strong class="amountdue float-right">{{ number_format($data['amount']) }}
                            UGX</strong>
                    </h5>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 nopayout yespayout">
                    <h5><strong> PAYOUT </strong></h5>
                    <h5 class="">Expected Savings:
                        <strong class="Expected-savings float-right">{{ number_format($data['Expected']) }} UGX</strong>
                    </h5>

                    <h5 class="">90% Of Expected Savings :
                        <strong class="percent float-right">{{ number_format($data['percent']) }} UGX</strong>
                    </h5>
                    <h5 class="">Arrears :
                        <strong class="Arrears float-right">{{ number_format($data['Arrears']) }}
                            UGX</strong>
                    </h5>
                    <h5 class="">Payout Amount:
                        <strong class="payout float-right">{{ number_format($data['Payout']) }}
                            UGX</strong>
                    </h5>
                </div>
            </div>
        </div>
        <hr class="mx-3">
        <div class="container-fluid">
            <div class="row">
                <span class="connection-check text-danger ml-4" style="font-size: 12px;"></span>
                <!-- column -->
                <div class="table table-striped table-responsive">
                    <table>
                        <tr class="bg-light">
                            <th class="border-top-0" rowspan="2" style="background-color: #ff8533" scope="col">Actions</th>
                            <th class="border-top-0" rowspan="2" style="background-color: #ff8533" scope="col">Month</th>
                            <th class="border-top-0" rowspan="2" style="background-color: #ff8533" scope="col">Year</th>
                            <th class="border-top-0" rowspan="2" style="background-color: #ff8533" scope="col">Monthly
                                Contributions</th>
                            <th class="border-top-0" colspan="3" style="background-color: #ff8533" scope="colgroup">Monthly
                                Fines</th>
                            <th class="border-top-0" colspan="6" style="background-color: #ff8533" scope="colgroup">Events
                            </th>
                        </tr>
                        <tr>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Late_Payment</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Late_Meeting</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Absenteeism</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Marriage</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Birth</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Graduation</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Consecration</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Sickness</th>
                            <th class="border-top-0" style="background-color: #ff8533" scope="col">Death</th>
                        </tr>
                        <tbody class="saving-tbody">
                            @php
                                $user_name = '0';
                            @endphp
                            @foreach ($data['savings']->groupBy('name_id') as $savingDetails)
                                @foreach ($savingDetails as $saving)
                                    <?php
                                if($saving->user->name != $user_name){
                                ?>
                                    <tr>
                                        <td colspan="13" class="text-canter text-uppercase text-muted">
                                            {{ $saving->user->name }}</td>
                                    </tr>
                                    <?php
                                }
                                $user_name = $saving->user->name;
                                    ?>
                                    <tr>
                                        <td scope="row">
                                            @if (Auth()->user()->userType == 'treasurer')
                                                <div class="btn-group">
                                                    <button type="button"
                                                        class="btn btn-sm btn-outline-info">Action</button>
                                                    <button type="button"
                                                        class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split"
                                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item bg-light text-primary edit-savings-entries"
                                                            title="Edit Savings"
                                                            href="{{ route('edit_saving', [$saving->id, $saving->name_id, $saving->date, $saving->monthly_contribution, $saving->late_payment, $saving->late_meeting, $saving->absenteeism, $saving->marriage, $saving->birth, $saving->graduation, $saving->consecration, $saving->sickness, $saving->death]) }}">
                                                            Edit <i class="fa fa-edit"></i>
                                                        </a>
                                                        <a class="dropdown-item bg-light text-danger" title="Delete Saving"
                                                            href="{{ route('delete_savings', [$saving->id]) }}">Delete
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            @endif
                                        </td>
                                        <th scope="row">{{ date('M', strtotime($saving->date)) }}</th>
                                        <td>{{ date('Y', strtotime($saving->date)) }}</td>
                                        <td>{{ number_format($saving->monthly_contribution) }}</td>
                                        <td>{{ number_format($saving->late_payment) }}</td>
                                        <td>{{ number_format($saving->late_meeting) }}</td>
                                        <td>{{ number_format($saving->absenteeism) }}</td>
                                        <td>{{ number_format($saving->marriage) }}</td>
                                        <td>{{ number_format($saving->birth) }}</td>
                                        <td>{{ number_format($saving->graduation) }}</td>
                                        <td>{{ number_format($saving->consecration) }}</td>
                                        <td>{{ number_format($saving->sickness) }}</td>
                                        <td>{{ number_format($saving->death) }}</td>
                                    </tr>
                                @endforeach
                            @endforeach
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
@endsection
