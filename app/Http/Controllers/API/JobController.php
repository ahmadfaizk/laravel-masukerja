<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Job;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JobController extends Controller
{
    public function __construct()
    {
        //$this->middleware('jwt.verify');
    }

    public function index() {
        $data = Job::all();
        return response()->json($data);
    }

    public function search(Request $request) {
        $this->validate($request, [
            'title' => 'string',
            'salary' => 'int',
            'location' => 'string',
            'field' => 'string'
        ]);

        $title = $request->get('title');
        $salary = (int)$request->get('salary');
        $location = $request->get('location');
        $field = $request->get('field');

        $data = DB::table('jobs')
            ->join('job_sources', 'jobs.id_job_source', '=', 'job_sources.id')
            ->join('job_fields', 'jobs.id_job_field', '=', 'job_fields.id')
            ->join('job_location', 'jobs.id_job_location', '=', 'job_location.id')
            ->select('jobs.*', 'job_sources.name as source', 'job_fields.name as field', 'job_location.name as location')
            ->where('jobs.name', 'like', '%'. $title .'%')
            ->where('job_location.name', 'like', '%'. $location .'%')
            ->where('job_fields.name', 'like', '%'. $field .'%')
            ->whereRaw('((jobs.min_salary >= ? or jobs.max_salary >= ?) or (jobs.min_salary = 0 and jobs.max_salary = 0))', [$salary, $salary])
            ->get();

        return response()->json([
            'data' => $data,
            'params' => [
                'title' => $title,
                'salary' => $salary,
                'location' => $location,
                'field' => $field
            ]
        ]);
    }
}
