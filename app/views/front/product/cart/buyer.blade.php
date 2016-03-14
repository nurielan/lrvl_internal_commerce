@extends('front.layout')

@section('title', 'Product Cart Buyer')

@section('content')
	<div class="main">
		<!-- left right content -->
		<div class="container">
			<div class="col-md-12">
				@include('front.product.cart.breadcrumb')

				<h3 class="title">Buyer Details</h3>
				<div class="form-registration-details">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="form-login">
								{{ Form::open(['name' => 'form_buyer', 'route' => 'f_product_cart_buyer_process']) }}
									<div class="form-group">
										<h3>Buyer</h3><hr>
									</div>

									<div class="form-group">
										<div class="checkbox">
											<label>
												{{ Form::checkbox('account', 1, false); }} Use custom data account.
											</label>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												{{ Form::label('name', 'Name') }}
												{{ Form::text('name', Auth::buyer()->user()->name, ['placeholder' => 'Name', 'readonly']) }}
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												{{ Form::label('email', 'E-Mail') }}
												{{ Form::text('email', Auth::buyer()->user()->email, ['placeholder' => 'E-Mail', 'readonly']) }}
											</div>
										</div>
									</div>

									<div class="form-group">
										{{ Form::label('phone_number', 'Phone Number') }}
										{{ Form::text('phone_number', Auth::buyer()->user()->phone_number, ['placeholder' => 'Phone Number', 'readonly']) }}
									</div>

									<div class="form-group">
										{{ Form::label('address', 'Address') }}
										{{ Form::text('address', Auth::buyer()->user()->address, ['placeholder' => 'Address', 'readonly']) }}
									</div>


									<div class="form-group">
										{{ Form::label('message', 'Message') }}
										{{ Form::textarea('message', Auth::buyer()->user()->message, ['placeholder' => 'Message', 'readonly']) }}
									</div>

									<div class="form-group">
										<h3>Shipping</h3><hr>
									</div>

									<div class="form-group">
										{{ Form::hidden('destination_id') }}
										{{ Form::label('destination', ' City Destination') }}
										{{ Form::text('destination', '', ['placeholder' => 'City Destination']) }}
									</div>

									<div class="form-group">
										<select class="form-control" name="service">
											<option value="jne" selected>JNE (Jalur Nugraha Ekakurir)</option>
											<option value="tiki">TIKI (Citra van Titipan Kilat)</option>
											<option value="pos">POS (POS Indonesia)</option>
										</select>
									</div>

									@if (Auth::buyer()->user()->point > 0)
									<div class="form-group">
										<h3>Point <span id="spend_point_number">{{ Auth::buyer()->user()->point }}</span></h3><hr>
									</div>

									<div class="form-group">
										<div class="row">
											{{ Form::hidden('price_back', Session::get('price_back')) }}
											<div class="col-xs-6">
												{{ Form::label('spend_point', 'Spend Point') }}
												{{ Form::text('spend_point', '', ['placeholder' => 'Spend Point']) }}
											</div>
											<div class="col-xs-6">
												{{ Form::label('spend_point', 'Spend Point Value') }}
												<div class="input-group">
													<span class="input-group-addon">Rp</span>
													{{ Form::text('spend_point_value', '', ['placeholder' => 'Spend Point Value', 'disabled']) }}
												</div>
											</div>
										</div>
									</div>
									@endif

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
											<p>{{ Session::get('event.success') }}</p>
										</div>
									</div>
									@endif

									<div class="form-group">
										{{ Form::button('Next', ['class' => 'btn btn-default', 'type' => 'submit']) }}
									</div>
								{{ Form::close() }}
							</div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</div>

		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection