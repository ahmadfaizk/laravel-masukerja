@extends('admin.datatable')

@section('title', 'Article')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table id="article-table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Name</td>
                            <td>Kategory</td>
                            <td>Created At</td>
                            <td>Deskripsi</td>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    $(document).ready( function() {
        $('#article-table').DataTable({
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
                    data: 'description',
                    name: 'description'
                },
            ]
        });
    });
</script>
@endpush
