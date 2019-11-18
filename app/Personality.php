<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Personality extends Model
{
    protected $table = 'personalities';
    public $timestamps = false;

    protected $fillable = [
        'code', 'name',
    ];
}
