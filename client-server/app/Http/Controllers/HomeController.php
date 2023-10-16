<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Loans;
use App\Savings;
use App\SavingLogs;
use App\Expenses;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
            // Fines
            $late_payment1= SavingLogs::where("member", "=", Auth::user()->id)->where('approve',1)->sum("late_payment");
            $late_meeting1 = SavingLogs::where("member", "=", Auth::user()->id)->where('approve',1)->sum("late_meeting");
            $absenteeism1 = SavingLogs::where("member", "=", Auth::user()->id)->where('approve',1)->sum("absenteeism");
            $totfine1 = $late_meeting1+$late_payment1+$absenteeism1;

            $totfine = 0;
            $social = 0;
            $mariage = 0;
            $birth = 0;
            $death = 0;
            $graduation = 0;
            $sickness = 0;
            $concecration = 0;
            $deposits = 0;
            $late_meeting = 0;
            $late_payment = 0;
            $absenteeism = 0;
            $tot=0;
            $users = User::where('status', 'Activated')->get();
            foreach ($users as $user) {
                $id = $user->id;
                $mariage = $mariage+SavingLogs::where('approve',1)->where("member", "=", $id)->sum("marriage");
                $birth = $birth+SavingLogs::where('approve',1)->where("member", "=", $id)->sum("birth");
                $sickness = $sickness+SavingLogs::where('approve',1)->where("member", "=", $id)->sum("sickness");
                $graduation = $graduation+SavingLogs::where('approve',1)->where("member", "=", $id)->sum("graduation");
                $concecration = $concecration+SavingLogs::where('approve',1)->where("member", "=", $id)->sum("consecration");
                $death = $death+SavingLogs::where('approve',1)->where("member", "=", $id)->sum("death");
                $social = $mariage+$birth+$sickness+$graduation+$concecration+$death;
                $deposits = $deposits+SavingLogs::where('member',$id)->where('approve',1)->sum("monthly_contr");
                $late_payment = $late_payment+SavingLogs::where('approve',1)->where('member',$id)->sum("late_payment");
                $late_meeting = $late_meeting+SavingLogs::where('approve',1)->where('member',$id)->sum("late_meeting");
                $absenteeism = $absenteeism+SavingLogs::where('approve',1)->where('member',$id)->sum("absenteeism");
                $totfine =  $late_meeting+$late_payment+$absenteeism;
            }
            
            $mariage1 = SavingLogs::where('approve',1)->where("member", "=", Auth::user()->id)->sum("marriage");
            $birth1 = SavingLogs::where('approve',1)->where("member", "=", Auth::user()->id)->sum("birth");
            $sickness1 = SavingLogs::where('approve',1)->where("member", "=", Auth::user()->id)->sum("sickness");
            $graduation1 = SavingLogs::where('approve',1)->where("member", "=", Auth::user()->id)->sum("graduation");
            $concecration1 = SavingLogs::where('approve',1)->where("member", "=", Auth::user()->id)->sum("consecration");
            $death1 = SavingLogs::where('approve',1)->where("member", "=", Auth::user()->id)->sum("death");
            $social1 = $mariage1+$birth1+$sickness1+$graduation1+$concecration1+$death1;
            $deposits1 = SavingLogs::where('member',Auth::user()->id)->where('approve',1)->sum("monthly_contr");

            $expectedsavings = app('App\Http\Controllers\SavingsController')->calculateexpected();
            $runningloan = Loans::where("status", "=", "running")->get()->count();
            $cleared = Loans::where("status", "=", "cleared")->sum("return");
        	$expectedreturn = Loans::where("status", "=", "running")->sum("return");
            $expectedloansdue = Loans::where("status", "=", "running")->sum("reducing_balance");
            
            $runningloan1 = Loans::where("user_id", "=", Auth::user()->id)->where("status", "=", "running")->get()->count();
            $cleared1 = Loans::where("user_id", "=", Auth::user()->id)->where("status", "=", "cleared")->sum("return");
            $expectedreturn1 = Loans::where("user_id", "=", Auth::user()->id)->where("status", "=", "running")->sum("return");
            $expectedloansdue1 = Loans::where("user_id", "=", Auth::user()->id)->where("status", "=", "running")->sum("reducing_balance");

            //total expenses
            $totalExpenses = Expenses::where("status", "=", "approved")->sum("budget");

            //calculating due amount
            $due_amount = "no amount";
            if(Auth::user()->status == "Activated"){
                $due_amount = app('App\Http\Controllers\SavingsController')->calculatedueamount(Auth::user()->id);
            }

        	$data = [
                "running_loan" => $runningloan,
                "user"=> Auth::user()->id,
                "cleared" => $cleared,
                "expected_return" => $expectedreturn,
                "expectedloansdue" => $expectedloansdue,
                "expectedloansdue1" => $expectedloansdue1,
                "birth" => $birth,
                "social" => $social,
                "death" => $death,
                "savings" => $deposits,
                "sickness" => $sickness,
                "late_meeting" => $late_meeting,
                "late_payment" => $late_payment,
                "absenteeism" => $absenteeism,
                "totfine" => $totfine,
                "mariage" => $mariage,
                "running_loan1" => $runningloan1,
                "cleared1" => $cleared1,
                "expected_return1" => $expectedreturn1,
                "birth1" => $birth1,
                "social1" => $social1,
                "death1" => $death1,
                "savings1" => $deposits1,
                "sickness1" => $sickness1,
                "late_meeting1" => $late_meeting1,
                "late_payment1" => $late_payment1,
                "absenteeism1" => $absenteeism1,
                "totfine1" => $totfine1,
                "mariage1" => $mariage1,
                "expectedsavings" =>$expectedsavings,
                "totalExpenses" => $totalExpenses,
                "due_amount" => $due_amount
            ];
        return view('dashboard')->with("data", $data);
    }

    public function check()
    {
        return true;
    }

    public function sendSms($contact, $message)
    {
        // test+sms+monitor+\n+testing
        $data = array(
            "username" => "256773410155",
            "from" => "Friends with a Purpose",
            "recipients" => "256".$contact,
            "message"=>$message,
            "password"=>"V1zWUUfC",
            "type"=>"normal",
            "txid" => substr(md5(time()), 0, 30)
        );
        $url = "https://smsdual.info/bulksms-api.php";
        // $data = http_build_query ($data);
        // Send the POST request with cURL
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch);
        curl_close($ch);
        echo $result;
    }

    public function testSMS() {
        $this->sendSms("706263042", "Friends+With+aPurpose\r. Your Saving of has been received\r Thank you for saving with FWP.");
        return "sent";
    }
}