<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DepartureDecline extends Model
{
     protected $fillable = [
        'rId',
        'requester',
        'reason',
        'declined_by',
    ];
}
