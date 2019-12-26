<?php

namespace App\Http\Controllers;

use App\Answer;
use App\CodeAnswer;
use App\CodeQuestion;
use App\Question;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\DB;

class TestController extends Controller
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
            $data = Question::all();
            return DataTables::of($data)
                ->addIndexColumn()
                ->editColumn('id_code', function(Question $question) {
                    return $question->code->code;
                })
                ->addColumn('action', function($row) {
                    return view('admin.action', ['id' => $row->id]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }
        return view('test');
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
        // $question = Question::updateOrCreate(['id' => $id], [
        //     'name' => $request->question,
        //     'id_code' => $request->questionCode
        // ]);
        if ($id == null) {
            $id = DB::table('test_question')->insertGetId([
                'name' => $request->question,
                'id_code' => $request->questionCode
            ]);
        } else {
            $question = DB::table('test_question')
                ->where('id', $id)
                ->update([
                    'name' => $request->question,
                    'id_code' => $request->questionCode
                ]);
        }
        //$idQuestion = Question::where(array('name' => $request->question))->first()->id;
        $answer1 = Answer::updateOrCreate(['id' => $request->idAnswer1], [
            'name' => $request->answer1,
            'id_code' => $request->answerCode1,
            'id_question' => $id
        ]);
        $answer2 = Answer::updateOrCreate(['id' => $request->idAnswer2], [
            'name' => $request->answer2,
            'id_code' => $request->answerCode2,
            'id_question' => $id
        ]);
        return response($answer1, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $question = Question::findOrFail($id);
        $answer = Answer::where(array('id_question' => $id))->get();
        return response()->json([
            'id' => $question->id,
            'questionCode' => $question->code->id,
            'question' => $question->name,
            'answer' => $answer,
        ]);
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
        $data = Question::where($where)->first();
        return response()->json($data);
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
        $answer = Answer::where('id_question', $id)->delete();
        $data = Question::where('id', $id)->delete();
        return response()->json($data);
    }

    public function codeQuestion() {
        $data = CodeQuestion::all();
        return $data;
    }

    public function codeAnswer() {
        $data = CodeAnswer::all();
        return $data;
    }
}
