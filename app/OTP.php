<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OTP extends Model
{
    protected $table = 'otp';
    public $timestamps = false;

    protected $fillable = [
        'id', 'user_id', 'code',
    ];

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }
}
