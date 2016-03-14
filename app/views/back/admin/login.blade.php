@extends('back.layout')

@section('title')
Login
@stop

@section('content')
<div class="col-md-4 col-md-offset-4">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<span>Internal Commerce Login</span>
		</div>

		<div class="panel-body">
			{{ Form::open(['route' => 'b_admin_login_process']) }}
				<div class="form-group">
					{{ Form::text('username', '', ['class' => 'form-control', 'placeholder' => 'Username']) }}
				</div>

				<div class="form-group">
					{{ Form::password('password', ['class' => 'form-control', 'placeholder' => 'Password']) }}
				</div>

				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
							{{ Form::text('captcha', '', ['class' => 'form-control', 'placeholder' => 'Captcha']) }}
						</div>

						<div class="col-md-6">
							<img src="{{ Captcha::img() }}" width="100%">
						</div>
					</div>
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
							<a class="btn btn-primary" href="{{ route('f_home') }}"><span class="fa fa-home"></span>&nbsp;Site</a>
						</div>

						<div class="btn-group">
							<button class="btn btn-success" type="submit"><span class="fa fa-sign-in"></span>&nbsp;Enter</button>
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
@stop
