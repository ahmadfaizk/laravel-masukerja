<?php

namespace App\Http\Controllers;

use App\Article;
use App\Charts\JobChart;
use App\Job;
use App\JobField;
use App\JobSource;
use App\Question;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $jobSource = JobSource::all();
        $jobField = JobField::all();
        $label = collect([]);
        $data = collect([]);
        $label2 = collect([]);
        $data2 = collect([]);
        $color = collect([]);
        foreach ($jobSource as $source) {
            $label->push($source->name);
            $data->push($source->job->count());
        }
        foreach ($jobField as $field) {
            if ($field->job->count() > 0) {
                $label2->push($field->name);
                $data2->push($field->job->count());
                $color->push($this->random_color());
            }
        }
        // dd($color);
        $jobChart = new JobChart;
        $jobChart->minimalist(true);
        $jobChart->displayLegend(true);
        $jobChart->labels($label);
        $jobChart->dataset('Job Source', 'doughnut', $data)
            ->backgroundcolor(['#dc3545', '#007bff', '#17a2b8', '#00c0ef', '#3c8dbc', '#d2d6de']);
        $jobField = new JobChart;
        $jobField->minimalist(true);
        $jobField->labels($label2);
        $jobField->dataset('Job Field', 'bar', $data2)
            ->backgroundcolor($color);
        return view('home', [
            'user' => User::all()->count(),
            'job' => Job::all()->count(),
            'article' => Article::all()->count(),
            'test' => Question::all()->count(),
            'jobChart' => $jobChart,
            'jobField' => $jobField,
        ]);
    }

    function random_color_part() {
        return str_pad( dechex( mt_rand( 0, 255 ) ), 2, '0', STR_PAD_LEFT);
    }

    function random_color() {
        return '#' . $this->random_color_part() . $this->random_color_part() . $this->random_color_part();
    }
}
