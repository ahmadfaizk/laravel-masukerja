<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MBTIPersonality extends Model
{
    protected $table = 'mbti_personalities';
    public $timestamps = false;

    protected $fillable = [
        'name', 'nickname', 'description', 'characteristic', 'suggestion', 'job', 'partner',
    ];
}
