@extends('front.layout')

@section('title', 'Product Cart Shipping')

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
								{{ Form::open(['name' => 'form_shipping', 'route' => 'f_product_cart_shipping_process']) }}
									<div class="form-group">
										<h3>Shipping</h3><hr>
									</div>

									<div class="form-group">
										<h4>
											Service: {{ $shipping_cost->results[0]->name }}<br>
											Weight: {{ number_format(Session::get('cart.weight'), 0, ',', '.') }} g<br>
											Destination: {{ Session::get('buyer.destination') }}
										</h4>
									</div>

									<div class="form-group">
										<div class="table-responsive">
											<table class="table table-condensed table-striped table-hover">
												<tr>
													<th>Package</th>
													<th>Value (Rp.)</th>
													<th>Estimation (Days)</th>
													<th width="1" align="center">Choose</th>
												</tr>

												@foreach ($shipping_cost->results[0]->costs as $sp1)
												<tr>
													<td rowspan="{{ count($sp1->cost) + 1 }}">{{ $sp1->description.' ('.$sp1->service.')' }}</td>
												</tr>
													@foreach ($sp1->cost as $sp2)
													<tr>
														<td>{{ number_format($sp2->value, 0, ',', '.') }}</td>
														<td>{{ ($sp2->etd == '' ? 0 : $sp2->etd) }}</td>
														<td width="1" align="center">
															{{ Form::radio('service_package', $shipping_cost->results[0]->name.', '.$sp1->description.' ('.$sp1->service.'), '.$sp2->value.', '.($sp2->etd == '' ? 0 : $sp2->etd).'') }}
														</td>
													</tr>
													@endforeach
												@endforeach
											</table>
										</div>
									</div>

									@if (Session::has('event.shipping.error'))
									<div class="form-group">
										<div class="alert alert-danger">
											<button class="close" type="button" data-dismiss="alert">&times;</button>

											@foreach (Session::get('event.shipping.error') as $errors_item)
											<p>{{ $errors_item }}</p>
											@endforeach
										</div>
									</div>

									@elseif (Session::has('event.shipping.success'))
									<div class="form-group">
										<div class="alert alert-success">
											<button class="close" type="button" data-dismiss="alert">&times;</button>
											<p>{{ Session::get('event.shipping.success') }}</p>
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