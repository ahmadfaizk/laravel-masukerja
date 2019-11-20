@extends('admin.datatable')

@section('title', 'Personality')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <a href="javascript:void(0)" class="btn btn-info ml-3" id="create">Add New</a>
            </div>
            <div class="card-body">
                <table id="table" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Name</td>
                            <td>Dikenal sebagai</td>
                            <td>Partner</td>
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
                            <div class="col">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="name" name="name"
                                            placeholder="Enter Name" value="" maxlength="50" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="nickname" class="col-sm-2 control-label">Nickname</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="nickname" name="nickname"
                                            placeholder="Enter Nickname" maxlength="50" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="partner" class="col-sm-2 control-label">Partner</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="partner" name="partner"
                                            placeholder="Enter Partner" maxlength="50" required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Description</label>
                                    <div class="col-sm-12">
                                        <textarea class="form-control" id="description" name="description"
                                            placeholder="Enter Description" required="" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Characteristic</label>
                                    <div class="col-sm-12">
                                        <textarea class="form-control" id="characteristic" name="characteristic"
                                            placeholder="Enter Characteristic" required="" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Suggestion</label>
                                    <div class="col-sm-12">
                                        <textarea class="form-control" id="suggestion" name="suggestion"
                                            placeholder="Enter Suggestion" required="" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Job</label>
                                    <div class="col-sm-12">
                                        <textarea type="text" class="form-control" id="job" name="job" placeholder="Enter Job"
                                            value="" required="" rows="5"></textarea>
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
    $(document).ready(function () {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var table = $('#table').DataTable({
            processing: true,
            serverSide: true,
            responsive: true,
            ajax: '{{ route('personality.index') }}',
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'nickname',
                    name: 'nickname'
                },
                {
                    data: 'partner',
                    name: 'partner'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                }
            ]
        });
        $('#create').click(function () {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Personality");
            $('#ajax-modal').modal('show');
            $("#form :input").attr("disabled", false);
        });
        $('body').on('click', '#show', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", true);
            $('#title-modal').html("Show Personality");
            $.get('/personality/' + id, function (data) {
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#name').val(data.name);
                $('#nickname').val(data.nickname);
                $('#partner').val(data.partner);
                $('#description').val(data.description);
                $('#characteristic').val(data.characteristic);
                $('#suggestion').val(data.suggestion);
                $('#job').val(data.job);
            });
        });
        $('body').on('click', '#edit', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", false);
            $.get('/personality/' + id + '/edit', function (data) {
                $('#name-error').hide();
                $('#nickname-error').hide();
                $('#partner-error').hide();
                $('#description-error').hide();
                $('#characteristic-error').hide();
                $('#suggestion-error').hide();
                $('#job-error').hide();
                $('#title-modal').html("Edit Personality");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#name').val(data.name);
                $('#nickname').val(data.nickname);
                $('#partner').val(data.partner);
                $('#description').val(data.description);
                $('#characteristic').val(data.characteristic);
                $('#suggestion').val(data.suggestion);
                $('#job').val(data.job);
            });
        });
        $('body').on('click', '#delete', function () {
            var id = $(this).data('id');
            if (confirm("Are You Sure Want to Delete !")) {
                $.ajax({
                    type: "DELETE",
                    url: 'personality/' + id,
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
                url: "{{ route('personality.store') }}",
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
