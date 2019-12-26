<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ArticleController extends Controller
{
    public function index() {
        $data = DB::table('articles')
            ->join('article_category', 'articles.id_kategory', '=', 'article_category.id')
            ->select('articles.*', 'article_category.name as category')
            ->get();
        return response()->json($data);
    }
}
