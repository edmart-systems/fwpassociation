<?php

namespace App\Http\Controllers;

use App\Expenses;
use App\Loans;
use App\LoanPayments;
use App\User;
use App\Savings;
use App\Charge;
use App\SavingLogs;
use App\SavingDecline;
use App\Guarantors;
use Facade\Ignition\QueryRecorder\Query;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
use Carbon\Carbon;
use Session;


class SavingsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function calculatedueamount($id)
    {
        $memberSavings = Savings::where("user_id", $id)->first(); // gets the whole row
        $totalDeposits = SavingLogs::where('approve',1)->where('member',$id)->sum('monthly_contr');
         $totalLatePayments = SavingLogs::where('approve',1)->where('member',$id)->sum('late_payment');
         $totallatemeet = SavingLogs::where('approve',1)->where('member',$id)->sum('late_meeting');
         $totalmar = SavingLogs::where('approve',1)->where('member',$id)->sum('marriage');
         $totalbirth = SavingLogs::where('approve',1)->where('member',$id)->sum('birth');
         $totaldeath = SavingLogs::where('approve',1)->where('member',$id)->sum('death');
         $totalgrad = SavingLogs::where('approve',1)->where('member',$id)->sum('graduation');
         $totalcons = SavingLogs::where('approve',1)->where('member',$id)->sum('consecration');
         $totalabs = SavingLogs::where('approve',1)->where('member',$id)->sum('absenteeism');
         $totalsick = SavingLogs::where('approve',1)->where('member',$id)->sum('sickness');
        $totalFines = $totallatemeet+$totalabs;
        $totalSocial = $totalmar+$totalbirth+$totaldeath+$totalgrad+$totalcons+$totalsick;
      
        $charges = Charge::where('user',$id)->sum('amount');
        $processingfee = Loans::where('user_id',$id)->where('status','cancelled')->sum('processingfee');
        $loans = Loans::where('user_id',$id)->get();
        $payments = 0;
        if (count($loans)>0) {
            foreach ($loans as $loan) {
            $loanId = $loan->id;
            $payments = $payments+LoanPayments::where('loans_id',$loanId)->sum('amount');
             }
        }
        return $due_amount = intval($totalDeposits) - intval($totalLatePayments) - intval($totalFines) - intval($totalSocial)-intval($charges)-intval($payments)-intval($processingfee);
    }

    public function index()
    {
         $users = User::where("users.fwpnumber", "LIKE", "%FWP%")->where("status","Activated")->with('savings')->get();
        $members = [];
        foreach ($users as $user) {
            $uId = $user->id;
            $tdeposits = SavingLogs::where('approve',1)->where('member',$uId)->sum('monthly_contr');
             $latepayments = SavingLogs::where('approve',1)->where('member',$uId)->sum('late_payment');
             $totallatemeet = SavingLogs::where('approve',1)->where('member',$uId)->sum('late_meeting');
             $totalabs = SavingLogs::where('approve',1)->where('member',$uId)->sum('absenteeism');
             $totalsick = SavingLogs::where('approve',1)->where('member',$uId)->sum('sickness');
            $totalfines = $totallatemeet+$totalabs+$latepayments;

            $due_amount = $this->calculatedueamount($uId);

            $uname = $user->name;
            $unumber = $user->fwpnumber;
            $uid = $user->id;
            $allmemb = [
                'uid' => $uid,
                'name' => $uname,
                'fwpnumber' => $unumber,
                'deposits' => $tdeposits,
                "due_amount" => $due_amount,
                "fines" => $totalfines,
                // "arrears" => $arrears+$tfines+app('App\Http\Controllers\LoansController')->unpaidloan($uId),
                "arrears" => $this->calculatearrers($uId),
                "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($uId),
                "unpaidloan" => app('App\Http\Controllers\LoansController')->unpaidloan($uId)
            ];
            array_push($members, $allmemb);
        }
        return view('savings.index')->with('details', $members);
    }
    public function allsavingsprint()
    {
         $users = User::where("users.fwpnumber", "LIKE", "%FWP%")->where("status","Activated")->with('savings')->get();
        $members = [];
        foreach ($users as $user) {
            $uId = $user->id;
            $tdeposits = SavingLogs::where('approve',1)->where('member',$uId)->sum('monthly_contr');
             $latepayments = SavingLogs::where('approve',1)->where('member',$uId)->sum('late_payment');
             $totallatemeet = SavingLogs::where('approve',1)->where('member',$uId)->sum('late_meeting');
             $totalabs = SavingLogs::where('approve',1)->where('member',$uId)->sum('absenteeism');
             $totalsick = SavingLogs::where('approve',1)->where('member',$uId)->sum('sickness');
            $totalfines = $totallatemeet+$totalabs+$latepayments;

            $due_amount = $this->calculatedueamount($uId);

            $uname = $user->name;
            $unumber = $user->fwpnumber;
            $uid = $user->id;
            $allmemb = [
                'uid' => $uid,
                'name' => $uname,
                'fwpnumber' => $unumber,
                'deposits' => $tdeposits,
                "due_amount" => $due_amount,
                "fines" => $totalfines,
                // "arrears" => $arrears+$tfines+app('App\Http\Controllers\LoansController')->unpaidloan($uId),
                "arrears" => $this->calculatearrers($uId),
                "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($uId),
                "unpaidloan" => app('App\Http\Controllers\LoansController')->unpaidloan($uId)
            ];
            array_push($members, $allmemb);
        }
        return view('savings.allsavingsprint')->with('details', $members);
    }


    // All Savings
     public function AllSavings()
    {
        $thismon = date("m");
        $thisyr = date("Y");
        $instalments = [];
        $savings = SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->orderBy('date','desc')->get();
           foreach ($savings as $saving) {
            $id = $saving->member;
            $user=User::where("id", "=", $id)->first();
            if (($saving->approve)=="0") {
                $status="Panding";
            }
            else{
                $status="Approved";
            }
           $row = [
            'monthly' => $saving->monthly_contr,
            'late_payment' => $saving->late_payment,
            'late_meeting' => $saving->late_meeting,
            'absenteeism' => $saving->absenteeism,
            'birth' => $saving->birth,
            'death' => $saving->death,
            'graduation' => $saving->graduation,
            'consecration' => $saving->consecration,
            'marriage' => $saving->marriage,
            'sickness' => $saving->sickness,
            'date' => $saving->date,
            'status' => $status,
            "name" => $user->name,
            "fwpnumber" => $user->fwpnumber
           ];
           array_push($instalments, $row);
       }
        $totals = [
             'totaldeposit' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('monthly_contr'),
             'totallatepay' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('late_payment'),
             'totallatemeet' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('late_meeting'),
             'totalmar' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('marriage'),
             'totalbirth' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('birth'),
             'totaldeath' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('death'),
             'totalgrad' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('graduation'),
             'totalcons' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('consecration'),
             'totalabs' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('absenteeism'),
             'totalsick' => SavingLogs::whereMonth('date',$thismon)->whereYear('date',$thisyr)->where('approve',1)->sum('sickness')
       ];
        //return $instalments;
       return view('savings.allsavings')->with([
        'details' => $instalments,
        'totals' => $totals
    ]);
    }
