<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Job;
use App\JobField;
use Illuminate\Http\Request;

class CrawlController extends Controller
{
    public function jobsid(Request $request) {
        $this->validate($request, [
            'name' => 'required|string',
            'company' => 'required|string',
            'location' => 'required|string',
            'field' => 'required|string',
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
        $min_salary = $request->input('min_salary');
        $max_salary = $request->input('max_salary');
        $posting_date = $request->input('posting_date');
        $closing_date = $request->input('closing_date');
        $url = $request->input('url');
        $description = $request->input('description');
        $id_jf = null;
        $jf = JobField::where('name', $field)->first();
        if ($jf) {
            $id_jf = $jf->id;
        } else {
            JobField::create(['name' => $field]);
            $id_jf = JobField::where('name', $field)->first()->id;
        }
        $job = new Job([
            'name' => $name,
            'company' => $company,
            'location' => $location,
            'id_job_source' => 2,
            'id_job_field' => $id_jf,
            'min_salary' => $min_salary,
            'max_salary' => $max_salary,
            'posting_date' => $posting_date,
            'closing_date' => $closing_date,
            'url' => $url,
            'description' => $description,
        ]);
        $job->save();
        return response()->json($job, 201);
    }
}
