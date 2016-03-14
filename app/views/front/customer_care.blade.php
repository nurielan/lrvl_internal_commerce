@extends('front.layout')

@section('title', 'Customer Care')

@section('content')
<div class="main">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<div class="contact">
						<h3 class="title">Got Any Question?</h3>
						<h2 class="title phone">Call.<span> {{ substr($profile->phone_number, 0, 3).'-'.substr($profile->phone_number, 2) }}</span></h2>
						<hr>
						<div class="col-md-6">
							<div class="form-contact">
								<h3>Get In Touch</h3>
								<h4>Write us letter</h4>
								{{ Form::open(['route' => 'f_customer_care_store']) }}
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												{{ Form::label('name', 'Name') }}
												{{ Form::text('name', '') }}
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												{{ Form::label('subject', 'Subject') }}
												{{ Form::text('subject', '') }}
											</div>
										</div>
									</div>

									<div class="form-group">
										{{ Form::label('email', 'E-Mail') }}
										{{ Form::text('email', '') }}
									</div>

									<div class="form-group">
										{{ Form::label('message', 'Message') }}
										{{ Form::textarea('message', '') }}
									</div>

									<div class="form-group">
										{{ Form::label('captcha', 'Captcha') }}
										<div class="row">
											<div class="col-md-6">
												{{ Form::text('captcha', '') }}
											</div>

											<div class="col-md-6">
												<img src="{{ Captcha::img() }}">
											</div>
										</div>
									</div>

									@if ($errors->has())
									<div class="form-group">
										<div class="alert alert-danger">
											<button class="close" type="button" data-dismiss="alert">&times;</button>

											@foreach ($errors->all() as $errors_item)
											<p>{{ $errors_item }}</p>
											@endforeach
										</div>
									</div>
									@elseif (Session::has('event.success'))
									<div class="form-group">
										<div class="alert alert-success">
											<button class="close" type="button" data-dismiss="alert">&times;</button>
											<p>{{ Session::get('event.success') }}</p>
										</div>
									</div>
									@endif

									<div class="form-group">
										{{ Form::button('Send Mail', ['class' => 'btn btn-default', 'type' => 'submit']) }}
									</div>
								{{ Form::close() }}
							</div>
						</div>

						<div class="col-md-6">
							<div class="address-block">
								<div class="img-logo">
									<img src="{{ asset('assets/images/logo.png') }}" alt="Internal">
								</div>

								<div class="address">
								<h3>Our Address</h3>
									<!-- <h4>{{ ucwords($profile->address) }}</h4> -->
									<!-- <h4>Indonesia</h4> -->
									<h4>{{ substr($profile->phone_number, 0, 3).'-'.substr($profile->phone_number, 2) }}</h4>
									<h4>{{ $profile->email }}</h4>
									<div class="social">
										<h4>Social Links</h4>
										<a href="#" target="_blank"><span class="fa fa-facebook-official"></span></a>
										<a href="#" target="_blank"><span class="fa fa-twitter"></span></a>
										<a href="#" target="_blank"><span class="fa fa-instagram"></span></a>
									</div>
								</div>
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