<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    protected $table = 'jobs';
    public $timestamps = false;

    protected $fillable = [
        'name', 'company', 'image', 'id_job_source', 'id_job_field', 'id_job_location', 'min_salary', 'max_salary', 'posting_date', 'closing_date', 'url', 'description',
    ];

    public function source() {
        return $this->belongsTo('App\JobSource', 'id_job_source');
    }

    public function field() {
        return $this->belongsTo('App\JobField', 'id_job_field');
    }

    public function location() {
        return $this->belongsTo('App\JobLocation', 'id_job_location');
    }
}
