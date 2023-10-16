<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Guarantors extends Model
{
    protected $fillable = [
        'user_id',
        'loans_id',
        'g_amount',
        'g_accept',
        'status'
    ];

    // public function user()
    // {
    //     return $this->belongsTo("App\User");
    // }

    public function loans()
    {
        return $this->belongsTo("App\Loans");
    }

    /**
     * Get the user that owns the Guarantertemp
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    /**
     * Get the loan that owns the Guarantertemp
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    // public function loan()
    // {
    //     return $this->belongsTo(Loans::class, 'loans_id', 'id');
    // }
}