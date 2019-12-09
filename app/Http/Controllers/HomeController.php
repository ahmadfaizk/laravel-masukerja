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
        $this->middleware('admin');
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
        $color = collect([]);
        $jf = collect([]);
        foreach ($jobSource as $source) {
            $label->push($source->name);
            $data->push($source->job->count());
        }
        foreach ($jobField as $field) {
            if ($field->job->count() > 0) {
                $name = ['name' => $field->name, 'jumlah' => $field->job->count()];
                $jf->push($name);
            }
        }
        $jf = $jf->sortByDesc('jumlah')->slice(0,10);
        $colour = ['#dd2c00', '#ff6d00', '#ffab00', '#ffd600', '#aeea00', '#64dd17', '#00c853', '#00bfa5', '#00b8d4', '#0091ea', '#2962ff', '#304ffe', '#6200ea', '#aa00ff', '#c51162', '#d50000'];
        $jobChart = new JobChart;
        $jobChart->minimalist(true);
        $jobChart->displayLegend(true);
        $jobChart->labels($label);
        $jobChart->dataset('Job Source', 'doughnut', $data)
            ->backgroundcolor($colour);
        $jobField = new JobChart;
        $jobField->minimalist(true);
        $jobField->labels($jf->pluck('name'));
        $jobField->dataset('Job Field', 'bar', $jf->pluck('jumlah'))
            ->backgroundcolor($colour);
        return view('home', [
            'user' => User::all()->count(),
            'job' => Job::all()->count(),
            'article' => Article::all()->count(),
            'test' => Question::all()->count(),
            'jobChart' => $jobChart,
            'jobField' => $jobField,
        ]);
    }
}
