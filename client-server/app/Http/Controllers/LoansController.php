<?php

namespace App\Http\Controllers;

use App\Savings;
use App\SavingLogs;
use App\User;
use App\Loans;
use App\Expenses;
use App\Guarantertemp;
use App\Guarantors;
use App\LoanChat;
use App\LoanPayments;
use App\Disburse;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
use Carbon\Carbon;

class LoansController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    //loans reducing balance calculation
    public function reducingBalance($id){
        $current_date = date("Y-m-d");
        //fetch loan details
        $loan_details = Loans::findOrFail($id);

        //disbursed date
        $disburse_date = Carbon::parse($loan_details->last_payment)->subMonths($loan_details->monthstaken)->format("Y-m-d");

        //calculating difference in months between disburse date and current date
        $this_month = Carbon::parse($disburse_date);
        $start_month = Carbon::parse($current_date);
        $current_elapsed = $start_month->diffInMonths($this_month) + 1;  // to make it a real month
        
        //check if we are still in the same month
        //else calculate the reducing balance
        if(($current_elapsed > ($loan_details->months_elapsed)) && $current_elapsed < 4){
            $reducingBalance = round(intval($loan_details->reducing_balance) * 1.05, 0);
            Loans::where("id", $id)->update([
                "reducing_balance" => $reducingBalance,
                "months_elapsed" => $current_elapsed
            ]);
            return 1;
        }else if ($current_elapsed > $loan_details->monthstaken){

            //making a payment since the loan has expired
            LoanPayments::create([
                "loans_id" => $id,
                "amount" => $loan_details->reducing_balance,
                "date" => $current_date,
                "balance" => 0
            ]);

            //update the loans status
            Loans::where("id", $id)->update([
                "reducing_balance" => 0,
                "status" => "cleared"
            ]);

            //sending message after payments
            $memberdet = User::where("id", $loan_details->user_id)->first();
            $phone = substr($memberdet->phone1, -9);
            $email = $memberdet->email;
            $name = $memberdet->name;
            $msg = "Dear $name \n Amount $loan_details->reducing_balance/= has been paid for your loan of $loan_details->reducing_balance/= because its passed the deadline date: $loan_details->last_payment.\n New Balance: 0/= \n Login to the system for more details. Thank you for saving with Friends with a Purpose.";

            $subject = "FRIENDS WITH A PURPOSE (Deposit - Provisional)";
            $header = "From: finance@fwpassociation.org";
            mail ($email,$subject,$msg,$header);

            app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
            
            return 1;
        }
        return 0;
    }

    //background task to update all the reducing balances.
    public function updateReducingBalance()
    {
        $loans = Loans::where(function ($query) {
                        $query->where("status", "=", "running");
                        $query->orWhere("status", "=", "pay");
                    })->orderBy("created_at", "desc")->get();
        $reload = 0;
        foreach ($loans as $loan) {
           $value = $this->reducingBalance($loan->id);
           if($value == 1){
               $reload = 1;
           }
        }
        
        if($reload == 1){
            return response()->json(["msg" => "reload"]);
        }
        return response()->json(["msg" => "no"]);
    }

    //current loan.
    public function currentloan($user_id)
    {
        //fetching pending loans
        $current_date = date("Y-m-d");
        $last_loan_details = Loans::where("user_id", "=", $user_id)
            ->where("last_payment", ">", $current_date)
            ->where(function ($query) use ($user_id) {
                $query->where("status", "=", "running");
                $query->orWhere("status", "=", "pay");
            })
            ->orderBy("last_payment", "DESC")->first();
        if ($last_loan_details) {
            // $loan_payments = LoanPayments::where("loans_id", "=", $last_loan_details->id)->sum("amount");
            // return (intval($last_loan_details->return) - intval($loan_payments));
            return intVal($last_loan_details->reducing_balance);
        }
        return 0;
    }

    //unpaid loan.
    public function unpaidloan($user_id)
    {
        //unpaid loan after the loan payment date
        $current_date = date("Y-m-d");
        $last_loan_details = Loans::where("user_id", "=", $user_id)
            ->where("last_payment", "<", $current_date)
            ->where(function ($query) use ($user_id) {
                $query->where("status", "=", "running");
                $query->orWhere("status", "=", "pay");
            })
            ->orderBy("last_payment", "DESC")->first();
        if ($last_loan_details) {
            // $loan_payments = LoanPayments::where("loans_id", "=", $last_loan_details->id)->sum("amount");
            // return (intval($last_loan_details->return) - intval($loan_payments));
            return intVal($last_loan_details->reducing_balance);
        }
        return 0;
    }

    //index to loans
    public function index()
    {
        //fetiching guaranters and users
        $users = User::all();
        $guarantors = Savings::with("user")->where("user_id", "!=", Auth::user()->id)->get();
        $all_guarantors = [];
        foreach ($guarantors as $guarantor) {
            // if (($this->currentloan($guarantor->user_id) == 0) && ($guarantor->user->status == "Activated")) {
            if ((app('App\Http\Controllers\SavingsController')->calculatedueamount($guarantor->user_id) > 0) && ($guarantor->user->status == "Activated")) {
                $row = [
                    "user_id" => $guarantor->user_id,
                    "due_amount" => app('App\Http\Controllers\SavingsController')->calculatedueamount($guarantor->user_id),
                    "user_name" => $guarantor->user->name,
                    "user_number" => $guarantor->user->fwpnumber,
                    "status" => $guarantor->user->status
                ];
                array_push($all_guarantors, $row);
            }
        }

        //fetching guaranting requests notifications
        $guarantor_requests = Guarantors::with(["loans", "loans.user"])->where(["user_id" => Auth::user()->id, "status" => "NONE"])->get();

        //checking if there are other running loans for the user
        $loans = $this->currentloan(Auth::user()->id);

        //fetching all loans for the user
        $user_loans = Loans::with(["guarantors", "payments"])->where(["user_id" => Auth::user()->id])->orderBy("last_payment", "DESC")->get();
        // return [
        //     "users" => $users,
        //     "guarantors" => $all_guarantors,
        //     "guarantor_requests" => $guarantor_requests,
        //     "loans" => $loans,
        //     "user_loans" => $user_loans,
        //     "arrears" => app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id),
        // ];
        // session()->put('success', 'Item created successfully.');
        return view('Loans.loanrequest')->with([
            "users" => $users,
            "guarantors" => $all_guarantors,
            "guarantor_requests" => $guarantor_requests,
            "loans" => $loans,
            "user_loans" => $user_loans,
            "arrears" => app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id),
        ]);
    }

    public function details($id)
    {
        $loan_details = Loans::with("payments")->find($id);
        $guarantors = Guarantors::with("user")->where("loans_id", "=", $loan_details->id)->get();
        $payments = LoanPayments::where("loans_id", "=", $loan_details->id)->get();
        $totalPayment = LoanPayments::where("loans_id", "=", $loan_details->id)->get()->sum("amount");
        $comments = LoanChat::with("user")->where("loans_id", "=", $loan_details->id)->get();
        return view("Loans.details")->with([
            "loan_details" => $loan_details,
            "guarantors" => $guarantors,
            "comments" => $comments,
            "payments" => $payments,
            "totalPayment" => $totalPayment,
            "arrears" => app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id),
        ]);
    }

    public function runingDetails($id)
    {
        $loan_details = Loans::with("payments")->find($id);
        $guarantors = Guarantors::with("user")->where("loans_id", "=", $loan_details->id)->get();
        $payments = LoanPayments::where("loans_id", "=", $loan_details->id)->get();
        $disburse = Disburse::where("loans_id", "=", $loan_details->id)->first();
        $totalPayment = LoanPayments::where("loans_id", "=", $loan_details->id)->get()->sum("amount");
        $comments = LoanChat::with("user")->where("loans_id", "=", $loan_details->id)->get();
        return view("Loans.runingdetails")->with([
            "loan_details" => $loan_details,
            "guarantors" => $guarantors,
            "comments" => $comments,
            "payments" => $payments,
            "totalPayment" => $totalPayment,
            "disburse" => $disburse,
            "arrears" => app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id),
        ]);
    }

    //get arrears
    public function getarreas()
    {
        return response()->json([
            "arrears" => app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function fetchamount()
    {
        $due_amount = app('App\Http\Controllers\SavingsController')->calculatedueamount(Auth::user()->id);
        return response()->json([
            "total_amount" => $due_amount,
        ]);
    }
    
    public function create(Request $request)
    {
        if ($this->currentloan(Auth::user()->id) > 0) {
            return response()->json([
                "msg" => "Pay All Your Loans Please."
            ]);
        }
        $current_date = date("Y-m-d");
        $loanamount = str_replace(",", "", $request->loan_amount);
        $expected_amount = $request->expected_loan;
        $months_taken = intval($request->months_taken);
        $return = round(intval(($loanamount)) * pow(1.05, intval($months_taken)), 0);
        $reducingBalance = round(intval($loanamount) * 1.05, 0);
        $current = date("Y-m-d");
        $last_payment = Carbon::parse($current)->addMonths($months_taken)->format("Y-m-d");
        $userarreas = app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id);
        if($userarreas < 0){
            $userarreas = 0;
        }
        $disburse = intVal($loanamount) - intVal($request->fee) - $userarreas;

        //checking if there are guarantors
        $loan_status = "waiting_guarantor";
        if ($loanamount <= $expected_amount) {
            $loan_status = "pending";
        }

        //saving loans
        $loans_saved = Loans::create([
            "user_id" => intval(Auth::user()->id),
            "loanamount" => str_replace(",", "", $request->loan_amount),
            "processingfee" => $request->fee,
            "monthstaken" => intval($request->months_taken),
            "return" => $return,
            "reducing_balance" => $reducingBalance,
            "disbursed" => $disburse,
            "desc" => $request->desc,
            "last_payment" => $last_payment,
            "months_elapsed" => 1,
            "request_date" => $current_date,
            "payment_mode" => $request->payment_mode,
            "status" => $loan_status,
            "arrears" => $userarreas,
            "seize" => "NO",
            "reason" => "not cancelled"
        ]);
        $loan_id = $loans_saved->id;

        //adding guarators
        if ($loanamount > $expected_amount) {
            $tempGuaranters = Guarantertemp::where("user_id", "=", Auth::user()->id)->get();
            foreach ($tempGuaranters as $guarantor) {
                Guarantors::create([
                    "user_id" => $guarantor->guarantor,
                    "loans_id" => $loan_id,
                    "g_amount" => $guarantor->g_amount,
                    "status" => "NONE",
                ]);
            }
            //deleting temp data
            Guarantertemp::where("user_id", Auth::user()->id)->delete();
        }
        return response()->json([
            "msg" => "Loan Saved Successfully"
        ]);


        // in this we store the arrears but they may not be used
        // when issuing the money the loan
        // $loanamount = str_replace(",", "", $request->loan_amount);
        // $processingloanfees = str_replace(",", "", $request->loanprocessfee);
        // $my_arrears = 0;
        // // $expected_amount = $request->expected_loan;
        // $months_taken = intval($request->months_taken);
        // $return = round(intval(($loanamount)) * pow(1.05, intval($months_taken)), 0);
        // $reducingBalance = round(intval($loanamount) * 1.05, 0);
        // // $last_payment = Carbon::parse($current)->addMonths($months_taken)->format("Y-m-d");
        // // $disburse = str_replace(",", "", $request->gen_disbursed);
        // $loan_status = "approved";

        // //saving loans
        // $loans_saved = Loans::create([
        //     "user_id" => intval(Auth::user()->id),
        //     "loanamount" => str_replace(",", "", $request->loan_amount),
        //     "processingfee" => $processingloanfees,
        //     "monthstaken" => intval($request->months_taken),
        //     "return" => $return,
        //     "reducing_balance" => $reducingBalance,
        //     "disbursed" => 0,
        //     "desc" => $request->desc,
        //     "request_date" => $request->request_date,
        //     "months_elapsed" => 1,
        //     "payment_mode" => $request->payment_mode,
        //     "arrears" => $my_arrears,
        //     "status" => $loan_status,
        //     "seize" => "NO",
        //     "reason" => "not cancelled"
        // ]);

        // return response()->json([
        //     "msg" => "Loan Saved Successfully"
        // ]);

    }

    // correct
    public function edit($loan_id, Request $request)
    {
        $this->validate($request, [
            "total-amount" => "required|numeric",
            "expected_loan" => "required|numeric",
            "loan_amount" => "required",
            "fee" => "required|numeric",
            "months_taken" => "required|numeric",
            "return" => "required|numeric",
            "desc" => "required"
        ]);

        $loanamount = str_replace(",", "", $request->loan_amount);
        $expected_amount = $request->expected_loan;
        $months_taken = intVal($request->months_taken);
        $return = round(intval(($loanamount)) * pow(1.05, intval($months_taken)), 0);
        $reducingBalance = round(intval($loanamount) * 1.05, 0);
        $current = date("Y-m-d");
        $last_payment = Carbon::parse($current)->addMonths($months_taken)->format("Y-m-d");
        $userarreas = app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id);
        if($userarreas < 0){
            $userarreas = 0;
        }
        $disburse = intVal($loanamount) - intVal($request->fee) - $userarreas;

        //checking if there are guarantors
        $loan_status = "waiting_guarantor";
        if ($loanamount <= $expected_amount) {
            $loan_status = "pending";
        }

        //saving loans
        $loans_saved = Loans::where("id", $loan_id)->update([
            "user_id" => intval(Auth::user()->id),
            "loanamount" => str_replace(",", "", $request->loan_amount),
            "processingfee" => $request->fee,
            "monthstaken" => intVal($request->months_taken),
            "reducing_balance" => $reducingBalance,
            "return" => $return,
            "desc" => $request->desc,
            "disbursed" => $disburse,
            "last_payment" => $last_payment,
            "months_elapsed" => 1,
            "payment_mode" => $request->payment_mode,
            "status" => $loan_status,
            "seize" => "NO",
            "reason" => "not cancelled"
        ]);

        //deleting previous guaranters to submit new ones
        Guarantors::where("loans_id", $loan_id)->delete();

        //adding guarators
        if ($loanamount > $expected_amount) {
            $tempGuaranters = Guarantertemp::where("user_id", "=", Auth::user()->id)->get();
            foreach ($tempGuaranters as $guarantor) {
                Guarantors::create([
                    "user_id" => $guarantor->guarantor,
                    "loans_id" => $loan_id,
                    "g_amount" => $guarantor->g_amount,
                    "status" => "NONE",
                ]);
            }
            //deleting temp data
            Guarantertemp::where("user_id", Auth::user()->id)->delete();
        }
        return response()->json([
            "msg" => "Loan Saved Successfully"
        ]);
    }

    public function pending()
    {
        //fetching all loans for the user
        $loans = Loans::where("status", "=", "pending")
                ->orWhere("status", "=", "clarify")->get();
        $all_loans = [];
        foreach ($loans as $loan) {
            // check for the last
            $comments = LoanChat::with("user")->where("loans_id", $loan->id)->get();
            $row = [
                "id" => $loan->id,
                "user_id"  => $loan->user_id,
                "user" => $loan->user,
                "loanamount" => $loan->loanamount,
                "processingfees" => $loan->processingfees,
                "monthstaken" => $loan->monthstaken,
                "return"  => $loan->return,
                "disbursed"  => $loan->disbursed,
                "desc" => $loan->desc,
                "reason" => $loan->reason,
                "last_payment" => $loan->last_payment,
                "status" => $loan->status,
                "created_at" => $loan->created_at,
                "comments" => $comments
            ];
            array_push($all_loans, $row);
        }
        // return $all_loans;
        return view('Loans.pendingloan')->with([
            "loans" => $all_loans,
        ]);
    }

    public function approvedLoans()
    {
        //fetching all loans for the user
        $loans = Loans::where("status", "=", "approved")->get();
        
        $all_loans = [];
        foreach ($loans as $loan) {
            // check for the last
            $comments = LoanChat::with("user")->where("loans_id", $loan->id)->get();
            $row = [
                "id" => $loan->id,
                "user_id"  => $loan->user_id,
                "user" => $loan->user,
                "loanamount" => $loan->loanamount,
                "processingfees" => $loan->processingfee,
                "monthstaken" => $loan->monthstaken,
                "return"  => $loan->return,
                "disbursed"  => $loan->disbursed,
                "desc" => $loan->desc,
                "reason" => $loan->reason,
                "last_payment" => $loan->last_payment,
                "status" => $loan->status,
                "created_at" => $loan->created_at,
                "comments" => $comments
            ];
            array_push($all_loans, $row);
        }
        // return $all_loans;
        return view('Loans.aproved')->with([
            "loans" => $all_loans,
        ]);
    }

    public function fetch(Request $request)
    {
        $inputs = $request->all();
        try {
            $loans = DB::table("loans")
                ->where("loans.created_at", "LIKE", "{$inputs['date']}-%")
                ->where("user_id", "=", Auth::user()->id)
                ->join("users", "loans.user_id", "=", "users.id")
                ->select(
                    "loans.id",
                    "loans.desc",
                    "loans.created_at",
                    "loans.loanamount",
                    "loans.totalamountdue",
                    "loans.loan_semilimit",
                    "loans.loan_limit",
                    "loans.monthstaken",
                    "loans.processingfee",
                    "loans.return",
                    "loans.quarantor",
                    "loans.name_quarantor",
                    "loans.guarantorstatus",
                    "loans.g_amount",
                    "loans.last_payment",
                    "loans.status",
                    "loans.seize",
                    "loans.user_id",
                    "loans.reason",
                    "users.name",
                    "users.fwpnumber",
                    "users.userType"
                )
                ->orderBy("created_at", "desc")->get();
            return response()->json($loans);
        } catch (QueryException $th) {
            throw $th;
        }
    }
    
    // Get Guarantor Requests
    public function fetchguarantors()
    {
        $loansx = Guarantors::where("user_id", Auth::user()->id)->where('status', "NONE")->with('loans')->get();
        $loanarr = [];
        foreach ($loansx as $lon) {
            $requser = $lon->loans->user_id;
            $reqname = User::where('id', $requser)->first('name');
            $row = [
                "applicant" => $reqname,
                "amount" => $lon->loans->loanamount,
                "g_amount" => $lon->g_amount,
                "months" => $lon->loans->monthstaken,
                "date" => $lon->loans->last_payment,
                "id" => $lon->id
            ];
            array_push($loanarr, $row);
        }
        return response()->json($loanarr);
    }
    // End

    // Cancelling guaranter request
    public function guarantordecline(Request $request)
    {
        Guarantors::where("id", "=", $request->id)->update([
            "status" => "declined"
        ]);
        return response()->json([
            "msg" => "Decline is Successful"
        ]);
    }

    // approve guarantor request
    public function guarantorapprove(Request $request)
    {
        //accept for the guarantor.
        Guarantors::where("id", "=", $request->id)->update([
            "status" => "approved"
        ]);

        //check if all guarantor have accepted so that you update the loan to pending.
        $guarantors_count = Guarantors::where("loans_id", "=", $request->loans_id)->count();
        $guarantors_approved = Guarantors::where(["loans_id" => $request->loans_id, "status" => "approved"])->count();

        if (intval($guarantors_count) == intval($guarantors_approved)) {
            Loans::find($request->loans_id)->update([
                "status" => "pending"
            ]);
        }

        return response()->json(["msg" => "Operation Successfull"]);
    }

    public function clearloan(Request $request)
    {

        $inputs = $request->all();
        try {
            $loan = DB::table("loans")->where("id", "=", $inputs["id"])->update([
                "monthstaken" => $inputs["updatemonths_taken"],
                "return" => $inputs["update_return"],
                // "seize" => $inputs["seize"],
                "status" => "cleared",
            ]);
            $member = Loans::where("id", $inputs['id'])->first()->user_id;
            $loan_details = Loans::where("id", $inputs['id'])->first();
            $memberdet = User::where("id", $member)->get();
            $phone = substr($memberdet->phone1, -9);
            $email = $memberdet->email;
            $name = $memberdet->name;
            $msg = "Dear $name \n Your loan of $loan_details/= has been cleared.\n Login to the system for more details. Thank you for saving with Friends with a Purpose.";

            $subject = "FRIENDS WITH A PURPOSE (Deposit - Provisional)";
            $header = "From: finance@fwpassociation.org";
            mail ($email,$subject,$msg,$header);

            app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
            return response()->json(["msg" => "Operation Successfull"]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function cleared()
    {
        $loans = Loans::where("status", "=", "cleared")->orderBy("created_at", "desc")->get();
        return view('Loans.cleared')->with(["loans" => $loans]);
    }
    
    public function declineloan(Request $request)
    {
        $inputs = $request->all();
        try {
            Loans::where("id", "=", $inputs["id"])->update([
                "status" => "cancelled"
            ]);
            $member = Loans::where("id", $inputs['id'])->first()->user_id;
            $loan_details = Loans::where("id", $inputs['id'])->first();
            $memberdet = User::where("id", $member)->get();
            $phone = substr($memberdet->phone1, -9);
            $email = $memberdet->email;
            $name = $memberdet->name;
            $msg = "Dear $name \n Your loan request of amount $loan_details->loanamount/= has been declined. Login to the system or Contact the Finance officer for more details.\n Thank you for saving with Friends with a Purpose.";

            $subject = "FRIENDS WITH A PURPOSE (Deposit - Provisional)";
            $header = "From: finance@fwpassociation.org";
            mail ($email,$subject,$msg,$header);

            app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    //correct loan details
    public function loadDetails(Request $request)
    {
        $loan_details = Loans::find($request->id);

        $existing_guaranter = Guarantertemp::where("user_id", "=", Auth::user()->id)->get();
        if (count($existing_guaranter) == 0) {
            $guarantors = Guarantors::where("loans_id", "=", $request->id)->get();
            foreach ($guarantors as $guarantor) {
                Guarantertemp::create([
                    "user_id" => Auth::user()->id,
                    "guarantor" => $guarantor->user_id,
                    "g_amount" => $guarantor->g_amount,
                ]);
            }
        }
        //deleting temp data
        // Guarantors::where("loans_id", $request->id)->delete();
        return response()->json($loan_details);
    }
    
    // correct
    public function destroy(Request $request)
    {
        try {
            Loans::where("id", "=", $request->id)->delete();
            guarantors::where("loans_id", "=", $request->id)->delete();
            return response()->json(["msg" => "Deleted Successfully"]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    //Withdrawing Loan
    public function withdraw(Request $request)
    {
        //get loanfees
        $processingfee = Loans::where("id", "=", $request->id)->first()->processingfee;
        
        //getting loanfees fine.
        $total_fines = Savings::where("user_id", "=", Auth::user()->id)->first()->total_fines;

        //update the savings total_fines
        Savings::where("user_id", "=", Auth::user()->id)->update([
            "total_fines" => $total_fines+$processingfee
        ]);

        //withdrawing the loan
        Loans::where("id", "=", $request->id)->update(["status" => "withdrawn"]);
        return response()->json(["msg" => "Withdrawn Successfully"]);
    }
    
    public function loanaction(Request $request)
    {
        $reason = $request->reason;
        if($reason == "no reason"){
            try {
                Loans::where("id", "=", $request->loans_id)->update([
                    "status" => $request->status
                ]);
                
                return response()->json(["msg" => "Operation Successfull"]);
            } catch (QueryException $th) {
                throw $th;
            }
        }else{
            try {
                Loans::where("id", "=", $request->loans_id)->update([
                    "status" => $request->status
                ]);
                LoanChat::create([
                    "loans_id" => $request->loans_id,
                    "action" => $request->status,
                    "user_id" => Auth::user()->id,
                    "message" => $reason,
                ]);
                
                return response()->json(["msg" => "Operation Successfull"]);
            } catch (QueryException $th) {
                throw $th;
            }
        }
    }

    //recommended loans
    public function recommend()
    {
        $loans = Loans::where("status", "=", "recommended")->orderBy("created_at", "desc")->get();
        $all_loans = [];
        foreach ($loans as $loan) {
            // check for the last
            $comments = LoanChat::with("user")->where("loans_id", $loan->id)->get();
            $row = [
                "id" => $loan->id,
                "user_id"  => $loan->user_id,
                "user" => $loan->user,
                "loanamount" => $loan->loanamount,
                "processingfees" => $loan->processingfees,
                "monthstaken" => $loan->monthstaken,
                "return"  => $loan->return,
                "disbursed"  => $loan->disbursed,
                "desc" => $loan->desc,
                "reason" => $loan->reason,
                "last_payment" => $loan->last_payment,
                "status" => $loan->status,
                "created_at" => $loan->created_at,
                "comments" => $comments
            ];
            array_push($all_loans, $row);
        }
        return view('Loans.recommendedloan')->with(["loans" => $all_loans]);
    }

    //running loans
    public function allLoans()
    {
        $loans = Loans::where("status", "=", "running")->orderBy("created_at", "desc")->get();
        $loanRequested = Loans::where("status", "=", "pay")->orderBy("created_at", "desc")->get();
        return view('Loans.index')->with(["loans" => $loans, "loanRequested" => $loanRequested]);
    }

    //loan payment view
    public function loansRepayment($id)
    {
        $loan_details = Loans::with("user")->find($id);
        $guarantors = Guarantors::with("user")->where("loans_id", "=", $loan_details->id)->get();
        $payments = LoanPayments::where("loans_id", "=", $loan_details->id)->get();
        $disburse = Disburse::where("loans_id", "=", $loan_details->id)->first();
        $totalPayment = LoanPayments::where("loans_id", "=", $loan_details->id)->get()->sum("amount");
        $comments = LoanChat::with("user")->where("loans_id", "=", $loan_details->id)->get();
        return view("Loans.loanpayments")->with([
            "loan_details" => $loan_details,
            "guarantors" => $guarantors,
            "comments" => $comments,
            "payments" => $payments,
            "totalPayment" => $totalPayment,
            "disburse" => $disburse,
            "arrears" => app('App\Http\Controllers\SavingsController')->calculatearrers(Auth::user()->id),
        ]);
    }

    public function payLoan(Request $request){
        //updating redicing balance before making payments
        $this->updateReducingBalance();

        //get paid amount
        $amountPaid = intVal(str_replace(",", "", $request->amount));

        //fetch loan to update the reducing balance
        $loan_details = Loans::findOrFail($request->loans_id);

        //checking all scenarios
        //when paying for the loans.
        //-----------------------------------------------------------
        
        //checking if instalments or lumpsum
        // if($loan_details->payment_mode == "instalments"){
        //     //instalment payments.
        //     //----------------------------------------------------------------
        //     //this has these scenarios
        //     // 1) Paying per month
        //     // 2) Paying all in first month
        //     // 3) Paying all in second month
        //     // 4) Paying first instalments and completes in the second month

        // }else{
        //     //lump sum payments
        // }

        
        $new_reducing_balance = intVal($loan_details->reducing_balance) - $amountPaid;
        Loans::where("id", $request->loans_id)->update([
            "reducing_balance" => $new_reducing_balance
        ]);

        //update loan to cleared if balance is 0
        if($new_reducing_balance == 0){
            Loans::where("id", $request->loans_id)->update([
                "status" => "cleared"
            ]);
        }

        //create the payment
        LoanPayments::create([
            "loans_id" => $request->loans_id,
            "amount" => $amountPaid,
            "date" => $request->payment_date,
            "balance" => $new_reducing_balance
        ]);

        //sending message after payments
        $memberdet = User::where("id", $loan_details->user_id)->first();
        $phone = substr($memberdet->phone1, -9);
        $email = $memberdet->email;
        $name = $memberdet->name;
        $msg = "Dear $name \n Amount $amountPaid/= has been paid for your loan of $loan_details->reducing_balance/= as per your request. \n Payment Date: $request->payment_date/= \n Deadline/Last Payment date: $loan_details->last_payment.\n New Balance: $new_reducing_balance/= \n Login to the system for more details. Thank you for saving with Friends with a Purpose.";

        $subject = "FRIENDS WITH A PURPOSE (Deposit - Provisional)";
        $header = "From: finance@fwpassociation.org";
        // mail ($email,$subject,$msg,$header);

        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);

        return redirect('loans/payment/'.$request->loans_id);
    }

    //request for clearance
    public function requestClearance(Request $request)
    {
        Loans::where("id", "=", $request->id)->update([
            "status" => "pay"
        ]);
        return response()->json(["msg" => "Operation Successfull"]);
    }
}