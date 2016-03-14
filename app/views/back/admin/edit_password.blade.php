@extends('back.layout')

@section('title')
Edit Password
@stop

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>EDIT PASSWORD</span>
			</div>

			<div class="panel-body">
				@include('back.admin.menu')
			
				{{ Form::open(['route' => 'b_admin_update_password']) }}
					<div class="form-group">
						{{ Form::password('old_password', ['class' => 'form-control', 'placeholder' => 'Old Password']) }}
					</div>

					<div class="form-group">
						{{ Form::password('new_password', ['class' => 'form-control', 'placeholder' => 'New Password']) }}
					</div>

					<div class="form-group">
						{{ Form::password('repeat_new_password', ['class' => 'form-control', 'placeholder' => 'Repeat New Password']) }}
					</div>

					@if ($errors->has())
					<div class="form-group">
						<div class="alert alert-info">
							<button class="close" data-dismiss="alert">&times;</button>

							@foreach ($errors->all() as $errors_item)
							<p>{{ $errors_item }}</p>
							@endforeach
						</div>
					</div>
					@elseif (Session::has('event'))
					<div class="form-group">
						<div class="alert alert-info">
							<button class="close" data-dismiss="alert">&times;</button>

							<span>{{ Session::get('event') }}</span>
						</div>
					</div>
					@endif

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_admin_index') }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
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