<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Article;
use App\ArticleCategory;
use DataTables;
use Illuminate\Support\Carbon;

class ArticleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Article::all();
            return DataTables::of($data)
                ->addIndexColumn()
                ->editColumn('id_kategory', function($row) {
                    return $row->category->name;
                })
                ->editColumn('date', function($row) {
                    return Carbon::parse($row->date)->format('H:i, d M Y');
                })
                ->addColumn('action', function($row) {
                    return view('admin.action', ['id' => $row->id]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }
        return view('article', ['kategori' => ArticleCategory::all()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $id = $request->id;
        $source = Article::updateOrCreate(['id' => $id], [
            'name' => $request->name,
            'description' => $request->description,
            'id_kategory' => $request->category,
        ]);
        return response()->json($source);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Article::findOrFail($id);
        return response()->json($data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $where = array('id' => $id);
        $source = Article::where($where)->first();
        return response()->json($source);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $source = Article::where('id', $id)->delete();
        return response()->json($source);
    }
}
