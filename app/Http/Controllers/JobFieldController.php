<?php

namespace App\Http\Controllers;

use App\JobField;
use Illuminate\Http\Request;
use DataTables;

class JobFieldController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = JobField::all();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('job', function($row) {
                    return $row->job->count();
                })
                ->addColumn('action', function($row) {
                    return view('admin.action2', ['id' => $row->id]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }
        return view('job-field');
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
        $field = JobField::updateOrCreate(['id' => $id], [
            'name' => $request->name,
        ]);
        return response()->json($field);
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
        $field = JobField::where($where)->first();
        return response()->json($field);
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
        $field = JobField::where('id', $id)->delete();
        return response()->json($field);
    }

    public function json() {
        $data = JobField::all();
        return response()->json($data);
    }
}
