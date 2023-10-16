<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Disburse extends Model
{
    protected $fillable = [
        'loans_id',
        'cheque_no',
        'cheque_image',
    ];
}