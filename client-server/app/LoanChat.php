<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LoanChat extends Model
{
    protected $fillable = [
        "user_id",
        'loans_id',
        'action',
        'message'
    ];

    public function loans()
    {
        return $this->belongsTo("App\Loans");
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}