@extends('admin.datatable')

@section('title', 'Jobs')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <a href="javascript:void(0)" class="btn btn-info ml-3" id="create">Add New</a>
                <a href="javascript:void(0)" class="btn btn-danger ml-3" id="deleteExpired">Delete Expired</a>
            </div>
            <div class="card-body">
                <table id="jobs-table" class="table table-striped display nowrap">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Nama</td>
                            <td>Company</td>
                            <td>Location</td>
                            <td>Source</td>
                            <td>Field</td>
                            <td>Min Salary</td>
                            <td>Max Salary</td>
                            <td>Posting Date</td>
                            <td>Closing Date</td>
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
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name"
                                    value="" maxlength="50" required="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">Company</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="company" name="company"
                                            placeholder="Enter Company" value="" maxlength="50" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="location" class="col-sm-2 control-label">Location</label>
                                    <div class="col-sm-12">
                                        <select name="location" id="location" class="form-control"></select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Field</label>
                                    <div class="col-sm-12">
                                        <select name="field" id="field" class="form-control"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Source</label>
                                    <div class="col-sm-12">
                                        <select name="source" id="source" class="form-control"></select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="min_salary" class="col control-label">Minimum Salary</label>
                                    <div class="col-sm-12">
                                        <input type="number" class="form-control" id="min_salary" name="min_salary"
                                            required="">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="max_salary" class="col control-label">Maximum Salary</label>
                                    <div class="col-sm-12">
                                        <input type="number" class="form-control" id="max_salary" name="max_salary"
                                            required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="posting_date" class="col control-label">Posting Date</label>
                                    <div class="col-sm-12">
                                        <input type="date" class="form-control" id="posting_date" name="posting_date"
                                            required="">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="closing_date" class="col control-label">Closing Date</label>
                                    <div class="col-sm-12">
                                        <input type="date" class="form-control" id="closing_date" name="closing_date"
                                            required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <img src="" alt="Logo Perusahaan" id="company-logo" class="img-fluid" style="width: 100%;">
                            </div>
                            <div class="col-10">
                                <div class="form-group">
                                    <label for="image" class="col control-label">Image URL</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="image" name="image"
                                            required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="url" class="col-sm-2 control-label">URL</label>
                            <div class="col-sm-12">
                                <input type="url" class="form-control" id="url" name="url" placeholder="Enter URL"
                                    required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-12">
                                <textarea class="form-control" id="description" name="description"
                                    placeholder="Enter Description" required="" rows="5"></textarea>
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
        var table = $('#jobs-table').DataTable({
            processing: true,
            serverSide: true,
            responsive: false,
            scrollX: true,
            ajax: '{{ route('job.index') }}',
            columns: [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'company',
                    name: 'company'
                },
                {
                    data: 'id_job_location',
                    name: 'id_job_location'
                },
                {
                    data: 'id_job_source',
                    name: 'id_job_source'
                },
                {
                    data: 'id_job_field',
                    name: 'id_job_field'
                },
                {
                    data: 'min_salary',
                    name: 'min_salary'
                },
                {
                    data: 'max_salary',
                    name: 'max_salary'
                },
                {
                    data: 'posting_date',
                    name: 'posting_date'
                },
                {
                    data: 'closing_date',
                    name: 'closing_date'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });
        $.get('/job-field/json', function(data) {
            for (let i=0; i<data.length; i++) {
                var option = new Option(data[i].name, data[i].id);
                $('#field').append($(option));
            }
        });
        $.get('/job-source/json', function(data) {
            for (let i=0; i<data.length; i++) {
                var option = new Option(data[i].name, data[i].id);
                $('#source').append($(option));
            }
        });
        $.get('/job-location/json', function(data) {
            for (let i=0; i<data.length; i++) {
                var option = new Option(data[i].name, data[i].id);
                $('#location').append($(option));
            }
        });
        $('#create').click(function () {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Job");
            $('#ajax-modal').modal('show');
            $("#form :input").attr("disabled", false);
        });
        $('body').on('click', '#show', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", true);
            $('#title-modal').html("Show Job");
            $.get('/job/' + id, function (data) {
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#name').val(data.name);
                $('#company').val(data.company);
                $('#company-logo').attr('src', data.image);
                $('#image').val(data.image);
                $('#location').val(data.id_job_location);
                $('#field').val(data.id_job_field);
                $('#source').val(data.id_job_source);
                $('#min_salary').val(data.min_salary);
                $('#max_salary').val(data.max_salary);
                $('#posting_date').val(data.posting_date);
                $('#closing_date').val(data.closing_date);
                $('#url').val(data.url);
                $('#description').val(data.description);
            });
        });
        $('body').on('click', '#edit', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", false);
            $.get('/job/' + id + '/edit', function (data) {
                $('#title-modal').html("Edit Job");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#name').val(data.name);
                $('#company').val(data.company);
                $('#company-logo').attr('src', data.image);
                $('#image_url').val(data.image);
                $('#location').val(data.id_job_location);
                $('#field').val(data.id_job_field);
                $('#source').val(data.id_job_source);
                $('#min_salary').val(data.min_salary);
                $('#max_salary').val(data.max_salary);
                $('#posting_date').val(data.posting_date);
                $('#closing_date').val(data.closing_date);
                $('#url').val(data.url);
                $('#description').val(data.description);
            });
        });
        $('body').on('click', '#delete', function () {
            var id = $(this).data('id');
            if (confirm("Are You Sure Want to Delete !")) {
                $.ajax({
                    type: "DELETE",
                    url: 'job/' + id,
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
                url: "{{ route('job.store') }}",
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
        $('#deleteExpired').click(function() {
            if (confirm("Are you sure want to delete expired job?")) {
                $.ajax({
                    type: "DELETE",
                    url: 'job-delete',
                    success: function (data) {
                        table.draw();
                        alert(data.jumlah + " Jobs Deleted In " + data.date);
                    },
                    error: function (data) {
                        console.log('Error: ', data);
                    }
                });
            }
        });
    });
</script>
@endpush
