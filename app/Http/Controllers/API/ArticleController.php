<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class ArticleController extends Controller
{
    public function index() {
        $data = DB::table('articles')
            ->join('article_category', 'articles.id_kategory', '=', 'article_category.id')
            ->select('articles.*', 'article_category.name as category')
            ->orderBy('date', 'desc')
            ->get();

        foreach($data as $d) {
            $d->date = Carbon::parse($d->date)->format('d M Y');
        };

        return response()->json([
            'data' => $data
        ]);
    }
}
