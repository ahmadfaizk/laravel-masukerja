@extends('admin.datatable')

@section('title', 'Job Field & Source')

@section('content')
<div class="row">
    <div class="col-md-6 col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Job Field</h4>
                <a href="javascript:void(0)" class="btn btn-info ml-3 float-right" id="createField">Add New</a>
            </div>
            <div class="card-body">
                <table id="field-table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Nama</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-12">
        <div class="card">
            <div class="card-header">
                    <h4 class="card-title">Job Source</h4>
                <a href="javascript:void(0)" class="btn btn-info ml-3 float-right" id="createSource">Add New</a>
            </div>
            <div class="card-body">
                <table id="source-table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Nama</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ajax-modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="title-modal"></h4>
            </div>
            <div class="modal-body">
                <form id="form" name="form" class="form-horizontal">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"
                                value="" maxlength="50" required="">
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
        var tableField = $('#field-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ route('job-field.index') }}',
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });
        var tableSource = $('#source-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ route('job-source.index') }}',
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });
        $('#createField').click(function() {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Job Field");
            $('#ajax-modal').modal('show');
        });
        $('#field-table').on('click', '#edit', function() {
            var id = $(this).data('id');
            console.log(id);
            $.get('/job-field/' + id + '/edit', function(data) {
                $('#name-error').hide();
                $('#title-modal').html("Edit Job Field");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#name').val(data.name);
            });
        });
        $('#field-table').on('click', '#delete', function() {
            var id = $(this).data('id');
            console.log(id);
            if (confirm("Are You Sure Want to Delete !")) {
                $.ajax({
                    type: "DELETE",
                    url: 'job-field/' + id,
                    success: function(data) {
                        tableField.draw();
                    },
                    error: function(data) {
                        console.log('Error: ', data);
                    }
                });
            }
        });
        $('#createSource').click(function() {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Job Source");
            $('#ajax-modal').modal('show');
        });
        $('#source-table').on('click', '#edit', function() {
            var id = $(this).data('id');
            console.log(id);
            $.get('/job-source/' + id + '/edit', function(data) {
                $('#name-error').hide();
                $('#title-modal').html("Edit Job Source");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#name').val(data.name);
            });
        });
        $('#source-table').on('click', '#delete', function() {
            var id = $(this).data('id');
            console.log(id);
            if (confirm("Are You Sure Want to Delete !")) {
                $.ajax({
                    type: "DELETE",
                    url: 'job-source/' + id,
                    success: function(data) {
                        tableSource.draw();
                    },
                    error: function(data) {
                        console.log('Error: ', data);
                    }
                });
            }
        });
        $('#btn-save').click(function (e) {
            e.preventDefault();
            $(this).html('Sending..');
            var title = $('#title-modal').text()
            if (title == "Add New Job Field" || title == "Edit Job Field") {
                $.ajax({
                    data: $('#form').serialize(),
                    url: '{{ route('job-field.store') }}',
                    type: "POST",
                    dataType: 'json',
                    success: function (data) {
                        $('#form').trigger("reset");
                        $('#ajax-modal').modal('hide');
                        tableField.draw();
                    },
                    error: function (data) {
                        console.log('Error:', data);
                        $('#btn-save').html('Save Changes');
                    }
                });
            }
            else {
                $.ajax({
                    data: $('#form').serialize(),
                    url: '{{ route('job-source.store') }}',
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
            }
            $('#btn-save').html('Save Changes');
        });
    });
</script>
@endpush
