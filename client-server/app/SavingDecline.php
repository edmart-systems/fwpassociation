<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SavingDecline extends Model
{
	protected $fillable = [
        'savingId',
        'message',
    ];
}
