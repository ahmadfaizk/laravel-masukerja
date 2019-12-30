@extends('admin.datatable')

@section('title', 'Article')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <a href="javascript:void(0)" class="btn btn-info ml-3" id="create">Add New</a>
            </div>
            <div class="card-body">
                <table id="article-table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Name</td>
                            <td>Kategori</td>
                            <td>Created At</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ajax-modal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
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
                                value="" required="">
                        </div>
                    </div>
                    {{-- <div class="form-group">
                        <label for="image" class="col-sm-2 control-label">Image</label>
                        <div class="row">
                            <div class="col-sm-4">
                                <img src="#" id="article-image" alt="Your Image" class="img-fluid">
                            </div>
                            <div class="col-sm-8">
                                <input type="file" class="form-control-file" id="image" name="image">
                            </div>
                        </div>
                    </div> --}}
                    <div class="form-group">
                        <label for="category" class="col-sm-2 control-label">Kategori</label>
                        <div class="col-sm-12">
                            <select name="category" id="category" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-12">
                            <textarea id="description" name="description" class="form-control" placeholder="Enter Description" value="" required="" rows="6"></textarea>
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
        var table = $('#article-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ route('article.index') }}',
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'id_kategory',
                    name: 'id_kategory'
                },
                {
                    data: 'date',
                    name: 'date'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                },
            ]
        });
        $.get('/article-category/', function(data) {
            for (let i=0; i<data.data.length; i++) {
                var option = new Option(data.data[i].name, data.data[i].id);
                $('#category').append($(option));
            }
        });
        $('body').on('click', '#show', function () {
            var id = $(this).data('id');
            $("#form :input").attr("disabled", true);
            $('#title-modal').html("Show Article");
            $.get('/article/' + id, function (data) {
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#category').val(data.id_kategory);
                $('#name').val(data.name);
                $('#description').val(data.description);
            });
        });
        $('#create').click(function() {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Article");
            $('#ajax-modal').modal('show');
            $("#form :input").attr("disabled", false);
        });
        $('body').on('click', '#edit', function() {
            $("#form :input").attr("disabled", false);
            var id = $(this).data('id');
            $.get('/article/' + id + '/edit', function(data) {
                $('#name-error').hide();
                $('#title-modal').html("Edit Article");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
                $('#category').val(data.id_kategory);
                $('#name').val(data.name);
                $('#description').val(data.description);
            });
        });
        $('body').on('click', '#delete', function() {
            var id = $(this).data('id');
            if (confirm("Are You Sure Want to Delete !")) {
                $.ajax({
                    type: "DELETE",
                    url: '/article/' + id,
                    success: function(data) {
                        table.draw();
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
            // var datas = new FormData();
            // var files = $('#image').files;
            // datas.append('image', files);
            //datas.append('image', $('#image').files);
            $.ajax({
                data: $('#form').serialize(),
                url: '{{ route('article.store') }}',
                type: "POST",
                // cache: false,
                // contentType: false,
                // processData: false,
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
