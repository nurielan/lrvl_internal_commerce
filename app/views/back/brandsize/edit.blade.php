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
				@include('back.brandsize.menu')
			
				{{ Form::open(['route' => 'b_brandsize_update']) }}
					{{ Form::hidden('id', $brandsize->id) }}

					<div class="form-group">
						{{ Form::text('name', $brandsize->name, ['class' => 'form-control', 'placeholder' => 'Title']) }}
					</div>

					<div class="form-group">
						{{ Form::textarea('description', $brandsize->description, ['class' => 'form-control', 'placeholder' => 'Content']) }}
					</div>

					@if (Session::has('event.brandsize.error'))
					<div class="form-group">
						<div class="alert alert-danger">
							<button class="close" data-dismiss="alert">&times;</button>

							@foreach (Session::get('event.brandsize.error') as $errors_item)
							<p>{{ $errors_item }}</p>
							@endforeach
						</div>
					</div>
					@elseif (Session::has('event.brandsize.success'))
					<div class="form-group">
						<div class="alert alert-success">
							<button class="close" data-dismiss="alert">&times;</button>

							<span>{{ Session::get('event.brandsize.success') }}</span>
						</div>
					</div>
					@endif

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_brandsize_show', Session::get('brandsize.brand_id')) }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
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