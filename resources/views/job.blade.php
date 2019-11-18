@extends('admin.datatable')

@section('title', 'Jobs')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table id="jobs-table" class="table table-striped">
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
        $('#jobs-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ route('job.index') }}',
            columns: [{
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
                    data: 'location',
                    name: 'location'
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
            ]
        });
    });
</script>
@endpush
