<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Departure extends Model
{
    protected $fillable = [
        'person',
        'payout_amount',
        'reason',
        'cheque',
        'check_no',
        'received_by',
        'date',
        'status',
    ];

    public function user() {
        return $this->belongsTo(User::class, 'person', 'id');
    }
}