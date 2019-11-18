@extends('admin.datatable')

@section('title', 'Answer')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table id="article-table" class="table table-striped">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Jawaban</td>
                            <td>Kode Jawaban</td>
                            <td>Soal</td>
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
            ajax: '{{ route('answer.index') }}',
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
                    data: 'id_question',
                    name: 'id_question'
                },
            ]
        });
    });
</script>
@endpush