// All savings End

    // Filter all savings
     public function fiter_all_avings(Request $request)
    {
        $from = $request->from;
        $to = $request->to;
        $instalments = [];
        $savings = SavingLogs::whereBetween('date',[$from,$to])->orderBy('date','desc')->get();
           foreach ($savings as $saving) {
            $id = $saving->member;
            $user=User::where("id", "=", $id)->first();
            if (($saving->approve)=="0") {
                $status="Panding";
            }
            else{
                $status="Approved";
            }
           $row = [
            'monthly' => $saving->monthly_contr,
            'late_payment' => $saving->late_payment,
            'late_meeting' => $saving->late_meeting,
            'absenteeism' => $saving->absenteeism,
            'birth' => $saving->birth,
            'death' => $saving->death,
            'graduation' => $saving->graduation,
            'consecration' => $saving->consecration,
            'marriage' => $saving->marriage,
            'sickness' => $saving->sickness,
            'date' => $saving->date,
            'status' => $status,
            "name" => $user->name,
            "fwpnumber" => $user->fwpnumber
           ];
           array_push($instalments, $row);
       }
        $totals = [
             'totaldeposit' => SavingLogs::whereBetween('date',[$from,$to])->sum('monthly_contr'),
             'totallatepay' => SavingLogs::whereBetween('date',[$from,$to])->sum('late_payment'),
             'totallatemeet' => SavingLogs::whereBetween('date',[$from,$to])->sum('late_meeting'),
             'totalmar' => SavingLogs::whereBetween('date',[$from,$to])->sum('marriage'),
             'totalbirth' => SavingLogs::whereBetween('date',[$from,$to])->sum('birth'),
             'totaldeath' => SavingLogs::whereBetween('date',[$from,$to])->sum('death'),
             'totalgrad' => SavingLogs::whereBetween('date',[$from,$to])->sum('graduation'),
             'totalcons' => SavingLogs::whereBetween('date',[$from,$to])->sum('consecration'),
             'totalabs' => SavingLogs::whereBetween('date',[$from,$to])->sum('absenteeism'),
             'totalsick' => SavingLogs::whereBetween('date',[$from,$to])->sum('sickness')
       ];
        //return $instalments;
       return view('savings.allsavings')->with([
        'details' => $instalments,
        'totals' => $totals
    ]);
    }
