<?php

namespace App\Http\Controllers;

use App\Job;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Carbon;

class JobController extends Controller
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
            $data = Job::all();
            return DataTables::of($data)
                ->addIndexColumn()
                ->editColumn('id_job_source', function($row) {
                    return $row->source->name;
                })
                ->editColumn('id_job_field', function($row) {
                    return $row->field->name;
                })
                ->editColumn('id_job_location', function($row) {
                    return $row->location->name;
                })
                ->editColumn('posting_date', function($row) {
                    return Carbon::createFromFormat('Y-m-d', $row->posting_date)->format('d M Y');
                })
                ->editColumn('closing_date', function($row) {
                    return Carbon::createFromFormat('Y-m-d', $row->closing_date)->format('d M Y');
                })
                ->addColumn('action', function($row) {
                    return view('admin.action', ['id' => $row->id]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }
        return view('job');
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
        $data = Job::updateOrCreate(['id' => $id], [
            'name' => $request->name,
            'company' => $request->company,
            'id_job_location' => $request->location,
            'id_job_source' => $request->source,
            'id_job_field' => $request->field,
            'min_salary' => $request->min_salary,
            'max_salary' => $request->max_salary,
            'posting_date' => $request->posting_date,
            'closing_date' => $request->closing_date,
            'url' => $request->url,
            'description' => $request->description
        ]);
        return response()->json($data);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Job::findOrFail($id);
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
        $mbti = Job::where($where)->first();
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
        $data = Job::where('id', $id)->delete();
        return response()->json($data);
    }

    public function deleteExpired() {
        $date = Carbon::now()->toDateString();
        $data = Job::where('closing_date', '<', $date)->delete();
        return response()->json([
            'jumlah' => $data,
            'date' => Carbon::now()->format('d M Y')
        ]);
    }
}
