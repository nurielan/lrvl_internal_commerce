@extends('front.layout')

@section('title', 'Product Cart')

@section('content')
	<div class="main">
		<!-- left right content -->
		<div class="container">
			<div class="col-md-12">
				@include('front.product.cart.breadcrumb')

				@if (count(Cart::content()) == 0)
				<span>No Product here.</span>
				@else
				<h3 class="title">Cart</h3>
				<div class="table-cart">
					{{ Form::open(['route' => 'f_product_cart_update']) }}
						<div class="row">
							<div class="col-md-9">
							<div class="table-responsive">
								<table class="table table-condensed">
									<thead>
										<tr>
											<td>Product</td>
											<td align="right">Price (Rp)</td>
											<td align="center">Quantity</td>
											<td align="center">Weight (g)</td>
											<td align="right">Total (Rp)</td>
											<td width="1"></td>
										</tr>
									</thead>
									<tbody>
										@foreach (Cart::content() as $cart_item)
										<tr>
											<td>{{ ucwords($cart_item->name) }}</td>
											<td align="right">{{ number_format($cart_item->price, 0, ',', '.') }}</td>
											<td align="center">{{ Form::number('quantity[]', $cart_item->qty, ['min' => 1]) }}</td>
											<td align="center">{{ number_format($cart_item->options->weight * $cart_item->qty, 0, ',', '.') }}</td>
											<td align="right">{{ number_format($cart_item->subtotal, 0, ',', '.') }}</td>
											<td width="1"><a class="btn btn-danger" href="{{ route('f_product_cart_destroy', $cart_item->rowid) }}"><span class="fa fa-close"></span></a></td>
										</tr>
										@endforeach
									</tbody>
								</table>
							</div>
							</div>
							<div class="col-md-3">
								<div class="sum-cart">
									<h4>Cart Totals</h4>
									<hr>
									<h4 class="sum-total">Total Weight<span class="total">{{ number_format(Session::get('cart.weight'), 0, ',', '.') }} g</span></h4>
									<h4 class="sum-total">Total Price<span class="total">Rp. {{ number_format(Cart::total(), 0, ',', '.') }}</span></h4>
									<div class="row">
										<div class="col-md-6">
											{{ Form::button('Update Cart', ['class' => 'btn btn-default update-cart', 'type' => 'submit']) }}
										</div>
										<div class="col-md-6">
											<a class="btn btn-default checkout" href="{{ route('f_product_cart_buyer') }}">Buyer Details</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						{{ $errors->first('quantity') }}
					{{ Form::close() }}
				</div>
				@endif
			</div>
		</div>

		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection