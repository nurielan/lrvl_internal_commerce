@extends('front.layout')

@section('title', 'Login')

@section('content')
<div class="main">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<div class="form-login-register">
						<h3 class="title">My Account</h3>
						<div class="col-md-6">
							<div class="form-login">
								<h3>Login User</h3>
								{{ Form::open(['route' => 'f_buyer_login_process']) }}
									<div class="form-group">
										{{ Form::label('phone_number_login', 'Phone Number or E-Mail') }}
										{{ Form::text('phone_number_login', '', ['placeholder' => 'Phone Number or E-Mail']) }}
									</div>

									<div class="form-group">
										{{ Form::label('password_login', 'Password') }}
										{{ Form::password('password_login', ['placeholder' => 'Password']) }}
									</div>

									<div class="form-group">
										{{ Form::label('captcha_login', 'Captcha') }}
										<div class="row">
											<div class="col-md-6">
												{{ Form::password('captcha_login', ['placeholder' => 'Captcha']) }}
											</div>

											<div class="col-md-6">
												<img class="img-responsive" src="{{ Captcha::img() }}">
											</div>
										</div>
									</div>

									@if (Session::has('event.login.error'))
									<div class="form-group">
										<div class="alert alert-danger">
											<button class="close" type="button" data-dismiss="alert">&times;</button>

											@foreach (Session::get('event.login.error') as $errors_item)
											<p>{{ $errors_item }}</p>
											@endforeach
										</div>
									</div>
									@elseif (Session::has('event.login.success'))
									<div class="form-group">
										<div class="alert alert-success">
											<button class="close" type="button" data-dismiss="alert">&times;</button>
											<p>{{ Session::get('event.success') }}</p>
										</div>
									</div>
									@endif

									<div class="form-group">
										{{ Form::button('Login', ['class' => 'btn btn-default', 'type' => 'submit']) }}
									</div>
								{{ Form::close() }}
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-login">
								<h3>Register User</h3>
								{{ Form::open(['route' => 'f_buyer_store']) }}
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												{{ Form::label('name', 'Name') }}
												{{ Form::text('name', '', ['placeholder' => 'Name']) }}
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												{{ Form::label('email', 'E-Mail*') }}
												{{ Form::text('email', '', ['placeholder' => 'E-Mail']) }}
											</div>
										</div>
									</div>

									<div class="form-group">
										{{ Form::label('password_register', 'Password') }}
										{{ Form::password('password_register', ['placeholder' => 'Password']) }}
									</div>

									<div class="form-group">
										{{ Form::label('repeat_password_register', 'Password Confirm') }}
										{{ Form::password('repeat_password_register', ['placeholder' => 'Password Confirm']) }}
									</div>

									<div class="form-group">
										{{ Form::label('phone_number_register', 'Phone Number') }}
										{{ Form::text('phone_number_register', '', ['placeholder' => 'Phone Number']) }}
									</div>

									<div class="form-group">
										{{ Form::label('address', 'Address') }}
										{{ Form::text('address', '', ['placeholder' => 'Address']) }}
									</div>

									@if (Session::has('event.register.error'))
									<div class="form-group">
										<div class="alert alert-danger">
											<button class="close" type="button" data-dismiss="alert">&times;</button>

											@foreach (Session::get('event.register.error') as $errors_item)
											<p>{{ $errors_item }}</p>
											@endforeach
										</div>
									</div>
									@elseif (Session::has('event.register.success'))
									<div class="form-group">
										<div class="alert alert-success">
											<button class="close" type="button" data-dismiss="alert">&times;</button>
											<p>{{ Session::get('event.register.success') }}</p>
										</div>
									</div>
									@endif

									<div class="form-group">
										<span class="label label-info">*Hindari pemakaian email hotmail.com, live.com, outlook.com karena akan mengakibatkan email tidak terkirim</span>
									</div>

									<div class="form-group">
										{{ Form::button('Register', ['class' => 'btn btn-default', 'type' => 'submit']) }}
									</div>
								{{ Form::close() }}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection