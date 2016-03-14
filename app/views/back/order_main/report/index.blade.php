@extends('back.layout')

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>Report Ordered</span>
			</div>

			<div class="panel-body">
				@include('back.order_main.menu')

				{{ Form::open(['route' => 'b_order_main_report_details', 'files' => true]) }}
					<div class="form-group">
						{{ Form::input('text', 'date_1', null, ['required', 'class' => 'form-control tanggal' ,'placeholder' => 'First Date', 'id' =>'date1']) }}
					</div>

					<div class="form-group">
						{{ Form::input('text', 'date_2', null, ['required', 'class' => 'form-control tanggal' ,'placeholder' => 'Last Date', 'id' =>'date2']) }}
					</div>

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_order_main_index') }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
							</div>

							<div class="btn-group">
								<button class="btn btn-success" type="submit"><span class="fa fa-edit"></span>&nbsp;Get Report</button>
							</div>

							<div class="btn-group">
								<button class="btn btn-default" type="reset"><span class="fa fa-eraser"></span>&nbsp;Reset</button>
							</div>
						</div>
					</div>
				{{ Form::close() }}
			</div>
		</div>
	</div>
</div>
@stop