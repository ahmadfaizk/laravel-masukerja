<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'articles';
    public $timestamps = false;
    const CREATED_AT = 'date';

    protected $fillable = [
        'name', 'date', 'description', 'id_kategory',
    ];

    public function category() {
        return $this->belongsTo('App\ArticleCategory', 'id_kategory');
    }
}