// filter All savings End

   public function savingDetails($id)
    {
       $user=User::where("id", "=", $id)->with('savings')->first();
        $savings = SavingLogs::where('member',$id)->where('approve',1)->orderBy('date','desc')->get();
        $tdeposits = SavingLogs::where('approve',1)->where('member',$id)->sum('monthly_contr');
         $latepayments = SavingLogs::where('approve',1)->where('member',$id)->sum('late_payment');
         $totallatemeet = SavingLogs::where('approve',1)->where('member',$id)->sum('late_meeting');
         $totalmar = SavingLogs::where('approve',1)->where('member',$id)->sum('marriage');
         $totalbirth = SavingLogs::where('approve',1)->where('member',$id)->sum('birth');
         $totaldeath = SavingLogs::where('approve',1)->where('member',$id)->sum('death');
         $totalgrad = SavingLogs::where('approve',1)->where('member',$id)->sum('graduation');
         $totalcons = SavingLogs::where('approve',1)->where('member',$id)->sum('consecration');
         $totalabs = SavingLogs::where('approve',1)->where('member',$id)->sum('absenteeism');
         $totalsick = SavingLogs::where('approve',1)->where('member',$id)->sum('sickness');
        $totalfines = $totallatemeet+$totalabs+$latepayments;
        $totalSocial = $totalmar+$totalbirth+$totaldeath+$totalgrad+$totalcons+$totalsick;
       $instalments = [];
       if (count($savings)>0) {
           foreach ($savings as $saving) {
                $row = [
                    'monthly' => $saving->monthly_contr,
                    'late_payment' => $saving->late_payment,
                    'late_meeting' => $saving->late_meeting,
                    'absenteeism' => $saving->absenteeism,
                    'birth' => $saving->birth,
                    'death' => $saving->death,
                    'graduation' => $saving->graduation,
                    'consecration' => $saving->consecration,
                    'marriage' => $saving->marriage,
                    'sickness' => $saving->sickness,
                    'date' => $saving->date,
                    "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($id)
                ];
                array_push($instalments, $row);
            }
       }
       else{
        $row = [
            'monthly' => 0,
            'late_payment' => 0,
            'late_meeting' =>0,
            'absenteeism' => 0,
            'birth' => 0,
            'death' => 0,
            'graduation' => 0,
            'consecration' => 0,
            'marriage' => 0,
            'sickness' => 0,
            'date' => 0,
            "arrears" => $this->calculatearrers($id),
            "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($id)
           ];
           array_push($instalments, $row);
       }
       // return $instalments;
       return view('savings.savingdetails')->with([
            'details' => $instalments, 
            'totalfin' => $totalfines, 
            'totalsoc' => $totalSocial, 
            'totaldep' => $tdeposits, 
            "due_amount" => $this->calculatedueamount($id)-app('App\Http\Controllers\LoansController')->unpaidloan($id),
            'user' => $user,
            'arrears' => $this->calculatearrers($id),
            'expected' => $this->calculateexpected()
        ]);
    }
    public function savingDetailsPrint($id)
    {
       $user=User::where("id", "=", $id)->with('savings')->first();
        $savings = SavingLogs::where('member',$id)->where('approve',1)->orderBy('date','desc')->get();
        $tdeposits = SavingLogs::where('approve',1)->where('member',$id)->sum('monthly_contr');
         $latepayments = SavingLogs::where('approve',1)->where('member',$id)->sum('late_payment');
         $totallatemeet = SavingLogs::where('approve',1)->where('member',$id)->sum('late_meeting');
         $totalmar = SavingLogs::where('approve',1)->where('member',$id)->sum('marriage');
         $totalbirth = SavingLogs::where('approve',1)->where('member',$id)->sum('birth');
         $totaldeath = SavingLogs::where('approve',1)->where('member',$id)->sum('death');
         $totalgrad = SavingLogs::where('approve',1)->where('member',$id)->sum('graduation');
         $totalcons = SavingLogs::where('approve',1)->where('member',$id)->sum('consecration');
         $totalabs = SavingLogs::where('approve',1)->where('member',$id)->sum('absenteeism');
         $totalsick = SavingLogs::where('approve',1)->where('member',$id)->sum('sickness');
        $totalfines = $totallatemeet+$totalabs+$latepayments;
        $totalSocial = $totalmar+$totalbirth+$totaldeath+$totalgrad+$totalcons+$totalsick;
       $instalments = [];
       if (count($savings)>0) {
           foreach ($savings as $saving) {
                $row = [
                    'monthly' => $saving->monthly_contr,
                    'late_payment' => $saving->late_payment,
                    'late_meeting' => $saving->late_meeting,
                    'absenteeism' => $saving->absenteeism,
                    'birth' => $saving->birth,
                    'death' => $saving->death,
                    'graduation' => $saving->graduation,
                    'consecration' => $saving->consecration,
                    'marriage' => $saving->marriage,
                    'sickness' => $saving->sickness,
                    'date' => $saving->date,
                    "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($id)
                ];
                array_push($instalments, $row);
            }
       }
       else{
        $row = [
            'monthly' => 0,
            'late_payment' => 0,
            'late_meeting' =>0,
            'absenteeism' => 0,
            'birth' => 0,
            'death' => 0,
            'graduation' => 0,
            'consecration' => 0,
            'marriage' => 0,
            'sickness' => 0,
            'date' => 0,
            "arrears" => $this->calculatearrers($id),
            "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($id)
           ];
           array_push($instalments, $row);
       }
       // return $instalments;
       return view('savings.indsavingsprint')->with([
            'details' => $instalments, 
            'totalfin' => $totalfines, 
            'totalsoc' => $totalSocial, 
            'totaldep' => $tdeposits, 
            "due_amount" => $this->calculatedueamount($id)-app('App\Http\Controllers\LoansController')->unpaidloan($id),
            'user' => $user,
            'arrears' => $this->calculatearrers($id),
            'expected' => $this->calculateexpected()
        ]);
    }
    public function filter_individial_savings(Request $request){
      $id = $request->member;
      $from = $request->from;
      $to = $request->to;
       $user=User::where("id", "=", $id)->with('savings')->first();
        $savings = SavingLogs::where('member',$id)->whereBetween('date',[$from,$to])->orderBy('date','desc')->get();
        $tdeposits = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('monthly_contr');
         $latepayments = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('late_payment');
         $totallatemeet = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('late_meeting');
         $totalmar = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('marriage');
         $totalbirth = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('birth');
         $totaldeath = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('death');
         $totalgrad = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('graduation');
         $totalcons = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('consecration');
         $totalabs = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('absenteeism');
         $totalsick = SavingLogs::where('approve',1)->where('member',$id)->whereBetween('date',[$from,$to])->sum('sickness');
        $totalfines = $totallatemeet+$totalabs+$latepayments;
        $totalSocial = $totalmar+$totalbirth+$totaldeath+$totalgrad+$totalcons+$totalsick;
       $instalments = [];
       if (count($savings)>0) {
           foreach ($savings as $saving) {
           $row = [
            'monthly' => $saving->monthly_contr,
            'late_payment' => $saving->late_payment,
            'late_meeting' => $saving->late_meeting,
            'absenteeism' => $saving->absenteeism,
            'birth' => $saving->birth,
            'death' => $saving->death,
            'graduation' => $saving->graduation,
            'consecration' => $saving->consecration,
            'marriage' => $saving->marriage,
            'sickness' => $saving->sickness,
            'date' => $saving->date,
            "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($id)
           ];
           array_push($instalments, $row);
       }
       }
       else{
        $row = [
            'monthly' => 0,
            'late_payment' => 0,
            'late_meeting' =>0,
            'absenteeism' => 0,
            'birth' => 0,
            'death' => 0,
            'graduation' => 0,
            'consecration' => 0,
            'marriage' => 0,
            'sickness' => 0,
            'date' => 0,
            "arrears" => $this->calculatearrers($id),
            "runningloan" => app('App\Http\Controllers\LoansController')->currentloan($id)
           ];
           array_push($instalments, $row);
       }
       // return $instalments;
       return view('savings.savingdetails')->with([
        'details' => $instalments,
        'totalfin' => $totalfines, 
        'totalsoc' => $totalSocial, 
        'totaldep' => $tdeposits, 
        "due_amount" => $this->calculatedueamount($id)-app('App\Http\Controllers\LoansController')->unpaidloan($id),
        'user' => $user,
        'arrears' => $this->calculatearrers($id),
        'expected' => $this->calculateexpected()
    ]);
    }

    public function savingToApprove() {
         $savings = SavingLogs::where('approve',0)->with('user')->orderBy('date','desc')->get();
        
       $instalments = [];
           foreach ($savings as $saving) {
             $id = $savings[0]->member;
            $user = User::where('id',$id)->first();
           $row = [
            'id' => $saving->id,
            'monthly' => $saving->monthly_contr,
            'late_payment' => $saving->late_payment,
            'late_meeting' => $saving->late_meeting,
            'absenteeism' => $saving->absenteeism,
            'birth' => $saving->birth,
            'death' => $saving->death,
            'graduation' => $saving->graduation,
            'consecration' => $saving->consecration,
            'marriage' => $saving->marriage,
            'sickness' => $saving->sickness,
            'date' => $saving->date,
            'username' => $saving->user->name,
            'fwpnumber' => $saving->user->fwpnumber,
            'arrears' => $saving->arrears,
            'member' => $saving->member
           ];
           array_push($instalments, $row);
       }
        // return $instalments;
       return view('savings.savingapprove')->with([
        'details' => $instalments
    ]);
    }

