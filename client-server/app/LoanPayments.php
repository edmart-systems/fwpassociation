<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LoanPayments extends Model
{
    protected $fillable = [
        'loans_id',
        'amount',
        'date',
        'balance'
    ];
}