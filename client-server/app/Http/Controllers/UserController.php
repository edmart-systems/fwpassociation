<?php

namespace App\Http\Controllers;

use App\Biodata;
use App\User;
use App\SavingLogs;
use Illuminate\Support\Facades\File;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Session;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    // public function passwords(){
    //     User::where("id", "=", 2)->update([
    //                 "password" => Hash::make("password")
    //             ]);
    //             return("updated");
    // }

    public function index(){
        //check if the user is not admin
        if(Auth()->user()->userType == 'chairman' || Auth()->user()->userType == 'treasurer'){
            return view('auth.profile');
        }else{
            $id = Auth::user()->id;
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

            return view('auth.profile')->with([
                'totalfin' => $totalfines,
                'totalsoc' => $totalSocial,
                'totaldep' => $tdeposits,
                'due_amount' => app('App\Http\Controllers\SavingsController')->calculatedueamount($id)-app('App\Http\Controllers\LoansController')->unpaidloan($id),
                'arrears' => app('App\Http\Controllers\SavingsController')->calculatearrers($id),
                'expected' => app('App\Http\Controllers\SavingsController')->calculateexpected(),
                'runningloan' => app('App\Http\Controllers\LoansController')->currentloan($id),
                'unpaidloan' => app('App\Http\Controllers\LoansController')->unpaidloan($id),
                'totalLoans' => intval(app('App\Http\Controllers\LoansController')->currentloan($id))+intval(app('App\Http\Controllers\LoansController')->unpaidloan($id))
            ]);
        }
    }
    public function pendingBiodata(){
        $users = Biodata::where('status',0)->with('user')->get();
        return view("pending_biodata")->with('users',$users);
    }
    public function approveBio(Request $request){
        $record = Biodata::find($request->id);
        $record->status = 1;
        $record->save();
        $mdet = User::where('id',$record->user_id)->first();
        $email = $mdet->email;
        $membermsg = "Dear ".$mdet->name."\n Your Bio data has been approved and below is the summary of the details approved\n";
        $membermsg.= "Address: ".$record->address." \n";
        $membermsg.= "Occupation: ".$record->occupation." \n";
        $membermsg.= "NIN Number: ".$record->nin." \n";
        $membermsg.= "Nationality: ".$record->nationality." \n";
        $membermsg.= "Date Of Birth: ".$record->dob." \n";
        $membermsg.= "Marital Status: ".$record->marital." \n";
        $membermsg.= "Spouse: ".$record->spouse." \n";
        $membermsg.= "Children: ".$record->children." \n";
        $membermsg.= "Father: ".$record->father." \n";
        $membermsg.= "Mother: ".$record->mother." \n";
        $membermsg.= "Next Of Kin Name: ".$record->nextofkin." \n";
        $membermsg.= "Next Of Kin Contact: ".$record->nxtcont." \n";
        $membermsg.= "Next Of Kin Address: ".$record->nextofkinaddress." \n";
        $membermsg.= "Relationship with Next Of Kin: ".$record->relationship." \n Login to the system for more details.\n Thank you";

        $subject = "FRIENDS WITH A PURPOSE (Bio Data Approval)";
        $header = "From: general.secretary@fwpassociation.org";
        mail ($email,$subject,$membermsg,$header);
        $phone = substr($mdet->phone1, -9);
        $msg = "Dear ".$mdet->name."\n The General Secretary has approved your Bio Data Details. \n Login to the system for more details. Thank you for saving with Friends with a Purpose.";
        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
        return redirect()->back();
    }
    public function editBiodataRequests(){
        $users = Biodata::where('status',2)->with('user')->get();
        return view("biodata_edit_requests")->with('users', $users);
    }
    public function biodata(){
        $user = User::where('id',Auth::user()->id)->with('bio')->first();
        return view("auth.biodata")->with('bio', $user);
    }
    public function edit_bio_data($id){
        $user = User::where('id', $id)->with('bio')->first();
        return view("auth.edit_bio_data")->with('bio', $user);
    }
    public function bioEditReq(Request $request){
        $record = Biodata::find($request->id);
        $record->status = 2;
        $record->save();
        $mdet = User::where('id', $record->user_id)->first();
        $destinationDet = User::where('fwpnumber','NONE_GS')->first();
        $email = $destinationDet->email;
        $membermsg = "Dear ".$destinationDet->name."\n";
        $membermsg .= $request->mesage."\n";
        $membermsg.= "\nThank you";

        $subject = "FRIENDS WITH A PURPOSE (Bio Data Editing for ".$mdet->name.")";
        $header = $mdet->email;
        mail ($email,$subject,$membermsg,$header);
        $phone = substr($destinationDet->phone1, -9);
        $msg = "Dear ".$destinationDet->name.", \n".$mdet->name." has requested for Bio Data Editing. \n Checkout your email for details and Login to the system.\n Thank you.";
        app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
        return response()->json(["msg" => "Email Request Sent For Editing"]);
    }
    public function biodata1($id){
        $user = User::where('id',$id)->with('bio')->first();
        return view("bio")->with('bio', $user);
    }
    public function saveBio(Request $request){
        $check = Biodata::where('user_id', $request->uid)->first();
        if($check){
            $check->nationality = $request->nationality;
            $check->occupation = $request->occupation;
            $check->dob = $request->dob;
            $check->children = $request->children;
            $check->relationship = $request->relationship;
            $check->father = $request->father;
            $check->mother = $request->mother;
            if($request->marital=="Married"){
                $check->spouse = $request->spouse;
            }
            else{
                $check->spouse = $request->marital;
            }
           
            $check->passport = $request->passport;
            $check->marital = $request->marital;
            $check->nin = $request->nin;
            $check->status = 1;
            $check->address = $request->address;
            $check->nextofkin = $request->nxtofkin;
            $check->nextofkinaddress = $request->nxtaddress;
            $check->nxtcont = $request->nextcont;
            $check->nxtnin = $request->nxtnin;
            $check->nxtemail = $request->nextemail;
            $check->save();
            $mdet = User::find($request->uid);
            $destinationDet = User::where('fwpnumber','NONE_GS')->first();
            $email = $mdet->email;
            $membermsg = "Dear ".$mdet->name.",\n Your Bio Data details have been edited successfully, Below are the new Details;\n";
            $membermsg.= "Address: ".$request->address." \n";
            $membermsg.= "Occupation: ".$request->occupation." \n";
            $membermsg.= "NIN Number: ".$request->nin." \n";
            $membermsg.= "Nationality: ".$request->nationality." \n";
            $membermsg.= "Date Of Birth: ".$request->dob." \n";
            $membermsg.= "Marital Status: ".$request->marital." \n";
            $membermsg.= "Spouse: ".$request->spouse." \n";
            $membermsg.= "Children: ".$request->children." \n";
            $membermsg.= "Father: ".$request->father." \n";
            $membermsg.= "Mother: ".$request->mother." \n";
            $membermsg.= "Next Of Kin Name: ".$request->nxtofkin." \n";
            $membermsg.= "Next Of Kin Contact: ".$request->nextcont." \n";
            $membermsg.= "Next Of Kin Address: ".$request->nxtaddress." \n";
            $membermsg.= "Next Of Kin Email: ".$request->nextemail." \n";
            $membermsg.= "Next Of Kin NIN: ".$request->nxtnin." \n";
            $membermsg.= "Relationship with Next Of Kin: ".$request->relationship;
            $membermsg.= "\n Thank you";

            $subject = "FRIENDS WITH A PURPOSE (Bio Data Edited)";
            $header = "From: general.secretary@fwpassociation.org";
            mail ($email,$subject,$membermsg,$header);
            $phone = substr($mdet->phone1, -9);
            $msg = "Dear ".$mdet->name.", \nYour Bio Data been Updated successfully. \nCheckout your email for details and Login to the system.\n Thank you.";
            app('App\Http\Controllers\HomeController')->sendSms($phone, $msg);
        } else {
            if($request->marital=="Married"){
                $spouse = $request->spouse;
            }
            else{
                $spouse = $request->marital;
            }
            Biodata::create([
                'user_id' => Auth::user()->id,
                'nationality' => $request->nationality,
                'address' => $request->address,
                'children' => $request->children,
                'father' => $request->father,
                'mother' => $request->mother,
                'dob' => $request->dob,
                'marital' => $request->marital,
                'spouse' => $spouse,
                'occupation' => $request->occupation,
                'passport' => $request->passport,
                'relationship' => $request->relationship,
                'nin' => $request->nin,
                'nextofkinaddress' => $request->nxtaddress,
                'nextofkin' => $request->nxtofkin,
                'nxtnin' => $request->nxtnin,
                'nxtemail' => $request->nextemail,
                'nxtcont' => $request->nextcont,
            ]);
            User::find(Auth::user()->id)->update([
                "status" => 'Activated'
            ]);
        }
        return redirect()->back();
    }
    public function members(){
        $users = User::where("status", "!=", "departed")->get();
        return view('members')->with("users", $users);
    }

    public function edit(Request $request)
    {
        $this->validate($request, [
            'name' => ['required', 'string', 'max:255'],
            'fwpnumber' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            "image" => "image|max:2000|mimes:jpeg,png,jpg",
        ]);
        $inputs = $request->all();
        if ($request->file("image")) {
            $file = $request->file("image");
            $nameWithExt = $file->getClientOriginalName();
            $name = pathinfo($nameWithExt, PATHINFO_FILENAME);
            $extension = $file->getClientOriginalExtension();
            $saveName = $name . "_" . time() . "." . $extension;
            $file->move("profiles", $saveName);
            $inputs["image"] = $saveName;

            try {
                if(Auth::user()->image !== "default.jpg"){
                    File::delete('profiles/' . Auth::user()->image);
                }
                User::where("id", "=", Auth::user()->id)->update([
                    "name" => $request->name,
                    "fwpnumber" => $request->fwpnumber,
                    "email" => $request->email,
                    "phone1" => $request->phone1,
                    "phone2" => $request->phone2,
                    "password" => Hash::make($request->password),
                    "image" => $saveName
                ]);
                return redirect()->back();
            } catch (QueryException $th) {
                throw $th;
            }
        } else {
            try {
                User::where("id", "=", Auth::user()->id)->update([
                    "name" => $request->name,
                    "fwpnumber" => $request->fwpnumber,
                    "email" => $request->email,
                    "phone1" => $request->phone1,
                    "phone2" => $request->phone2,
                    "password" => Hash::make($request->password),
                ]);
                Session::flash('success', 'Profile Updated successfully');
                return redirect()->back();
            } catch (QueryException $th) {
                throw $th;
            }
        }
    }

    public function status(Request $request){
        $inputs=$request->all();
        try {
                User::where("id", "=", $inputs['id'])->update([
                    "status" => $inputs["action"]
                ]);
                return response()->json(["msg" => "Request Was Successfully"]);
            } catch (QueryException $th) {
                throw $th;
            }
    }
    // public function userstatus(Request $request){

    //     $inputs=$request->all();
    //     $user = User::findOrFail(Auth::user()->id);
        
    //     try {
    //         $userId = $user->User()->update([
    //                 "status" => "Activated"
    //             ])->id;
    //     }catch (QueryException $th) {
    //         throw $th;
    //     }
    // }
    public function resetPassword(Request $request){
        $inputs = $request->all();
        try {
            User::where("id", "=", $inputs['id'])->update([
                "password" => Hash::make("password")
            ]);
            return response()->json(["msg" => "Request Was Successfully"]);
        } catch (QueryException $th) {
            throw $th;
        }
    }
}