<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SavingLogs extends Model
{
    protected $fillable = [
        'member',
        'monthly_contr',
        'late_payment',
        'late_meeting',
        'absenteeism',
        'marriage',
        'birth',
        'graduation',
        'consecration',
        'death',
        'sickness',
        'arrears',
        'log_type',
        'approve',
        'date',
    ];


public function user() {
        return $this->belongsTo(User::class, 'member', 'id');
}

}