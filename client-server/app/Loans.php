<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Loans extends Model
{
    protected $fillable = [
        "user_id",
        'loanamount',
        'processingfee',
        'monthstaken',
        'desc',
        'status',
        'last_payment',
        'seize',
        'arrears',
        'return',
        'disbursed',
        'reason',
        'reducing_balance',
        'months_elapsed',
        'payment_mode',
        'request_date'
    ];
    public function user()
    {
        return $this->belongsTo("App\User");
    }

    public function expense()
    {
        return $this->hasMany("App\Expenses");
    }

    public function savings()
    {
        return $this->hasMany("App\Savings");
    }

    public function guarantors()
    {
        return $this->hasMany("App\Guarantors");
    }

    public function payments()
    {
        return $this->hasMany("App\LoanPayments");
    }

    public function comments()
    {
        return $this->hasMany("App\LoanPayments");
    }
}