@extends('back.layout')

@section('title')
Edit
@stop

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>EDIT</span>
			</div>

			<div class="panel-body">
				@include('back.point.menu')
			
				{{ Form::open(['route' => 'b_point_update', 'files' => true]) }}
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">Rp</span>
							{{ Form::text('price', $point->price, ['class' => 'form-control', 'placeholder' => 'Price']) }}
						</div>
					</div>

					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">Rp</span>
							{{ Form::text('price_back', $point->price_back, ['class' => 'form-control', 'placeholder' => 'Price Back']) }}
						</div>
					</div>

					@if (Session::has('event.point.error'))
					<div class="form-group">
						<div class="alert alert-danger">
							<button class="close" data-dismiss="alert">&times;</button>

							@foreach (Session::get('event.point.error') as $errors_item)
							<p>{{ $errors_item }}</p>
							@endforeach
						</div>
					</div>
					@elseif (Session::has('event.point.success'))
					<div class="form-group">
						<div class="alert alert-success">
							<button class="close" data-dismiss="alert">&times;</button>

							<span>{{ Session::get('event.point.success') }}</span>
						</div>
					</div>
					@endif

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_point_index') }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
							</div>

							<div class="btn-group">
								<button class="btn btn-success" type="submit"><span class="fa fa-edit"></span>&nbsp;Edit</button>
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