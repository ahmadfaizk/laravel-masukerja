@extends('admin.datatable')

@section('title', 'Questions')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table id="article-table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Soal</td>
                            <td>Kode Soal</td>
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
            ajax: '{{ route('question.index') }}',
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
            ]
        });
    });
</script>
@endpush
