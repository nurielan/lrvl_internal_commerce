@extends('back.layout')

@section('title')
Show
@stop

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>SHOW</span>
			</div>

			<div class="panel-body">
				@include('back.order_main.menu')
			
				<table class="table table-condensed table-striped table-hover">
					<tbody>
						<tr>
							<td colspan="3"><h3>Buyer</h3></td>
						</tr>

						@if (count($order_main->buyer_custom) == 0)
						<tr>
							<td>Name</td>
							<td>:</td>
							<td>{{ $order_main->buyer->name }}</td>
						</tr>

						<tr>
							<td>E-Mail</td>
							<td>:</td>
							<td>{{ $order_main->buyer->email }}</td>
						</tr>

						<tr>
							<td>Phone Number</td>
							<td>:</td>
							<td>{{ $order_main->buyer->phone_number }}</td>
						</tr>

						<tr>
							<td>Address</td>
							<td>:</td>
							<td>{{ $order_main->buyer->address }}</td>
						</tr>

						<tr>
							<td>Message</td>
							<td>:</td>
							<td>{{ $order_main->buyer->message }}</td>
						</tr>
						@else
						<tr>
							<td>Name</td>
							<td>:</td>
							<td>{{ $order_main->buyer_custom->name }}</td>
						</tr>

						<tr>
							<td>E-Mail</td>
							<td>:</td>
							<td>{{ $order_main->buyer_custom->email }}</td>
						</tr>

						<tr>
							<td>Phone Number</td>
							<td>:</td>
							<td>{{ $order_main->buyer_custom->phone_number }}</td>
						</tr>

						<tr>
							<td>Address</td>
							<td>:</td>
							<td>{{ $order_main->buyer_custom->address }}</td>
						</tr>

						<tr>
							<td>Message</td>
							<td>:</td>
							<td>{{ $order_main->buyer_custom->message }}</td>
						</tr>
						@endif

						<tr>
							<td colspan="3"><h3>Shipping</h3></td>
						</tr>

						<tr>
							<td>Destination</td>
							<td>:</td>
							<td>{{ $order_main->order_shipping->destination }}</td>
						</tr>

						<tr>
							<td>Service</td>
							<td>:</td>
							<td>{{ $order_main->order_shipping->service }}</td>
						</tr>

						<tr>
							<td>Package</td>
							<td>:</td>
							<td>{{ $order_main->order_shipping->service_package }}</td>
						</tr>

						<tr>
							<td>Value</td>
							<td>:</td>
							<td>Rp {{ number_format($order_main->order_shipping->cost, 0, ',', '.') }}</td>
						</tr>
						<tr>
							<td>Estimation</td>
							<td>:</td>
							<td>{{ $order_main->order_shipping->estimation }}{{ $order_main->order_shipping->estimation == 0 || $order_main->order_shipping->estimation == 1 ? ' Day' : ' Days' }}</td>
						</tr>

						<tr>
							<td>Waybill Number</td>
							<td>:</td>
							<td>{{ $order_main->order_shipping->waybill_number == null ? '-' : $order_main->order_shipping->waybill_number }}</td>
						</tr>
					</tbody>
				</table>

				<table class="table table-condensed table-striped table-hover">
					<thead>
						<tr>
							<th colspan="5"><h3>Order List</h3></th>
						</tr>
						<tr>
							<th>No.</th>
							<th>Product</th>
							<th>Quantity</th>
							<th>Weight (g)</th>
							<th>Total (Rp)</th>
						</tr>
					</thead>

					<tbody>
						@foreach ($order_main->order_list as $key => $order_list_item)
						<tr>
							<td>{{ $key + 1 }}</td>
							<td>{{ $order_list_item->brand_product->name }}</td>
							<td>{{ $order_list_item->quantity }}</td>
							<td>{{ number_format($order_list_item->brand_product->weight * $order_list_item
							->quantity, 0, ',', '.') }}</td>
							<td>{{ number_format($order_list_item->subtotal_price, 0, ',', '.') }}</td>
						</tr>
						<?php
						$quantity[] = $order_list_item->quantity;
						$weight[] = $order_list_item->brand_product->weight * $order_list_item->quantity;
						$subtotal_price[] = $order_list_item->subtotal_price;
						?>
						@endforeach
						<tr>
							<td></td>
							<td></td>
							<td>{{ number_format(array_sum($quantity), 0, ',', '.') }}</td>
							<td>{{ number_format(array_sum($weight), 0, ',', '.') }}</td>
							<td>{{ number_format(array_sum($subtotal_price), 0, ',', '.') }}</td>
						</tr>
					</tbody>
				</table>

				<table class="table table-condensed table-striped table-hover">
					<tbody>
						<tr>
							<td><h3>Total Price Rp {{ number_format($order_main->order_shipping->cost + array_sum($subtotal_price), 0, ',', '.') }}</h3></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@stop