// approve savings
    public function approveSaving($savingId){
         $savingdet = SavingLogs::where('id',$savingId)->first();
        $member = $savingdet->member;
        $chksavingtx = Savings::where('user_id', $member)->count();

        if ($chksavingtx < 1) {
             $savingdet->late_payment;
            $saving = Savings::create([
                "user_id" => $member,
                "total_monthly" => $savingdet->monthly_contr,
                "total_social" => $savingdet->marriage + $savingdet->birth + $savingdet->death + $savingdet->graduation + $savingdet->consecration + $savingdet->sickness,
                "total_fines" => $savingdet->late_meeting + $savingdet->absenteeism,
                "total_late_payment" => $savingdet->late_payment,
                "total_deposits" => $savingdet->monthly_contr
            ]);
        } 
        else {
            $saving = Savings::where('user_id', $member)->first();
            $saving->total_deposits = $saving->total_deposits + $savingdet->monthly_contr;
            $saving->total_social = $saving->total_social + $savingdet->marriage + $savingdet->birth + $savingdet->death + $savingdet->graduation + $savingdet->consecration + $savingdet->sick;
            $saving->total_fines = $saving->total_fines + $savingdet->late_meeting + $savingdet->absenteeism;
            $saving->total_late_payment = $saving->total_late_payment + $savingdet->late_payment;
            $saving->save();
        }

        // Send email to finance and member
        $memberdet = User::find($member);
        $mname = $memberdet->name;
        $memail = $memberdet->email;
        $phone = substr($memberdet->phone1, -9);
        $financedet = User::where("fwpnumber","NONE_TR")->first();
        $cname = $financedet->name;
        $cemail = $financedet->email;
        $msg = "Friends With a Purpose\n. Your Saving of $savingdet->monthly_contr/= has been received\n Login to the system for more details. Thank you for saving with Friends with a Purpose.";
        $membermsg = "Dear ".$mname."\n Your total deposit of ".$savingdet->monthly_contr." paid on ".$savingdet->date." has been recieved and entered in the System.\n The breakdown is as follows;\n";
        $membermsg.= "Total deposit = ".$savingdet->monthly_contr." \n";
        $membermsg.= "Late Payment = ".$savingdet->late_payment." \n";
        $membermsg.= "Late for meetings = ".$savingdet->late_meeting." \n";
        $membermsg.= "Absent for a meeting = ".$savingdet->absenteeism." \n";
        $membermsg.= "Marriage Contribution = ".$savingdet->marriage." \n";
        $membermsg.= "Birth Contribution = ".$savingdet->birth." \n";
        $membermsg.= "Death Contribution = ".$savingdet->death." \n";
        $membermsg.= "Sickness Contribution = ".$savingdet->sickness." \n";
        $membermsg.= "Consecration Contribution = ".$savingdet->consecration." \n";
        $membermsg.= "Graduation Contribution = ".$savingdet->graduation." \n Thank you";

        $subject = "FRIENDS WITH A PURPOSE (Deposit - Provisional)";
        $header = "From: finance@fwpassociation.org";
        mail ($memail,$subject,$membermsg,$header);

        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);

        SavingLogs::where('id',$savingId)->update(['approve'=>1]);
        Session::flash('success', 'Saving Approved successfully');
        return redirect()->route('savings_approve');
    }
