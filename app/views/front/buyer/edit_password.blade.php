@extends('front.layout')

@section('title', 'Edit Password')

@section('content')
	<div class="main-index main">
		<div class="container" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3">
						@include('front.buyer.menu')
					</div>

					<div class="col-md-9">
						<div class="panel panel-default">
							<div class="panel-heading">
								<span>Edit Password</span>
							</div>

							<div class="panel-body">
								{{ Form::open(['route' => 'f_buyer_edit_password_process']) }}
								<div class="row">
									<div class="col-md-9">
										<div class="form-group">
											{{ Form::label('old_password', 'Old Password') }}
											{{ Form::password('old_password', ['class' => 'form-control']) }}
										</div>

										<div class="form-group">
											{{ Form::label('new_password', 'Repeat New Password') }}
											{{ Form::password('new_password', ['class' => 'form-control']) }}
										</div>

										<div class="form-group">
											{{ Form::label('repeat_new_password', 'Repeat New Password') }}
											{{ Form::password('repeat_new_password', ['class' => 'form-control']) }}
										</div>

										@if (Session::has('event.buyer.error'))
										<div class="form-group">
											<div class="alert alert-danger">
												<button class="close" type="button" data-dismiss="alert">&times;</button>

												@foreach (Session::get('event.buyer.error') as $errors_item)
												<p>{{ $errors_item }}</p>
												@endforeach
											</div>
										</div>
										@elseif (Session::has('event.buyer.success'))
										<div class="form-group">
											<div class="alert alert-success">
												<button class="close" type="button" data-dismiss="alert">&times;</button>
												<p>{{ Session::get('event.buyer.success') }}</p>
											</div>
										</div>
										@endif

										<div class="form-group">
											{{ Form::button('Save', ['class' => 'btn btn-primary', 'type' => 'submit']) }}
										</div>
									</div>

									<div class="col-md-3">
										
									</div>
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