<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;

class TestController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.verify');
    }

    public function index() {
        $question = DB::table('test_question')
            ->join('code_question', 'test_question.id_code', '=', 'code_question.id')
            ->select('test_question.*', 'code_question.code')
            ->orderBy('test_question.id')
            ->get();
        $data = collect([]);
        $nomor = 1;
        foreach($question as $quest) {
            $answer = DB::table('test_answers')
                ->join('code_answer', 'test_answers.id_code', '=', 'code_answer.id')
                ->select('test_answers.id', 'test_answers.name', 'code_answer.code')
                ->where('test_answers.id_question', '=', $quest->id)
                ->get();
            $temp = [
                'id' => $quest->id,
                'nomor' => $nomor,
                'question' => $quest->name,
                'code' => $quest->code,
                'answer' => $answer
            ];
            $nomor++;
            $data->push($temp);
        }
        return response()->json([
            'data' => $data,
            'count' => $data->count()
        ]);
    }

    public function store(Request $request) {
        $this->validate($request, [
            'introvert' => 'int|required',
            'extrovert' => 'int|required',
            'intuiting' => 'int|required',
            'sensing' => 'int|required',
            'thingking' => 'int|required',
            'feeling' => 'int|required',
            'judging' => 'int|required',
            'perceiving' => 'int|required'
        ]);

        $id_user = JWTAuth::user()->id;

        $i = $request->introvert;
        $e = $request->extrovert;
        $s = $request->sensing;
        $n = $request->intuiting;
        $t = $request->thingking;
        $f = $request->feeling;
        $j = $request->judging;
        $p = $request->perceiving;

        $mbti = "";

        if($i < $e) {
            $mbti .= "E";
        } else {
            $mbti .= "I";
        }

        if($s < $n) {
            $mbti .= "N";
        } else {
            $mbti .= "S";
        }

        if ($t < $f) {
            $mbti .= "F";
        } else {
            $mbti .= "T";
        }

        if ($j < $p) {
            $mbti .= "P";
        } else {
            $mbti .= "J";
        }

        $result = DB::table('mbti_personalities')->where('name', '=', $mbti)->first();

        $test = DB::table('test_results')->insertGetId([
            'id_user' => $id_user,
            'introvert' => $request->introvert,
            'extrovert' => $request->extrovert,
            'intuiting' => $request->intuiting,
            'sensing' => $request->sensing,
            'thingking' => $request->thingking,
            'feeling' => $request->feeling,
            'judging' => $request->judging,
            'perceiving' => $request->perceiving,
            'id_personalities' => $result->id
        ]);

        $data = DB::table('test_results')->find($test);
        $data->result = $result;

        return response([
            'data' => $data,
        ]);
    }

    public function show() {
        $id_user = JWTAuth::user()->id;

        $datas = DB::table('test_results')->where('id_user', $id_user)->get();
        foreach($datas as $d) {
            $result = DB::table('mbti_personalities')->find($d->id_personalities);
            $d->result = $result;
        };
        // $result = DB::table('mbti_personalities')->find($data->id_personalities);
        // $data->result = $result;
        return response([
            'data' => $datas,
        ]);
    }
}
