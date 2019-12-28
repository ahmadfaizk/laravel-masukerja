<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestController extends Controller
{
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
                ->select('test_answers.name', 'code_answer.code')
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
        //return new TestCollection($data);
    }

    public function store(Request $request) {
        $this->validate($request, [
            'id_user' => 'int|required',
            'introvert' => 'int|required',
            'extrovert' => 'int|required',
            'intuiting' => 'int|required',
            'sensing' => 'int|required',
            'thingking' => 'int|required',
            'feeling' => 'int|required',
            'judging' => 'int|required',
            'perceiving' => 'int|required'
        ]);

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

        $test = DB::table('test_results')->insert([
            'id_user' => $request->id_user,
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

        return response()->json([
            'test' => $test,
            'result' => $result
        ]);
    }

    public function show($id) {
        $data = DB::table('test_results')->find($id);
        $result = DB::table('mbti_personalities')->find($data->id);
        return response([
            'test' => $data,
            'result' => $result
        ]);
    }
}
