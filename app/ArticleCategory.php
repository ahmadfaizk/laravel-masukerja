<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ArticleCategory extends Model
{
    protected $table = 'article_category';
    public $timestamps = false;

    protected $fillable = [
        'name',
    ];

    public function article() {
        return $this->hasMan('App\Article');
    }
}
