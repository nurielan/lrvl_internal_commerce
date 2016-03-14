@extends('front.layout')

@section('title', 'Product Cart Detail')

@section('content')
	<div class="main">
		<!-- left right content -->
		<div class="container">
			<div class="col-md-12">
				@include('front.product.cart.breadcrumb')

				<h3 class="title">Shipping Details</h3>
				<div class="form-registration-details">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="form-login">
								{{ Form::open(['name' => 'form_shipping', 'route' => 'f_product_cart_detail_process']) }}
									<div class="form-group">
										<h3>Detail</h3>
									</div>

									<div class="form-group">
										<table class="table table-condensed">
											<tr>
												<td>Name</td>
												<td>:</td>
												<td>{{ Session::get('buyer.name') }}</td>
											</tr>
											<tr>
												<td>E-Mail</td>
												<td>:</td>
												<td>{{ Session::get('buyer.email') }}</td>
											</tr>
											<tr>
												<td>Phone Number</td>
												<td>:</td>
												<td>{{ substr(Session::get('buyer.phone_number'), 0, 3).'-'.substr(Session::get('buyer.phone_number'), 2) }}</td>
											</tr>
											<tr>
												<td>Address</td>
												<td>:</td>
												<td>{{ Session::get('buyer.address') }}</td>
											</tr>
											<tr>
												<td>Message</td>
												<td>:</td>
												<td>{{ Session::get('buyer.message') }}</td>
											</tr>
											<tr>
												<td>Shipping Destination</td>
												<td>:</td>
												<td>{{ Session::get('buyer.destination') }}</td>
											</tr>
											<tr>
												<td>Shipping Service</td>
												<td>:</td>
												<td>{{ Session::get('buyer.service_delivery') }}</td>
											</tr>
											<tr>
												<td>Shipping Package</td>
												<td>:</td>
												<td>{{ Session::get('buyer.service_package') }}</td>
											</tr>
											<tr>
												<td>Shipping Value</td>
												<td>:</td>
												<td>Rp {{ number_format(Session::get('buyer.cost'), 0, ',', '.') }}</td>
											</tr>
											<tr>
												<td>Shipping Estimation</td>
												<td>:</td>
												<td>{{ Session::get('buyer.estimation').' '.(Session::get('buyer.estimation') == 1 || Session::get('buyer.estimation') == 0 ? 'Day' : 'Days') }}</td>
											</tr>
										</table>
									</div>

									<div class="form-group">
										<table class="table table-condensed table-hover">
											<tr>
												<th>No.</th>
												<th>Product</th>
												<th>Quantity</th>
												<th>Weight (g)</th>
												<th>Total (Rp.)</th>
											</tr>
											<?php
											$i = 1;
											?>
											@foreach (Cart::content() as $cart_item)
											<tr>
												<td>{{ $i++ }}</td>
												<td>{{ $cart_item->name }}</td>
												<td>{{ $cart_item->qty }}</td>
												<td>{{ number_format($cart_item->options->weight * $cart_item->qty, 0, ',', '.') }}</td>
												<td>{{ number_format($cart_item->price * $cart_item->qty, 0, ',', '.') }}</td>
												<?php
												$qty[] = $cart_item->qty;
												?>
											</tr>
											@endforeach
											<tr>
												<th></th>
												<th></th>
												<th>{{ array_sum($qty) }}</th>
												<th>{{ number_format(Session::get('cart.weight'), 0, ',', '.') }}</th>
												<th>{{ number_format(Cart::total(), 0, '', '.') }}</th>
											</tr>
											<tr>
												<td colspan="4">Priceback Point</td>
												<td>{{ number_format(Session::get('price_back'), 0, ',', '.') }}</td>
											</tr>
											<tr>
												<td colspan="4">Shipping Price</td>
												<td>{{ number_format(Session::get('buyer.cost'), 0, ',', '.') }}</td>
											</tr>
											<tr>
												<td colspan="4">Total Price</td>
												<td>{{ number_format(Session::get('buyer.cost') + Cart::total() - Session::get('price_back'), 0, ',', '.') }}</td>
											</tr>
										</table>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-2">
												<a class="btn btn-danger" href="{{ route('f_product_cart_index') }}">Repeat</a>
											</div>

											<div class="col-md-8"></div>

											<div class="col-md-2">
												{{ Form::button('Finish', ['class' => 'btn btn-success', 'type' => 'submit']) }}
											</div>
										</div>
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