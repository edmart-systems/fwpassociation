<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\checkUserTre;
use App\Http\Middleware\checkUser;
use App\Http\Middleware\CheckStatus;
use App\Http\Middleware\PreventBackHistory;
use Illuminate\Support\Facades\Auth;
use App\User;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect("/login");
});


Route::get("/check", "HomeController@check")->name("checking");
Route::middleware([PreventBackHistory::class])->group(function () {
    Auth::routes();
        //routes for higher administrators
        Route::middleware(['higherAdmin'])->group(function () {
            Route::get("/members/depature", "DepartureController@index")->name("membersDeparture");
            Route::get("/recommended/depature/requests", "DepartureController@recommended")->name("recommended_departures");
            Route::get("/declined/depature/requests", "DepartureController@declined")->name("declined_departures");
            Route::get("/loans/runingdetails/{id}", "LoansController@runingDetails")->name("loansRuningDetails");
            Route::get("/savings_approve", "SavingsController@savingToApprove")->name("savings_approve");
            Route::get("/loans/allLoans", "LoansController@allLoans")->name("allLoans");
            Route::get("/loans/cleared", "LoansController@cleared")->name("ClearedLoans");
            Route::get("/expenses/declined", "ExpensesController@declined")->name("declined");
            Route::post("/loans/fetchactions", "LoansController@loanaction")->name("LoanAction");
        });

        //routes for finance
        Route::middleware(['treasurer'])->group(function () {
            Route::get("/recommend/departure/{id}", "DepartureController@recommend")->name("recommend_depart");
            Route::get("/delete/declined/departure/{id}", "DepartureController@delete_declined")->name("delete_declined");
            Route::post("/payout/departure", "DepartureController@payout")->name("payout");
            Route::post("/edit/departure/payout", "DepartureController@editpayout")->name("editpayout");
            Route::get("/depart/details", "SavingsController@details")->name("savings");
            Route::post("/savings/update", "SavingsController@update_savings")->name("update_saving");
            Route::post("/savings/create", "SavingsController@create")->name("createSavings");
            Route::get("/rejected_savings", "SavingsController@savingRejected")->name("rejected_savings");
            Route::post("/editSaving", "SavingsController@editSaving")->name("editSaving");
            Route::post("/savings/delete", "SavingsController@delete_saving")->name("delete_savings");
            Route::get("/loans/payment/{id}", "LoansController@loansRepayment")->name("loansRepayment");
            Route::get("/loans/pending", "LoansController@pending")->name("pendingloan");
            Route::get("/loans/finance/recommend", "LoansController@financerecommend");
            Route::get("/expenses/pending", "ExpensesController@pending")->name("pending");
            Route::post("/expenses/fetch/pending", "ExpensesController@fetchPending")->name("fetchPending");
            Route::get("/loans/approved", "LoansController@approvedLoans")->name("approvedLoans");
            Route::post("/loans/fetch/pendingloan", "LoansController@fetchpending")->name("fetchpending");
            Route::post("loans/disburse", "DisburseController@disburse")->name("disburseLoan");
        });

        //routes for chairperson
        Route::middleware(['chairman'])->group(function () {
            Route::get("/approve/departure/{id}", "DepartureController@approve")->name("approve_depart");
            Route::get("/approveSaving/{id}", "SavingsController@approveSaving")->name("approveSaving");
            Route::post("/declineSaving", "SavingsController@declineSaving")->name("declineSaving");
            Route::get("/loans/recommend", "LoansController@recommend")->name("recommendedloan");
            Route::post("/loans/admin/decline", "LoansController@admindecline")->name("admindecline");
            Route::post("/loans/fetchRecoLoan", "LoansController@fetchRecoLoan")->name("fetchRecommendedLoan");
            Route::post("/expenses/fetchReco", "ExpensesController@fertchReco")->name("fetchRecommended");
            Route::get("/expenses/recommended", "ExpensesController@recommended")->name("recommended");
            Route::post("/decline/departure", "DepartureController@decline")->name("declinedepart");
            Route::post("/status/actions", "UserController@status")->name("status");
        });
        Route::get("/bio", "UserController@biodata")->name('biodata');
        Route::get("/bio/{id}", "UserController@biodata1")->name('biodata1');
        Route::get("/biodata/{id}", "UserController@edit_bio_data")->name('editBioData');
        Route::post("/biodata/requestedit", "UserController@bioEditReq")->name('editBioData');
        Route::post("/edit/biodata", "UserController@saveBio")->name("editBio");
        Route::get("/pending/biodata", "UserController@pendingBiodata")->name("pendingBio");
        Route::get("/edit/biodata/requests", "UserController@editBiodataRequests")->name("editBioRequest");
        Route::post("/approve/biodata", "UserController@approveBio")->name("approveBio");
        //routes for higher administrators
        Route::middleware([CheckStatus::class])->group(function () {
            //free/members routes
            Route::get("/smstest", "HomeController@testSMS")->name("home");
            Route::get("/home", "HomeController@index")->name("home");
            Route::post("/reset", "UserController@resetPassword")->name("reset");
            Route::get("/profile", "UserController@index")->name('profile');
            Route::post("/edit/profile", "UserController@edit")->name("editUser");
            Route::get("/members", "UserController@members")->name("members");
            Route::get("/departed/members", "DepartureController@departed")->name("departed");
            Route::post("/user/depart", "DepartureController@create")->name("departRequest");
            Route::get("/savings", "SavingsController@index")->name("savings");
            Route::get("/allsavingsprint", "SavingsController@allsavingsprint")->name("allsavingsprint");
            Route::get("/Allsavings", "SavingsController@AllSavings")->name("AllSavings");
            Route::get("/charges", "ChargesController@index")->name('charges');
            Route::get("/loans", "LoansController@index")->name("loans");
            Route::get("/allExpenses", "ExpensesController@allExpenses")->name("allExpenses");
            Route::post("/expense", "ExpensesController@create")->name("createExpense");
            Route::post("/expenses/edit/{id}", "ExpensesController@edit")->name("editExpenses");
            Route::post("/expenses/delete", "ExpensesController@destroy")->name("deleteExpense");
            Route::post("/pdf/data", "ExpensesController@retrievePdf")->name("pdf");
            Route::post("/guarantor/approve", "LoansController@guarantorapprove")->name("guarantorapprove");
            Route::post("/guarantor/decline", "LoansController@guarantordecline")->name("declineLoan");
            Route::get("/loans/fetchguarantors", "LoansController@fetchguarantors");
            Route::post("/loans/withdraw/confirmed", "LoansController@withdraw")->name("withdrawLoan");
            Route::post("/loans/requestClearance", "LoansController@requestClearance")->name("requestClearance");
            Route::post("/loans/delete/confirmed", "LoansController@destroy")->name("deleteLoan");
            Route::post("/details/loans", "LoansController@loadDetails");
            Route::post("/filter/allsavings", "SavingsController@fiter_all_avings")->name("fiter_all_avings");
            Route::post("/savings/fetch", "SavingsController@fetch")->name("fetchSavings");
            Route::get("/savings/view", "SavingsController@index")->name("view_savings");
            Route::get("/savings_profile/{id}", "SavingsController@savingDetails")->name("savings_profile");
            Route::get("/savings/print/{id}", "SavingsController@savingDetailsPrint")->name("indsavingsprint");
            Route::post("/savings_profilex", "SavingsController@filter_individial_savings")->name("filter_individial_savings");
            Route::post("/fetchareas", "SavingsController@fetchAreas");
            Route::get("/insertArrears", "SavingsController@insertArrears")->name('insertArrears');
            Route::get("/insertFines", "Auth\LoginController@insertFines")->name('insertFines');
            Route::post("/check/payment", "SavingsController@checkPayments");
            // Charges
            Route::post("/add/charge", "ChargesController@create")->name('new_charge');
            Route::post("/edit/charge", "ChargesController@update")->name('update_charge');
            Route::post("/delete/charge", "ChargesController@destroy")->name('delete_charge');
            Route::post("/savings/fetcharears", "SavingsController@fetchAreas");
            Route::post("/pdf/datasaving", "SavingsController@retrievePdf")->name("pdfsaving");
            Route::get("/tempguarantor/fetch", "GuarantertempController@index");
            Route::post("/edit/guarantor", "GuarantertempController@update");
            Route::post("/create/guarantor", "GuarantertempController@store");
            Route::post("/guarantor/delete", "GuarantertempController@destroy");
            Route::get("/loans/details/{id}", "LoansController@details")->name("loansDetails");
            Route::post("/loans/fetchnameloanmodal", "SavingsController@fetchnameloanmodal");
            Route::post("/fetch/totalamountdue", "LoansController@fetchamount");
            Route::get("/fetch/arrears", "LoansController@getarreas");
            // Route::post("/fetch/fetchsubmem", "LoansController@fetchsubmem");
            Route::post("/loans/create", "LoansController@create");
            Route::get("/loans/reducingBalance", "LoansController@updateReducingBalance");
            Route::post("/loans/payloan", "LoansController@payLoan")->name("payLoan");
            Route::post("/loans/fetch", "LoansController@fetch")->name("fetchpending");
            Route::post("/loans/edit/{id}", "LoansController@edit")->name("editLoans");




            //unknown
            Route::post("/fetch/expenses", "ExpensesController@fetchAll")->name("fetchAll");
            Route::get("/dashboardExpense", "ExpensesController@index")->name("welcome");
            Route::post("/expenses/fetch", "ExpensesController@fetch")->name("fetchExpenses");
            Route::post("/expenses/actions", "ExpensesController@action")->name("expenseAction");
            Route::post("/dashboardvalues", "ExpensesController@values")->name("values");
            Route::post("/pdf/loandata", "LoansController@print")->name("loanpdf");
            Route::post("/pdf/approveddata", "LoansController@printApproved")->name("Approvedloanpdf");
            Route::post("/loans/cleared", "LoansController@clearloan")->name("clearedloan");
            Route::post("loans/fetch/cleared", "LoansController@fetchCleared")->name("fetchCleared");
            Route::post("loans/fetch/loans", "LoansController@fetchAll")->name("fetchAll");

            Route::get('/dashboard', function () {
                return view('dashboard');
            })->name('dashboard');
        });
    
});



//   Route::get('/connection', function () {
//     try{
//         DB::connection()->getPdo();
//         return "connected successfully";
//     }catch (\Exception $e) {
//     dd($e->getMessage());
// }
//  });