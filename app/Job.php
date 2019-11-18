<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
    protected $table = 'jobs';
    public $timestamps = false;

    protected $fillable = [
        'name', 'company', 'location', 'id_job_source', 'id_job_field', 'min_salary', 'max_salary', 'posting_date', 'closing_date', 'url', 'description',
    ];

    public function source() {
        return $this->belongsTo('App\JobSource', 'id_job_source');
    }

    public function field() {
        return $this->belongsTo('App\JobField', 'id_job_field');
    }
}