// approve savings end

// Edit savings
    public function editSaving(Request $request)
    {
        $savId = $request->saving;
        $savdet = SavingLogs::find($savId);
        $savdet->member = $request->savingscate;
        $savdet->monthly_contr = str_replace(",", "", $request->monthly_contribution);
        $savdet->late_payment = str_replace(",", "", $request->late_payment);
        $savdet->late_meeting = str_replace(",", "", $request->late_meeting);
        $savdet->absenteeism = str_replace(",", "", $request->absenteeism);
        $savdet->marriage = str_replace(",", "", $request->marriage);
        $savdet->birth = str_replace(",", "", $request->birth);
        $savdet->graduation = str_replace(",", "", $request->graduation);
        $savdet->consecration = str_replace(",", "", $request->consecration);
        $savdet->death = str_replace(",", "", $request->death);
        $savdet->sickness = str_replace(",", "", $request->sickness);
        $savdet->arrears = str_replace(",", "", $request->arreasws);
        $savdet->date = $request->month;
        $savdet->approve = 0;
        $savdet->save();
        Session::flash('success', 'Saving edited successfully');
        return redirect()->back();
    }
    // Edit saving ends
    // approve savings
    public function declineSaving(Request $request){
        $savingId = $request->saving;
        $message = $request->message;
        $insert = SavingDecline::create([
            'savingId' => $savingId,
            'message' => $message
        ]);
        $savingdet = SavingLogs::where('id', $savingId)->first();
        $member = $savingdet->member;
        $approvesaving = SavingLogs::where('id',$savingId)->update(['approve'=>2]);
        // Send email to finance
        $memberdet = User::find($member);
        $mname = $memberdet->name;
        $financedet = User::where("fwpnumber","NONE_TR")->first();
        $cname = $financedet->name;
        $cemail = $financedet->email;
        $phone = substr($financedet->phone1, -9);
        $membermsg = "Dear ".$cname."\n Saving of $savingdet->monthly_contr/= paid on $savingdet->date for member $mname has been declined because $message.\n \n Login to the system for more details. Thank you for saving with Friends with a Purpose.";
        $msg = "Dear ".$cname."\n Saving of $savingdet->monthly_contr/= paid on $savingdet->date for member $mname has been declined \n Login to the system for more details. Thank you for saving with Friends with a Purpose.";
        // SEND SMS
        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);

        $subject = "FRIENDS WITH A PURPOSE (Rejected Saving)";
        $header = "From: chairman@fwpassociation.org";
        mail ($cemail,$subject,$membermsg,$header);
        Session::flash('success', 'Saving declined successfully');
        return redirect()->route('savings_approve');
    }
