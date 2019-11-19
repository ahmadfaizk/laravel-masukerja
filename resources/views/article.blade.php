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
                            <td>Kategory</td>
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
                    <div class="form-group">
                        <label for="category" class="col-sm-2 control-label">Kategori</label>
                        <div class="col-sm-12">
                            <select name="category" id="category" class="form-control">
                            @foreach ($kategori as $item)
                                <option value="{{$item->id}}">{{$item->name}}</option>
                            @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-12">
                            <textarea id="description" name="description" class="form-control" placeholder="Enter Description" value="" required=""></textarea>
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
        $('#create').click(function() {
            $('#btn-save').val("create");
            $('#id').val('');
            $('#form').trigger("reset");
            $('#title-modal').html("Add New Job Source");
            $('#ajax-modal').modal('show');
        });
        $('body').on('click', '#edit', function() {
            var id = $(this).data('id');
            console.log($(this).data);
            $.get('/article/' + id + '/edit', function(data) {
                $('#name-error').hide();
                $('#title-modal').html("Edit Job Source");
                $('#ajax-modal').modal('show');
                $('#id').val(data.id);
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
            $.ajax({
                data: $('#form').serialize(),
                url: '{{ route('article.store') }}',
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
