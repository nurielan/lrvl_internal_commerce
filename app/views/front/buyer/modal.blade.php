					@if ($order->buyer_custom_code)
					<table class="table table-condensed">
						<tr>
							<td>Name</td>
							<td>:</td>
							<td>{{ $order->buyer_custom->name }}</td>
						</tr>
						<tr>
							<td>E-Mail</td>
							<td>:</td>
							<td>{{ $order->buyer_custom->email }}</td>
						</tr>
						<tr>
							<td>Phone Number</td>
							<td>:</td>
							<td>{{ substr($order->buyer_custom->phone_number, 0, 3).'-'.substr($order->buyer_custom->phone_number, 2)}}</td>
						</tr>
						<tr>
							<td>Address</td>
							<td>:</td>
							<td>{{ $order->buyer_custom->address }}</td>
						</tr>
						<tr>
							<td>Message</td>
							<td>:</td>
							<td>{{ $order->buyer_custom->message }}</td>
						</tr>
						<tr>
							<td>Shipping Destination</td>
							<td>:</td>
							<td>{{ $order->order_shipping->destination }}</td>
						</tr>
						<tr>
							<td>Shipping Service</td>
							<td>:</td>
							<td>{{ $order->order_shipping->service }}</td>
						</tr>
						<tr>
							<td>Shipping Package</td>
							<td>:</td>
							<td>{{ $order->order_shipping->service_package }}</td>
						</tr>
						<tr>
							<td>Shipping Value</td>
							<td>:</td>
							<td>Rp {{ number_format($order->order_shipping->cost, 0, ',', '.') }}</td>
						</tr>
						<tr>
							<td>Shipping Estimation</td>
							<td>:</td>
							<td>{{ $order->order_shipping->estimation.' '.($order->order_shipping->estimation > 1 ? 'Days' : 'Day') }}</td>
						</tr>
						<tr>
							<td>Shipping Waybill Number</td>
							<td>:</td>
							<td>{{ $order->order_shipping->waybill_number == null ? '-' : $order->order_shipping->waybill_number }}</td>
						</tr>
					</table>
					@else
					<table class="table table-condensed">
						<tr>
							<td>Name</td>
							<td>:</td>
							<td>{{ $order->buyer->name }}</td>
						</tr>
						<tr>
							<td>E-Mail</td>
							<td>:</td>
							<td>{{ $order->buyer->email }}</td>
						</tr>
						<tr>
							<td>Phone Number</td>
							<td>:</td>
							<td>{{ substr($order->buyer->phone_number, 0, 3).'-'.$order->buyer->phone_number }}</td>
						</tr>
						<tr>
							<td>Address</td>
							<td>:</td>
							<td>{{ $order->buyer->address }}</td>
						</tr>
						<tr>
							<td>Message</td>
							<td>:</td>
							<td>{{ $order->buyer->message }}</td>
						</tr>
						<tr>
							<td>No. Airwaybill</td>
							<td>:</td>
							<td>{{ $order->order_shipping->waybill_number == null ? '-' : $order->order_shipping->waybill_number }}</td>
						</tr>
						<tr>
							<td>Shipping Destination</td>
							<td>:</td>
							<td>{{ $order->order_shipping->destination }}</td>
						</tr>
						<tr>
							<td>Shipping Service</td>
							<td>:</td>
							<td>{{ $order->order_shipping->service }}</td>
						</tr>
						<tr>
							<td>Shipping Package</td>
							<td>:</td>
							<td>{{ $order->order_shipping->service_package }}</td>
						</tr>
						<tr>
							<td>Shipping Value</td>
							<td>:</td>
							<td>Rp {{ number_format($order->order_shipping->cost, 0, ',', '.') }}</td>
						</tr>
						<tr>
							<td>Shipping Estimation</td>
							<td>:</td>
							<td>{{ $order->order_shipping->estimation.' '.($order->order_shipping->estimation > 1 ? 'Days' : 'Day') }}</td>
						</tr>
					</table>
					@endif

					<table class="table table-condensed table-striped table-hover">
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th>Weight (g)</th>
							<th>Total (Rp.)</th>
						</tr>
						@foreach ($order->order_list as $cart_item)
						<tr>
							<td>{{ $cart_item->brand_product->name }}</td>
							<td>{{ $cart_item->quantity }}</td>
							<td>{{ number_format($cart_item->brand_product->weight * $cart_item->quantity, 0, ',', '.') }}</td>
							<td>{{ number_format($cart_item->brand_product->price * $cart_item->quantity, 0, ',', '.') }}</td>
							<?php
							$qty[] = $cart_item->quantity;
							$weight[] = $cart_item->brand_product->weight * $cart_item->quantity;
							$price[] = $cart_item->brand_product->price * $cart_item->quantity;
							?>
						</tr>
						@endforeach
						<tr>
							<th></th>
							<th>{{ array_sum($qty) }}</th>
							<th>{{ number_format(array_sum($weight), 0, ',', '.') }}</th>
							<th>{{ number_format(array_sum($price), 0, '', '.') }}</th>
						</tr>
						<tr>
							<td colspan="3">Shipping cost</td>
							<td>{{ number_format($order->order_shipping->cost, 0, ',', '.') }}</td>
						</tr>
						<tr>
							<td colspan="3">Price back</td>
							<td>{{ number_format($price_back, 0, ',', '.') }}</td>
						</tr>
						<tr>
							<td colspan="3">Total</td>
							<td>{{ number_format(array_sum($price) + $order->order_shipping->cost - $price_back, 0, ',', '.') }}</td>
						</tr>
					</table>

					@if ($order->status == 0)
					<div class="row">
						<div class="col-md-12" style="text-align: center;">
							<a class="btn btn-warning btn-lg" id="buyer_confirm" href="{{ route('f_buyer_confirm', $order->code) }}">Confirm Order</a>
						</div>
					</div>
					@endif