<?php

namespace App\Http\Controllers;

use App\Expenses;
use App\User;
use App\Savings;
use App\Loans;
use Facade\Ignition\QueryRecorder\Query;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;

class ExpensesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('welcome');
    }
   
    public function allExpenses()
    {
        if(Auth::user()->userType == "Member"){
            $expenses = Expenses::where(['status' => 'approved', 'user_id' => Auth::user()->id])->with('user')->get();
        } else {
            $expenses = Expenses::where('status', 'approved')->with('user')->get();
        }
        return view("expenses.index")->with('expenses', $expenses);
    }

    public function fetchAll(Request $request){
        $inputs = $request->all();
        try {
            $monthTotal = Expenses::where("created_at", "LIKE", $inputs['date']."-%")
                    ->where("status", "=", "approved")->sum('budget');
            $yearTotal = Expenses::where("created_at", "LIKE", explode("-", $inputs['date'])[0] . "-%")
                ->where("status", "=", "approved")->sum('budget');
            $expenses = DB::table("expenses")
            ->where("expenses.created_at", "LIKE", "{$inputs['date']}%")
            ->join("users", "expenses.user_id", "=", "users.id")
            ->where("expenses.status", "=", "approved")
            ->select(
                "expenses.id",
                "expenses.desc",
                "expenses.created_at",
                "expenses.budget",
                "expenses.status",
                "expenses.user_id",
                "users.name",
                "users.userType"
            )
                ->orderBy("created_at", "desc")->get();
            return response()->json([
                "expenses" => $expenses,
                "totalYear" => $yearTotal,
                "totalMonth" => $monthTotal
                ]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function pending()
    {
        $expenses = Expenses::where('status', 'pending')->with('user')->get();
        return view("expenses.pending")->with('expenses', $expenses);
    }

    public function fetchPending(Request $request)
    {
        $inputs = $request->all();
        try {
            $expenses = DB::table("expenses")
            ->where("expenses.created_at", "LIKE", "{$inputs['date']}-%")
            ->where("expenses.status", "=", "pending")
                ->join("users", "expenses.user_id", "=", "users.id")
                ->select(
                    "expenses.id",
                    "expenses.desc",
                    "expenses.created_at",
                    "expenses.budget",
                    "expenses.status",
                    "expenses.user_id",
                    "expenses.reason",
                    "users.name",
                    "users.userType"
                )
                ->orderBy("created_at", "desc")->get();
            return response()->json($expenses);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function recommended()
    {
        $expenses = Expenses::where('status', 'recommended')->with('user')->get();
        return view("expenses.recommend")->with('expenses', $expenses);
    }

    public function declined()
    {
        $expenses = Expenses::where('status', 'declined')->with('user')->get();
        return view("expenses.declined")->with('expenses', $expenses);
    }

    public function fertchReco(Request $request)
    {
        $inputs = $request->all();
        try {
            $expenses = DB::table("expenses")
            ->where("expenses.created_at", "LIKE", "{$inputs['date']}-%")
            ->where("expenses.status", "=", "recommend")
            ->join("users", "expenses.user_id", "=", "users.id")
            ->select(
                "expenses.id",
                "expenses.desc",
                "expenses.created_at",
                "expenses.budget",
                "expenses.status",
                "expenses.user_id",
                "expenses.reason",
                "users.name",
                "users.userType"
            )
                ->orderBy("created_at", "desc")->get();
            return response()->json($expenses);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function fetch(Request $request)
    {
        $inputs = $request->all();
        try {
            $expenses = DB::table("expenses")
                ->where("expenses.created_at", "LIKE", "{$inputs['date']}-%")
                ->where("user_id", "=", Auth::user()->id)
                ->join("users", "expenses.user_id", "=", "users.id")
                ->select(
                    "expenses.id",
                    "expenses.desc",
                    "expenses.created_at",
                    "expenses.budget",
                    "expenses.status",
                    "expenses.reason",
                    "expenses.user_id",
                    "users.name",
                    "users.userType"
                )
                ->orderBy("created_at", "desc")->get();
            return response()->json($expenses);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function create(Request $request)
    {
        $this->validate($request, [
            "desc" => "required",
            "budget" => "required"
           
        ]);
        $budget = str_replace(",", "", $request->budget);
        $user = User::findOrFail(Auth::user()->id);
        $inputs = $request->all();
        try {
            $user->expense()->save(
                new Expenses([
                    "desc" => $inputs["desc"],
                    "budget" => $budget,
                    "status" => "pending",
                    "reason" => "not cancelled"
                ])
            );
            return response()->json([
                "msg" => "Expense Saved Successfully"
            ]);
        } catch (QueryException $th) {
            throw $th;
        }
    }
    public function edit($id, Request $request)
    {
        $this->validate($request, [
            "desc" => "required",
            "budget" => "required"
           
        ]);
        $budget = str_replace(",", "", $request->budget);
        $inputs = $request->all();
        $user = User::findOrFail(Auth::user()->id);
        try {
            $user->expense()->where("id", "=", $id)->update([
                "desc" => $inputs['desc'],
                "budget" => $budget,
            ]);
            return response()->json(["msg" => "Operation successfully"]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function destroy(Request $request)
    {
        $inputs = $request->all();
        $user = User::findOrFail(Auth::user()->id);
        try {
            $user->expense()->where("id", "=", $inputs['id'])->delete();
            return response()->json(["msg"=> "Deleted Successfully"]);
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function action(Request $request)
    {
        $inputs = $request->all();
        try {
            Expenses::where("id", "=", $inputs['id'])->update([
                "status" => $inputs['action'],
                "reason" => $inputs['reason']
            ]);
            return redirect()->back();
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function retrievePdf(Request $request){
        
        $inputs = $request->all();
        $startDate = $inputs["month1"];
        $endDate = $inputs["month2"];
        
        try {
            $yearTotal = Expenses::whereBetween("created_at", [ $startDate, $endDate])
                ->where("status", "=", "approved")->sum('budget');
            $expenses = DB::table("expenses")
                        ->whereBetween("expenses.created_at", [$startDate, $endDate])
                        ->where("expenses.status", "=", "approved")
                        ->join("users", "expenses.user_id", "=", "users.id")
                        ->select(
                            "expenses.id",
                            "expenses.desc",
                            "expenses.created_at",
                            "expenses.budget",
                            "expenses.status",
                            "expenses.user_id",
                            "users.name",
                            "users.userType"
                        )->orderBy("created_at", "desc")->get();
                        $pdf = PDF::loadView(
                            "expenses.expensesPdf",
                            [
                                "collection" =>  $expenses,
                                "yearTotal" => $yearTotal,
                                "year1" => $inputs['month1'],
                                "year2" => $inputs['month2']
                            ]
                        );
                        return $pdf->stream('fwpassociation-expenses.pdf');
        } catch (QueryException $th) {
            throw $th;
        }
    }

    public function values(Request $request){

        
        $inputs = $request->all();

        $user = User::findOrFail(Auth::user()->id);
        $runningloan = DB::table("loans")->where("user_id", "=", Auth::user()->id)->where("loans.status", "=", "approved")->value("loanamount");
        $total_amount = DB::table("savings")->where("name_id", "=", Auth::user()->id)->sum("total_amount");

        try {
            return response()->json([
                "loans" => $runningloan,
                "total_amount" => $total_amount
            ]);
        } catch (QueryException $th) {
            throw $th;
        }
    }
}