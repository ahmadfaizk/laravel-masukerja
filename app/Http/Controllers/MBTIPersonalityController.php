<?php

namespace App\Http\Controllers;

use App\MBTIPersonality;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Http\Response;

class MBTIPersonalityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = MBTIPersonality::all();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row) {
                    return view('admin.action', ['id' => $row->id]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }
        return view('personality');
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
        $mbti = MBTIPersonality::updateOrCreate(['id' => $id], [
            'name' => $request->name,
            'nickname' => $request->nickname,
            'description' => $request->description,
            'characteristic' => $request->characteristic,
            'suggestion' => $request->suggestion,
            'job' => $request->job,
            'partner' => $request->partner]
        );
        return response()->json($mbti);
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
        $mbti = MBTIPersonality::where($where)->first();
        return response()->json($mbti);
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
        $mbti = MBTIPersonality::where('id', $id)->delete();
        return response()->json($mbti);
    }
}
