<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Charge extends Model
{
     protected $fillable = [
        'user',
        'amount',
        'reason',
        'date',
    ];

    public function userd() {
        return $this->belongsTo(User::class, 'user', 'id');
    }
}
