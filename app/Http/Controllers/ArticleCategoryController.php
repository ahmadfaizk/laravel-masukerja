<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ArticleCategory;
use DataTables;

class ArticleCategoryController extends Controller
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
            $data = ArticleCategory::all();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row) {
                    return view('admin.action2', ['id' => $row->id]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }
        return view('article-category');
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
        $source = ArticleCategory::updateOrCreate(['id' => $id], [
            'name' => $request->name,
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
        //
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
        $source = ArticleCategory::where($where)->first();
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
        $source = ArticleCategory::where('id', $id)->delete();
        return response()->json($source);
    }
}
