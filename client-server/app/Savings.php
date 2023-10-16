<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Savings extends Model
{
    protected $fillable = [
        'user_id',
        'total_monthly',
        'total_social',
        'total_fines',
        'total_deposits',
        'total_late_payment'
    ];
    /**
     * Get the user that owns the Savings
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function expense()
    {
        return $this->hasMany("App\Expenses");
    }
    public function loans()
    {
        return $this->hasMany("App\Loans");
    }
}