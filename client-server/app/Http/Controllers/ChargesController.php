<?php

namespace App\Http\Controllers;
use App\User;
use App\Charge;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Session;

class ChargesController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $charges = Charge::with('userd')->get();
        $myarr = [];
        if (count($charges)>0) {
            foreach ($charges as $charge) {
                $row = [
                    "id" => $charge->id,
                    "user" => $charge->user,
                    "name" => $charge->userd->name,
                    "fwpnumber" => $charge->userd->fwpnumber,
                    "amount" => $charge->amount,
                    "date" => $charge->date,
                    "date_added" => $charge->created_at->diffForHumans(),
                    "reason" => $charge->reason,
                ];
                array_push($myarr, $row);
            }
        }
        return view('savings.charges')->with("myarr",$myarr);
    }


    public function create(Request $request)
    {
        $this->validate($request, [
            "member" => "required",
            "amount" => "required",
            "date" => "required",
        ]);

        $charge = Charge::create([
            'user' => $request->member,
            'amount' => str_replace(",", "", $request->amount),
            'date' => $request->date,
            'reason' => $request->reason
        ]);
        // Send email to member
        $member = $request->member;
        $memberdet = User::find($member);
        $mname = $memberdet->name;
        $memail = $memberdet->email;
        $phone = substr($memberdet->phone1, -9);
        $membermsg = "Dear ".$mname."\n A charge of ".$request->amount." was deducted from your savings being payment for ".$request->reason."\n Thank you for saving with Friends with a purpose";
        $msg = "Friends with a Purpose\nDear ".$mname."\n A charge of ".$request->amount." was deducted from your savings being payment for ".$request->reason;

        // SEND SMS
        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
        
        $subject = "FRIENDS WITH A PURPOSE (Charge)";
        $header = "From: finance@fwpassociation.org";
        mail ($memail,$subject,$membermsg,$header);

        Session::flash('success', 'Charge Added successfully');
        return redirect()->back();

    }

    public function update(Request $request)
    {
       $this->validate($request, [
            "member" => "required",
            "amount" => "required",
            "date" => "required",
        ]);

       $id = $request->id;
       $thischarge = Charge::where("id",$id)->first();
       $thischarge->user = $request->member;
       $thischarge->amount = str_replace(",", "", $request->amount);
       $thischarge->date = $request->date;
       $thischarge->reason = $request->reason;
       $thischarge->save();
       Session::flash('success', 'Charge Details Updated successfully');
        return redirect()->back();
    }


    public function destroy(Request $request)
    {
        $id = $request->charge_id;
        $charge = Charge::find($id);
        $charge->delete();
        Session::flash('success', 'Charge has been deleted successfully');
        return redirect()->back();
    }
}
