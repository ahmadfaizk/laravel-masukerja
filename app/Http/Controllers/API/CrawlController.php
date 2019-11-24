<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Job;
use App\JobField;
use App\JobLocation;
use Illuminate\Http\Request;

class CrawlController extends Controller
{
    public function job(Request $request) {
        $this->validate($request, [
            'name' => 'required|string',
            'company' => 'required|string',
            'location' => 'required|string',
            'field' => 'required|string',
            'source' => 'required|int',
            'min_salary' => 'required|int',
            'max_salary' => 'required|int',
            'posting_date' => 'required|string',
            'closing_date' => 'required|string',
            'url' => 'required|string|unique:jobs',
            'description' => 'required|string'
        ]);

        $name = $request->input('name');
        $company = $request->input('company');
        $location = $request->input('location');
        $field = $request->input('field');
        $source = $request->input(('source'));
        $min_salary = $request->input('min_salary');
        $max_salary = $request->input('max_salary');
        $posting_date = $request->input('posting_date');
        $closing_date = $request->input('closing_date');
        $url = $request->input('url');
        $description = $request->input('description');
        $jf = JobField::where('name', $field)->first()->id;
        $jl = JobLocation::where('name', $location)->first()->id;
        if (!$jf) {
            JobField::create(['name' => $field]);
            $jf = JobField::where('name', $field)->first()->id;
        }
        if (!$jl) {
            JobLocation::create(['name' => $location]);
            $jl = JobLocation::where('name', $location)->first()->id;
        }
        $job = new Job([
            'name' => $name,
            'company' => $company,
            'id_job_source' => $source,
            'id_job_field' => $jf,
            'id_job_location' => $jl,
            'min_salary' => $min_salary,
            'max_salary' => $max_salary,
            'posting_date' => $posting_date,
            'closing_date' => $closing_date,
            'url' => $url,
            'description' => $description,
        ]);
        $job->save();
        return response()->json(['message' => 'Succes'], 201);
    }
}
