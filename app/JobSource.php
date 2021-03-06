<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JobSource extends Model
{
    protected $table = 'job_sources';
    public $timestamps = false;

    protected $fillable = [
        'id', 'name',
    ];

    public function job() {
        return $this->hasMany('App\Job', 'id_job_source');
    }
}
