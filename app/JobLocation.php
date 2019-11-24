<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JobLocation extends Model
{
    protected $table = 'job_location';
    public $timestamps = false;

    protected $fillable = [
        'name',
    ];

    public function job() {
        return $this->hasMany('App\Job', 'id_job_location');
    }
}
