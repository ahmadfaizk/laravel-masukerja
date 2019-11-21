@extends('admin.datatable')

@section('title', 'Test')

@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <a href="javascript:void(0)" class="btn btn-info ml-3 float-right" id="create">Add New</a>
            </div>
            <div class="card-body">
                <table id="table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Soal</td>
                            <td>Kode</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ajax-modal" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="title-modal"></h4>
            </div>
            <div class="modal-body">
                <form id="form" name="form" class="form-horizontal">
                    <div class="container-fluid">
                        <input type="hidden" name="id" id="id">
                        <div class="row">
                            <div class="col-lg-2 col-4">
                                <div class="form-group">
                                    <label for="questionCode" class="col-sm-2 control-label">Code</label>
                                    <div class="col-sm-12">
                                        <select name="questionCode" id="questionCode" class="form-control"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-10 col-8">
                                <div class="form-group">
                                    <label for="question" class="col-sm-2 control-label">Question</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="question" name="question"
                                            placeholder="Enter Question" required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="idAnswer1" id="idAnswer1">
                        <div class="row">
                            <div class="col-lg-2 col-4">
                                <div class="form-group">
                                    <label for="answerCode1" class="col-sm-2 control-label">Code</label>
                                    <div class="col-sm-12">
                                        <select name="answerCode1" id="answerCode1" class="form-control"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-10 col-8">
                                <div class="form-group">
                                    <label for="answer1" class="col-sm-2 control-label">Answer</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="answer1" name="answer1"
                                            placeholder="Enter Answer 1" required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="idAnswer2" id="idAnswer2">
                        <div class="row">
                            <div class="col-lg-2 col-4">
                                <div class="form-group">
                                    <label for="answerCode2" class="col-sm-2 control-label">Code</label>
                                    <div class="col-sm-12">
                                        <select name="answerCode2" id="answerCode2" class="form-control"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-10 col-8">
                                <div class="form-group">
                                    <label for="answer2" class="col-sm-2 control-label">Answer</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="answer2" name="answer2"
                                            placeholder="Enter Answer 2" required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary" id="btn-save" value="create">Save changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    $(document).ready( function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var table = $('#table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ route('test.index') }}',
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'id_code',
                    name: 'id_code'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                }
            ]
        });
        $.get('/question-code/', function(data) {
            for (let i=0; i<data.length; i++) {
                var option = new Option(data[i].code, data[i].id);
                $('#questionCode').append($(option));
            }
        });
        $.get('/answer-code/', function(data) {
            for (let i=0; i<data.length; i++) {
                var option = new Option(data[i].code, data[i].id);
                var option2 = new Option(data[i].code, data[i].id);
                $('#answerCode1').append($(option));
                $('#answerCode2').append($(option2));
            }
        });
        $('#create').click(function () {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Question");
            $('#ajax-modal').modal('show');
            $("#form :input").attr("disabled", false);
        });
        $('body').on('click', '#show', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", true);
            $('#title-modal').html("Show Question");
            $.get('/test/' + id, function (data) {
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#question').val(data.question);
                $('#questionCode').val(data.questionCode);
                $('#idAnswer1').val(data.answer[0].id);
                $('#answer1').val(data.answer[0].name);
                $('#answerCode1').val(data.answer[0].id_code);
                $('#idAnswer2').val(data.answer[1].id);
                $('#answer2').val(data.answer[1].name);
                $('#answerCode2').val(data.answer[1].id_code);
            });
        });
        $('body').on('click', '#edit', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", false);
            $.get('/test/' + id, function (data) {
                $('#title-modal').html("Edit Question");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#question').val(data.question);
                $('#questionCode').val(data.questionCode);
                $('#idAnswer1').val(data.answer[0].id);
                $('#answer1').val(data.answer[0].name);
                $('#answerCode1').val(data.answer[0].id_code);
                $('#idAnswer2').val(data.answer[1].id);
                $('#answer2').val(data.answer[1].name);
                $('#answerCode2').val(data.answer[1].id_code);
            });
        });
        $('body').on('click', '#delete', function () {
            var id = $(this).data('id');
            if (confirm("Are You Sure Want to Delete !")) {
                $.ajax({
                    type: "DELETE",
                    url: 'test/' + id,
                    success: function (data) {
                        table.draw();
                    },
                    error: function (data) {
                        console.log('Error: ', data);
                    }
                });
            }
        });
        $('#btn-save').click(function (e) {
            e.preventDefault();
            $(this).html('Sending..');
            $.ajax({
                data: $('#form').serialize(),
                url: "{{ route('test.store') }}",
                type: "POST",
                dataType: 'json',
                success: function (data) {
                    $('#form').trigger("reset");
                    $('#ajax-modal').modal('hide');
                    table.draw();
                },
                error: function (data) {
                    console.log('Error:', data);
                }
            });
            $('#btn-save').html('Save Changes');
        });
    });
</script>
@endpush
