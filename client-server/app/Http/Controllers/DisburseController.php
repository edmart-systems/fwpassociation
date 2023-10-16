<?php

namespace App\Http\Controllers;

use App\Disburse;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Loans;
use App\User;
use App\Savings;
use App\SavingLogs;
use Carbon\Carbon;

class DisburseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    //Disbursing Loan
    public function disburse(Request $request)
    {
        //fetch loan
        $loan_details = Loans::findOrFail($request->loans_id);

        if ($request->file("cheque_image")) {
            $file = $request->file("cheque_image");
            $nameWithExt = $file->getClientOriginalName();
            $name = pathinfo($nameWithExt, PATHINFO_FILENAME);
            $extension = $file->getClientOriginalExtension();
            $saveName = $name . "_" . time() . "." . $extension;
            $file->move("cheques", $saveName);
            $inputs["cheque_image"] = $saveName;
            
            //update the payment date from the date of issuing the loan
            $current = date("Y-m-d");
            $last_payment = Carbon::parse($current)->addMonths($loan_details->monthstaken)->format("Y-m-d");
            Loans::where("id", $request->loans_id)->update([
                "last_payment" => $last_payment
            ]);

            //addintions for input
            // $arrears = str_replace(",", "", $request->loanarrears);;
            // $disburse = str_replace(",", "", $request->gen_disbursed);
            // //end additions for inputs
            // // $last_payment = Carbon::parse($request->disburse_date)->addMonths($loan_details->monthstaken)->format("Y-m-d");
            // Loans::where("id", $request->loans_id)->update([
            //     // "last_payment" => $last_payment,
            //     "last_payment" => $request->last_payment,
            //     //addintions for input
            //     "arrears" => $arrears,
            //     "disbursed" => $disburse
            //     //end additions for inputs
            // ]);

            //disburse amount
            Disburse::create([
                "loans_id" => intVal($request->loans_id),
                "cheque_no" => $request->cheque_no,
                "cheque_image" => $saveName
            ]);
        } else {
            //update the payment date from the date of issuing the loan
            $current = date("Y-m-d");
            $last_payment = Carbon::parse($current)->addMonths($loan_details->monthstaken)->format("Y-m-d");
            Loans::where("id", $request->loans_id)->update([
                "last_payment" => $last_payment
            ]);

            
            //addintions for input
            // $arrears = str_replace(",", "", $request->loanarrears);;
            // $disburse = str_replace(",", "", $request->gen_disbursed);
            // //end additions for inputs
            // // $last_payment = Carbon::parse($request->disburse_date)->addMonths($loan_details->monthstaken)->format("Y-m-d");
            // Loans::where("id", $request->loans_id)->update([
            //     // "last_payment" => $last_payment,
            //     "last_payment" => $request->last_payment,
            //     //addintions for input
            //     "arrears" => $arrears,
            //     "disbursed" => $disburse
            //     //end additions for inputs
            // ]);

            //disburse amount
            Disburse::create([
                "loans_id" => intVal($request->loans_id),
                "cheque_no" => $request->cheque_no
            ]);
        }

        //fetching the arrears of user
        $user_arrears = app('App\Http\Controllers\SavingsController')->calculatearrers($loan_details->user_id);

        //make arrears payment
        $saving = Savings::where('user_id', $loan_details->user_id)->first();
        // $saving->total_deposits = $saving->total_deposits + $user_arrears;
        $saving->total_deposits = $saving->total_deposits + $loan_details->arrears;
        $saving->save();

        // check if there are earrears
        if(intVal($user_arrears) > 0){
            $savinglogs = SavingLogs::create([
                "member" => $loan_details->user_id,
                "monthly_contr" => $loan_details->arrears,
                "late_payment" => 0,
                "late_meeting" => 0,
                "absenteeism" => 0,
                "marriage" => 0,
                "birth" => 0,
                "graduation" => 0,
                "consecration" => 0,
                "death" => 0,
                "sickness" => 0,
                "log_type" => "arrears",
                "approve" => 1,
                "arrears" => $loan_details->arrears,
                "date" => $current
            ]);
        }
        
        $memberdet = User::where("id", $loan_details->user_id)->first();
        $phone = substr($memberdet->phone1, -9);
        $email = $memberdet->email;
        $name = $memberdet->name;
        $msg = "Dear $name \n Your loan amount of $loan_details->disbursed has been disbursed.\n Diburse Date: $current \n Return/Last Payment Date: $last_payment \n Login to the system for more details. Thank you for saving with Friends for a Purpose.";

        $subject = "FRIENDS WITH A PURPOSE (Deposit - Provisional)";
        $header = "From: finance@fwpassociation.org";
        mail ($email,$subject,$msg,$header);

        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);

        //withdrawing the loan
        Loans::where("id", "=", intVal($request->loans_id))->update(["status" => "running"]);
        return redirect('loans/approved');
    }

    public function userDepart(Request $request){}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Disburse  $disburse
     * @return \Illuminate\Http\Response
     */
    public function show(Disburse $disburse)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Disburse  $disburse
     * @return \Illuminate\Http\Response
     */
    public function edit(Disburse $disburse)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Disburse  $disburse
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Disburse $disburse)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Disburse  $disburse
     * @return \Illuminate\Http\Response
     */
    public function destroy(Disburse $disburse)
    {
        //
    }
}