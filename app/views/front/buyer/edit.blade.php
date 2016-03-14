@extends('front.layout')

@section('title', 'Edit')

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
								<span>Edit</span>
							</div>

							<div class="panel-body">
								{{ Form::open(['route' => 'f_buyer_edit_process']) }}
								<div class="row">
									<div class="col-md-9">
										<div class="form-group">
											{{ Form::label('name', 'Name') }}
											{{ Form::text('name', Auth::buyer()->user()->name, ['class' => 'form-control']) }}
										</div>

										<div class="form-group">
											{{ Form::label('email', 'E-Mail') }}
											{{ Form::text('email', Auth::buyer()->user()->email, ['class' => 'form-control']) }}
										</div>

										<div class="form-group">
											{{ Form::label('phone_number', 'Phone Number') }}
											{{ Form::text('phone_number', Auth::buyer()->user()->phone_number, ['class' => 'form-control']) }}
										</div>

										<div class="form-group">
											{{ Form::label('address', 'Address') }}
											{{ Form::text('address', Auth::buyer()->user()->address, ['class' => 'form-control']) }}
										</div>

										<div class="form-group">
											{{ Form::label('message', 'Message') }}
											{{ Form::textarea('message', Auth::buyer()->user()->message, ['class' => 'form-control']) }}
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