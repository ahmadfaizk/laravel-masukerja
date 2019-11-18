<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JobField extends Model
{
    protected $table = 'job_fields';
    public $timestamps = false;

    protected $fillable = [
        'name',
    ];

    public function job() {
        return $this->hasMany('App\Job');
    }
}
