@section('dynamic-js')
    <script src="{{ asset('/dist/js/savings.js?v=134345')}}"></script>
@stop
@extends('layouts.app')
@section('content')
    <div class="page-wrapper adjust" style="min-height: 78vh;">
        <div class="page-breadcrumb">
            <div class="row align-items-center">
                <div class="col-5">
                    <h4 class="page-title">Member Savings</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{route('AllSavings')}}">All Savings</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Savings Summary</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="col-7">
                    <div class="text-right upgrade-btn"> 
                    @if ((Auth()->user()->userType==="treasurer"))
                        <a  class="btn btn-primary btn-sm float-right mb-2 add-saving" data-toggle="modal" data-target="#savings" style="color: white; background-color: orange; border: none;">
                            <span class="togglsave"><i class="fa fa-plus"></i> Add Savings</span>
                        </a>
                    @endif
                    @if (Auth()->user()->userType==="treasurer" || Auth()->user()->userType==="chairman")
                        <a  class="btn btn-primary btn-sm float-right add-saving" style="color: white; background-color: rgb(75, 51, 8); border: none;" href="{{ route('allsavingsprint') }}">
                            <span class="togglsave"><i class="fa fa-print"></i> Print</span>
                        </a>
                    @endif
                    </div>
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
                                            <th>Total Deposits</th>
                                            <th>Arrears</th>
                                            <th>Fines</th>
                                            <th>Amount Due</th>
                                            <th>90% of Due Amount</th>
                                            <th>Running Loan</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($details as $detail)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $detail['name'] }}</td>
                                            <td>{{ $detail['fwpnumber'] }}</td>
                                            <td>{{ number_format($detail['deposits']) }}</td>
                                            <td>{{ number_format($detail['arrears']) }}</td>
                                            <td>{{ number_format($detail['fines']) }}</td>
                                            <td>{{ number_format($detail['due_amount']) }}</td>
                                            <td>{{ number_format(0.9*$detail['due_amount']) }}</td>
                                            <td>{{ number_format($detail['runningloan'])  }}</td>
                                            <td><a href="{{ route('savings_profile',$detail['uid']) }}" class="btn btn-sm btn-outline-warning custom-designed-btn"><i class="fa fa-eye"></i></a></td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>

                    </div>  
                </div>
        </div>
    </div>
@endsection