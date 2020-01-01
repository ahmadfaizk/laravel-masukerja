<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Job;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Carbon;

class JobController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.verify');
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
            //->select('jobs.id', 'jobs.name', 'jobs.company', 'jobs.posting_date', 'jobs.min_salary', 'jobs.max_salary','job_sources.name as source', 'job_fields.name as field', 'job_location.name as location')
            ->where('jobs.name', 'like', '%' . $title . '%')
            ->where('job_location.name', 'like', '%'. $location .'%')
            ->where('job_fields.name', 'like', '%'. $field .'%')
            ->whereRaw('((jobs.min_salary >= ? or jobs.max_salary >= ?) or (jobs.min_salary = 0 and jobs.max_salary = 0))', [$salary, $salary])
            ->orderBy('jobs.posting_date', 'desc')
            ->paginate(20);
            //->get();
        foreach($data as $d) {
            $d->posting_date = $this->parseDate($d->posting_date);
            $d->closing_date = $this->parseDate($d->closing_date);
        };

        return response()->json([
            'data' => $data,
            'params' => [
                'title' => $title,
                'field' => $field,
                'location' => $location,
                'salary' => $salary
            ]
        ]);
    }

    public function parseDate($date) {
        return Carbon::createFromFormat('Y-m-d', $date)->format('d M Y');
    }

    public function show($id) {
        $data = DB::table('jobs')
            ->join('job_sources', 'jobs.id_job_source', '=', 'job_sources.id')
            ->join('job_fields', 'jobs.id_job_field', '=', 'job_fields.id')
            ->join('job_location', 'jobs.id_job_location', '=', 'job_location.id')
            ->select('jobs.*', 'job_sources.name as source', 'job_fields.name as field', 'job_location.name as location')
            ->where('jobs.id', '=', $id)
            ->first();
        return response()->json(['data' => $data]);
    }

    public function setFavorite(Request $request) {
        $id_user = JWTAuth::user()->id;

        $this->validate($request, [
            'id_job' => 'int|required'
        ]);

        $data = DB::table('job_favorites')
            ->where('id_user', $id_user)
            ->where('id_job', $request->id_job)
            ->first();

        if($data) {
            $message = "Successfully removed from favorites";
            $result = DB::table('job_favorites')
                ->where('id_user', $id_user)
                ->where('id_job', $request->id_job)
                ->delete();
        } else {
            $message = "Successfully added to favorites";
            $result = DB::table('job_favorites')->insert([
                'id_user' => $id_user,
                'id_job' => $request->id_job
            ]);
        }

        return response()->json([
            'message' => $message,
            'result' => $result
        ]);
    }

    public function getFavorite() {
        $id = JWTAuth::user()->id;

        $data = DB::table('users')
            ->join('job_favorites', 'job_favorites.id_user', '=', 'users.id')
            ->join('jobs', 'job_favorites.id_job', '=', 'jobs.id')
            ->join('job_sources', 'jobs.id_job_source', '=', 'job_sources.id')
            ->join('job_fields', 'jobs.id_job_field', '=', 'job_fields.id')
            ->join('job_location', 'jobs.id_job_location', '=', 'job_location.id')
            ->select('jobs.*', 'job_sources.name as source', 'job_fields.name as field', 'job_location.name as location')
            ->where('users.id', $id)
            ->get();

        foreach($data as $d) {
            $d->posting_date = $this->parseDate($d->posting_date);
            $d->closing_date = $this->parseDate($d->closing_date);
        };

        return response()->json([
            'data' => $data
        ]);
    }

    public function searchData() {
        $field = DB::table('job_fields')
            ->select('name')
            ->orderBy('name')
            ->get()
            ->pluck('name');

        $location = DB::table('job_location')
            ->select('name')
            ->orderBy('name')
            ->get()
            ->pluck('name');

        return response()->json([
            'field' => $field,
            'location' => $location
        ]);
    }

    public function fieldCount() {
        $data = DB::table('job_fields')
            ->join('jobs', 'job_fields.id', '=', 'jobs.id_job_field')
            ->select(DB::raw('job_fields.name, count(jobs.id) as jumlah'))
            ->groupBy('job_fields.name')
            ->orderBy('jumlah', 'desc')
            ->take(5)
            ->get();
        // $all = DB::table('jobs')->count();
        // $jumlah = 0;
        // foreach($data as $d) {
        //     $jumlah += $d->jumlah;
        // }
        // $data->push([
        //     'name' => 'Lainnya',
        //     'jumlah' => $all - $jumlah
        // ]);
        return response()->json([
            'data' => $data,
        ]);
    }

    public function locationCount() {
        $data = DB::table('job_location')
            ->join('jobs', 'job_location.id', '=', 'jobs.id_job_location')
            ->select(DB::raw('job_location.name, count(jobs.id) as jumlah'))
            ->groupBy('job_location.name')
            ->get();

        return response()->json([
            'data' => $data
        ]);
    }

    public function sourceCount() {
        $data = DB::table('job_sources')
            ->join('jobs', 'job_sources.id', '=', 'jobs.id_job_source')
            ->select(DB::raw('job_sources.name, count(jobs.id) as jumlah'))
            ->groupBy('job_sources.name')
            ->get();

        return response()->json([
            'data' => $data
        ]);
    }
}
