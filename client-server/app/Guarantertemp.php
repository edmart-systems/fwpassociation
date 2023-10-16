<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Guarantertemp extends Model
{
    protected $fillable = [
        'user_id',
        'guarantor',
        'g_amount'
    ];

    /**
     * Get the user that owns the Guarantertemp
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'guarantor', 'id');
    }
}