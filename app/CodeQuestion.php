<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CodeQuestion extends Model
{
    protected $table = 'code_question';
    public $timestamps = false;

    protected $fillable = [
        'id', 'code',
    ];

    public function question() {
        return $this->belongsTo('App\Question');
    }
}
