<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'test_question';
    public $timestamps = false;

    protected $fillable = [
        'name', 'id_code',
    ];

    public function answer() {
        return $this->hasMany('App\Answer', 'id_question');
    }

    public function code() {
        return $this->hasOne('App\CodeQuestion', 'id', 'id_code');
    }
}
