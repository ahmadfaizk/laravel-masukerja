<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CodeAnswer extends Model
{
    protected $table = 'code_answer';
    public $timestamps = false;

    protected $fillable = [
        'code',
    ];

    public function answer() {
        return $this->belongsTo('App\Answer');
    }
}
