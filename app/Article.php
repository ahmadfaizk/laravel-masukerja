<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'articles';
    public $timestamps = false;

    protected $fillable = [
        'name', 'date', 'location', 'description', 'id_kategory',
    ];

    public function category() {
        return $this->belongsTo('App\ArticleCategory', 'id_kategory');
    }
}
