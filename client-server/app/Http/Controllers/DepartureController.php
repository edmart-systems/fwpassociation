<?php

namespace App\Http\Controllers;

use App\Departure;
use App\DepartureDecline;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\User;
use Session;

class DepartureController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        // Status
        // 0 = pending
        // 1 = recommended
        // 2 = approved
        // 3 = departed
        // 4 = declined
        // 5 = withdrawn
        $depature = Departure::with("user")->orderBy("created_at", "desc")->get();
        $requests =[];
        if (count($depature)) {
            foreach ($depature as $depart) {
                $row = [
                    "id" => $depart->id,
                    "name" => $depart->user->name,
                    "fwpnumber" => $depart->user->fwpnumber,
                    "reason" => $depart->reason,
                    "status" => $depart->status,
                    "payout" => $depart->payout_amount,
                    "dueAmount" => app('App\Http\Controllers\SavingsController')->calculatedueamount($depart->person),
                    "date" => $depart->created_at->diffForHumans(),
                ];
                array_push($requests, $row);
            }
        }
        return view('Loans.depature')->with(["requests" => $requests]);
    }
    
    public function details($id)
    {
        $user = User::find($id);
        $dueAmount = app('App\Http\Controllers\SavingsController')->calculatedueamount($id);
        return response()->json([
            "user" => $user,
            "dueAmount" => $dueAmount
        ]);
        return view('Loans.depature')->with(["members" => $members, "depature" => $depature]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $depart = Departure::create([
            'person' => $request->user_id,
            'payout_amount' => $request->payout,
            'reason' => $request->reason
        ]);
        Session::flash('success', 'Request has been sent successfully');
         // Send email to finance and chairperson
        $date1 = date("Y-m-d");
        $member = $request->user_id;
        $memberdet = User::find($member);
        $mname = $memberdet->name;
        $financedet = User::where("fwpnumber","NONE_TR")->first();
        $fname = $financedet->name;
        $femail = $financedet->email;
        $fphone = substr($financedet->phone1, -9);
        $chairdet = User::where("fwpnumber","NONE_CP")->first();
        $cname = $chairdet->name;
        $cemail = $chairdet->email;
        $cphone = substr($chairdet->phone1, -9);
        $membermsg =  "Dear ".$fname."\n".$mname." submitted in a request for departure clearance on ".$date1." with reason for departure being". $request->reason." \n Thank you";
        $membermsg1 = "Dear ".$cname."\n".$mname." submitted in a request for departure clearance on ".$date1." with reason for departure being". $request->reason." \n Thank you";

        // SEND SMSs
        $msg = "Friends With A Purpose\n\n".$mname."has submitted a request for departure";
        app('App\Http\Controllers\HomeController')->sendSms($fphone, $msg);
        app('App\Http\Controllers\HomeController')->sendSms($cphone, $msg);
        $subject = "FRIENDS WITH A PURPOSE (Departure Request)";
        $header = "From: member@fwpassociation.org";
        mail ($cemail,$subject,$membermsg1,$header);
        mail ($femail,$subject,$membermsg,$header);
        return redirect()->back();
    }


    public function recommend($id)
    {
        $departure = Departure::find($id);
        $departure->status = 1;
        $departure->save();
        Session::flash('success', 'Departure Request recommended successfully');
        return redirect()->back();
    }

    public function approve($id)
    {
        $departure = Departure::find($id);
        $requester = $departure->person;
        $user = User::find($requester);
        $user->status = "Deactivated";
        $user->save();
        $departure->status = 2;
        $departure->save();
        // Send email to finance
        $memberdet = User::find($requester);
        $mname = $memberdet->name;
        $phone = $memberdet->phone1;
        $financedet = User::where("fwpnumber","NONE_TR")->first();
        $cname = $financedet->name;
        $fphone = $financedet->phone1;
        $cemail = $financedet->email;
        $membermsg = "Dear ".$cname."\n The departure request for ".$mname." has been approved by the chairperson.\n Thank you";

        // Send SMS
        $fmsg = "Friends With A Purpose\n The departure request for ".$mname." has been approved by the chairperson";
        $msg = "Friends With A Purpose\n Your departure request has been approved by the chairperson";
        app('App\Http\Controllers\HomeController')->sendSms($fphone, $fmsg);
        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);

        $subject = "FRIENDS WITH A PURPOSE (Approved Departure Request)";
        $header = "From: chairman@fwpassociation.org";
        mail ($cemail,$subject,$membermsg,$header);
        Session::flash('success', 'Departure Request Approved successfully');
        return redirect()->back();
    }

    public function decline(Request $request)
    {
        $rid = $request->reqt;
        $row = Departure::find($rid);
        $requester = $row->person;
        $row->status = 4;
        $row->save();
        DepartureDecline::create([
            "rId" => $request->reqt,
            "requester" => $requester,
            "reason" => $request->message,
            "declined_by" => Auth()->user()->userType,
        ]);

        // Send email to finance
        $memberdet = User::find($requester);
        $mname = $memberdet->name;
        $phone = substr($memberdet->phone1, -9);
        $financedet = User::where("fwpnumber","NONE_TR")->first();
        $cname = $financedet->name;
        $cemail = $financedet->email;
        $fphone = substr($financedet->phone1, -9);
        $membermsg = "Dear ".$cname."\n the departure request for ".$mname." has been declined by the chairperson because ".$request->message.".\n Thank you";

        // Send SMS
        $fmsg = "Friends With A Purpose\n The departure request for ".$mname." has been declined by the chairperson";
        $msg = "Friends With A Purpose\n Your departure request has been declined by the chairperson";
        app('App\Http\Controllers\HomeController')->sendSms($fphone, $fmsg);
        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
        
        $subject = "FRIENDS WITH A PURPOSE (Declined Departure Request)";
        $header = "From: chairman@fwpassociation.org";
        mail ($cemail,$subject,$membermsg,$header);

        Session::flash('success', 'Departure Request declined successfully');
        return redirect()->back();

    }
    public function delete_declined($id)
    {
        $req = Departure::find($id);
        $declined_id = DepartureDecline::where('rId',$id)->first();
        $declined_id->delete();
        $req->delete();
        Session::flash('success', 'Request deleted successfully');
        return redirect()->back();

    }


     public function recommended()
    {
        $depature = Departure::with("user")->orderBy("created_at", "desc")->where('status',1)->get();
        $requests =[];
        if (count($depature)) {
            foreach ($depature as $depart) {
                $row = [
                    "id" => $depart->id,
                    "name" => $depart->user->name,
                    "fwpnumber" => $depart->user->fwpnumber,
                    "reason" => $depart->reason,
                    "status" => $depart->status,
                    "payout" => $depart->payout_amount,
                    "dueAmount" => app('App\Http\Controllers\SavingsController')->calculatedueamount($depart->person),
                    "date" => $depart->created_at->diffForHumans(),
                ];
                array_push($requests, $row);
            }
        }
        return view('Loans.recommended_depature')->with(["requests" => $requests]);
    }


     public function declined()
    {
        $depature = Departure::with("user")->orderBy("created_at", "desc")->where('status',4)->get();
        $requests =[];
        if (count($depature)) {
            foreach ($depature as $depart) {
                $id = $depart->id;
                $dec = DepartureDecline::where('rId', $id)->first();
                $row = [
                    "id" => $id,
                    "name" => $depart->user->name,
                    "fwpnumber" => $depart->user->fwpnumber,
                    "reason" => $dec->reason,
                    "declinedby" => $dec->declined_by,
                    "made" => $depart->created_at->diffForHumans(),
                    "declined" => $dec->created_at->diffForHumans(),
                ];
                array_push($requests, $row);
            }
        }
        return view('Loans.declined_depature')->with(["requests" => $requests]);
    }


     public function payout(Request $request)
    {
        $doc = $request->receipt;
        $rId = $request->reqt;
        $date = $request->date;
        $cheque = $request->cheque;
        $docnew = time().$doc->getClientOriginalName();
        $doc->move('cheques', $docnew);
        $departure = Departure::find($rId);
        $departure->status = 3;
        $departure->paid = str_replace(",", "", $request->amount);
        $departure->date = $request->date;
        $departure->cheque = $docnew;
        $departure->cheque_no =  $request->cheque;
        $departure->save();
        Session::flash('success', 'Member Paid Out successfully');
        return redirect()->back();
    }


       public function editpayout(Request $request)
    {
        $rId = $request->reqt;
        $date = $request->date;
        $cheque = $request->cheque;
        $departure = Departure::find($rId);
        $departure->paid = str_replace(",", "", $request->amount);
        $departure->date = $request->date;
        $departure->cheque_no =  $request->cheque;
        $departure->save();
        Session::flash('success', 'Member Pay Out updated successfully');
        return redirect()->back();
    }

       public function departed()
    {
        $depature = Departure::with("user")->orderBy("created_at", "desc")->where('status',3)->get();
        $requests =[];
        if (count($depature)) {
            foreach ($depature as $depart) {
                $row = [
                    "id" => $depart->id,
                    "uid" => $depart->person,
                    "name" => $depart->user->name,
                    "fwpnumber" => $depart->user->fwpnumber,
                    "reason" => $depart->reason,
                    "paid" => $depart->paid,
                    "payout" => $depart->payout_amount,
                    "date_paid" => $depart->date,
                    "cheque" => "cheques/".$depart->cheque,
                    "cheque_no" => $depart->cheque_no,
                ];
                array_push($requests, $row);
            }
        }
        return view('Loans.depated')->with(["requests" => $requests]);
    }
}