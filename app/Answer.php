<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $table = 'test_answers';
    public $timestamps = false;

    protected $fillable = [
        'name', 'id_code', 'id_question',
    ];

    public function code() {
        return $this->hasOne('App\CodeAnswer', 'id', 'id_code');
    }

    public function question() {
        return $this->belongsTo('App\Question');
    }
}
