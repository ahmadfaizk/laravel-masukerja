<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\TestCollection;
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
}