// approve savings end 0751135664

    // Rejected savings
     public function savingRejected() {
         $savings = SavingLogs::where('approve',2)->with('user')->get();
        
       $instalments = [];
           foreach ($savings as $saving) {
             $id = $savings[0]->member;
            $user = User::where('id',$id)->first();
            $savId = $saving->id;
            $message = SavingDecline::where('savingId',$savId)->orderBy('tid', 'desc')->value('message');
           $row = [
            'id' => $savId,
            'monthly' => $saving->monthly_contr,
            'late_payment' => $saving->late_payment,
            'late_meeting' => $saving->late_meeting,
            'absenteeism' => $saving->absenteeism,
            'birth' => $saving->birth,
            'death' => $saving->death,
            'graduation' => $saving->graduation,
            'consecration' => $saving->consecration,
            'marriage' => $saving->marriage,
            'sickness' => $saving->sickness,
            'date' => $saving->date,
            'username' => $saving->user->name,
            'fwpnumber' => $saving->user->fwpnumber,
            'arrears' => $saving->arrears,
            'member' => $saving->member,
            'message' => $message
           ];
           array_push($instalments, $row);
       }
       // return $instalments;
       return view('savings.rejected_saving')->with([
        'details' => $instalments
    ]);
    }
    // Rejected savings end

    public function create(Request $request)
    {
        $this->validate($request, [
            "savingscate" => "required",
            "month" => "required",
            "monthly_contribution" => "required",
            "late_payment" => "required",
            "late_meeting" => "required",
            "absenteeism" => "required",
            "marriage" => "required",
            "birth" => "required",
            "graduation" => "required",
            "consecration" => "required",
            "sickness" => "required",
            "death" => "required",
        ]);

        $tot = str_replace(",", "", $request->monthly_contribution);
        $absenteeism = str_replace(",", "", $request->absenteeism);
        $late_payment = str_replace(",", "", $request->late_payment);
        $late_meeting = str_replace(",", "", $request->late_meeting);
        $marriage = str_replace(",", "", $request->marriage);
        $birth = str_replace(",", "", $request->birth);
        $consecration = str_replace(",", "", $request->consecration);
        $graduation = str_replace(",", "", $request->graduation);
        $death = str_replace(",", "", $request->death);
        $sick = str_replace(",", "", $request->sickness);
        $prevarrears = str_replace(",", "", $request->arreas_holder);
        if ($prevarrears - ($tot - ($absenteeism + $late_meeting + $marriage + $birth + $consecration + $graduation + $death + $sick)) > 1) {
            $currentarrears = $prevarrears - ($tot - ($absenteeism + $late_meeting + $marriage + $birth + $consecration + $graduation + $death + $sick));
        } else {
            $currentarrears = 0;
        }
            $monthly = $tot;
            $late_payment = $late_payment;

            $savinglogs = SavingLogs::create([
            "member" => $request->savingscate,
            "monthly_contr" => $tot,
            "late_payment" => $late_payment,
            "late_meeting" => $late_meeting,
            "absenteeism" => $absenteeism,
            "marriage" => $marriage,
            "birth" => $birth,
            "graduation" => $graduation,
            "consecration" => $consecration,
            "death" => $death,
            "sickness" => $sick,
            "arrears" => $currentarrears,
            "date" => $request->month
        ]);
        
        Session::flash('success', 'Saving Added successfully');
        return response()->json([
            "msg" => "Savings Stored Successfully"
        ]);
    }

 // insert fines at end of month
    public function insertFines() {
        return $thismonth = date("m");
        $lastyr = date("Y");
        $end =Carbon::now()->subMonth()->endOfMonth()->toDateString();
        $lastmonth = $thismonth-1;
        if ($thismonth=="01") {
            $lastmonth=12;
            $lastyr = $lastyr-1;
        }
        if (strlen($lastmonth)<2) {
            $lastmonth = "0".$lastmonth;
        }
         $deadline = $lastyr."-".$lastmonth."-10";
        $users = User::where('fwpnumber',"!=","NONE_TR")->where('fwpnumber',"!=","NONE_CP")->where("status","Activated")->get('id');
        foreach ($users as $user) {
            $id = $user->id;
            // Check if he paid
            $savings = SavingLogs::where("member", "=", $id)->whereMonth("date", $lastmonth)->whereYear("date", $lastyr)->orderBy('id',"desc")->first();
            $expected = $this->calculateexpected()-300000;
            $userarrears = $expected-$this->calculatedueamtnofines($id);
            if ($userarrears>0) {
                $late_payment = 0.15*$userarrears;
                $numrows = count($savings);
                if ($numrows>0) {
                    $pdate = $savings->date;
                }
                else{
                    $pdate = "";
                }
                if (($numrows<1) || ($pdate<$deadline)) {
                    $savinglogs = SavingLogs::create([
                    "member" => $id,
                    "monthly_contr" => 0,
                    "late_payment" => $late_payment,
                    "late_meeting" => 0,
                    "absenteeism" => 0,
                    "marriage" => 0,
                    "birth" => 0,
                    "graduation" => 0,
                    "approve" => 1,
                    "consecration" => 0,
                    "death" => 0,
                    "sickness" => 0,
                    "arrears" => $userarrears,
                    "date" => $end
                ]);
                $chksaving = Savings::where('user_id', $id)->count();

                    if ($chksaving < 1) {
                        $saving = Savings::create([
                            "user_id" => $id,
                            "total_monthly" =>0,
                            "total_social" => 0,
                            "total_fines" => 0,
                            "total_late_payment" => $late_payment,
                            "total_deposits" => 0
                        ]);
                    } else {
                        $saving = Savings::where('user_id', $id)->first();
                        $saving->total_late_payment = $saving->total_late_payment + $late_payment;
                        $saving->save();
                    }
                }
            }
        }
    }

    // insert arreas at beginning of month
    public function insertArrears() {
        $thismonth = date("Y-m")."-01";
        // check if already inserted
         $rows = SavingLogs::where('monthly_contr',0)->where('late_payment',0)->where('date',$thismonth)->count();
        if ($rows==0) {
            $users = User::where('fwpnumber',"!=","NONE_TR")->where('fwpnumber',"!=","NONE_CP")->where("status","Activated")->get('id');
            foreach ($users as $user) {
                $id = $user->id;
                $userarrears = $this->calculateexpected()-$this->calculatedueamount($id);
                // return $id." arreasws ".$userarrears;
                $insertArrear = SavingLogs::create([
                    "member" => $id,
                    "monthly_contr" => 0,
                    "late_payment" => 0,
                    "late_meeting" => 0,
                    "absenteeism" => 0,
                    "marriage" => 0,
                    "birth" => 0,
                    "graduation" => 0,
                    "consecration" => 0,
                    "death" => 0,
                    "sickness" => 0,
                    "arrears" => $userarrears,
                    'approve' =>1,
                    "date" => $thismonth
                ]);
            }
        }
    }

    public function edit($id, Request $request)
    {
        $this->validate($request, [
            "desc" => "required",
            "budget" => "required|numeric"

        ]);
        $inputs = $request->all();
        $user = User::findOrFail(Auth::user()->id);
        try {
            $user->expense()->where("id", "=", $id)->update([
                "desc" => $inputs['desc'],
                "budget" => $inputs['budget'],
            ]);
            return response()->json(["msg" => "Operation successfully"]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function delete_saving(Request $request)
    {
        $saving = SavingLogs::find($request->savings_id);
        $saving->delete();
        return redirect()->route('savings_approve');
    }


    public function fetchnamemodal(Request $request)
    {
        $inputs = $request->all();
        try {
            $mainuser = User::where("users.id", "=", $inputs['cate'])->pluck("name");
            $usernames = DB::table("users")
                ->where("users.id", "=", $inputs['cate'])
                ->select(
                    "users.name",
                    "users.userType",
                    "users.fwpnumber"
                )
                ->orderBy("created_at", "desc")->distinct()->get();
            return response()->json([
                "allusernames" => $usernames,
                "username" => $mainuser
            ]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function fetchmembername(Request $request)
    {
        $inputs = $request->all();
        try {
            $mainuser = User::where("users.id", "=", $inputs['savingscate'])->pluck("name");
            $usernames = DB::table("users")
                ->where("users.id", "=", $inputs['savingscate'])
                ->select(
                    "users.name",
                    "users.userType",
                    "users.fwpnumber"
                )
                ->get();
            return response()->json([
                "allusernames" => $usernames,
                "username" => $mainuser
            ]);
        } catch (QueryException $th) {
            throw $th;
        }
    }


    public function calculateexpected (){
        $cdate = date("Y-m-d");
            $to = Carbon::createFromFormat('Y-m-d', $cdate);
            $from = Carbon::createFromFormat('Y-m-d', '2018-04-01');
            $diff_in_months = $to->diffInMonths($from)+1;
            return $diff_in_months*300000;
    }

    public function calculatearrers($uid) {
        return $this->calculateexpected()-$this->calculatedueamount($uid);
    }

    // calculate due amount without late_payment fines
    public function calculatedueamtnofines($id){
        $memberSavings = Savings::where("user_id", $id)->first(); // gets the whole row
        if ($memberSavings) {
            $totalDeposits = $memberSavings->total_deposits;
            $totalFines = $memberSavings->total_fines;
            $totalSocial = $memberSavings->total_social;
        } else {
            $totalDeposits = 0;
            $totalFines = 0;
            $totalSocial = 0;
        }
         return $due_amount = intval($totalDeposits) - intval($totalFines) - intval($totalSocial);
    }

    public function fetchAreas(Request $request){
        $arrears = $this->calculateexpected()-$this->calculatedueamount($request->savingscate);
        return response()->json([
            "Arrears" => $arrears,
        ]);
    }

    public function checkPayments(Request $request)
    {
        // $date = Carbon::createFromFormat("d/m/Y", $request->date);
        $date = Carbon::createFromFormat('Y-m-d',   $request->date);
        // return $date->format("m");
        $status = SavingLogs::where("member", "=", $request->member)
            ->whereMonth("date", $date->month)
            ->whereYear("date", $date->year)
            ->whereDate('date','>',date("Y-m-10"))->get();
        if (count($status) > 0) {
            return response()->json([
                "status" => 1
            ]);
        } else {
            return response()->json([
                "status" => 0
            ]);
        }
    }
}