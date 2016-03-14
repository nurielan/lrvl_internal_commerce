<h1>Internal Group</h1>
<hr>
<table>
	<tr>
		<td>No. Order</td>
		<td>:</td>
		<td>{{ $order_main['code'] }}</td>
	</tr>

	@if ($buyer_custom['name'] != null)
	<tr>
		<td>Name</td>
		<td>:</td>
		<td>{{ $buyer_custom['name'] }}</td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td>:</td>
		<td>{{ $buyer_custom['email'] }}</td>
	</tr>
	<tr>
		<td>Phone Number</td>
		<td>:</td>
		<td>{{ $buyer_custom['phone_number'] }}</td>
	</tr>
	<tr>
		<td>Address</td>
		<td>:</td>
		<td>{{ $buyer_custom['address'] }}</td>
	</tr>
	@else
	<tr>
		<td>Name</td>
		<td>:</td>
		<td>{{ $buyer['name'] }}</td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td>:</td>
		<td>{{ $buyer['email'] }}</td>
	</tr>
	<tr>
		<td>Phone Number</td>
		<td>:</td>
		<td>{{ $buyer['phone_number'] }}</td>
	</tr>
	<tr>
		<td>Address</td>
		<td>:</td>
		<td>{{ $buyer['address'] }}</td>
	</tr>
	@endif

	<tr>
		<td>Destination</td>
		<td>:</td>
		<td>{{ $order_shipping['destination'] }}</td>
	</tr>
	<tr>
		<td>Service</td>
		<td>:</td>
		<td>{{ $order_shipping['service'] }}</td>
	</tr>
	<tr>
		<td>Service Package</td>
		<td>:</td>
		<td>{{ $order_shipping['service_package'] }}</td>
	</tr>
	<tr>
		<td>Weight</td>
		<td>:</td>
		<td>{{ $order_shipping['weight'] }} g</td>
	</tr>
	<tr>
		<td>Cost</td>
		<td>:</td>
		<td>Rp {{ $order_shipping['cost'] }}</td>
	</tr>
	<tr>
		<td>Estimation</td>
		<td>:</td>
		<td>{{ $order_shipping['estimation'] > 1 ? $order_shipping['estimation'].' Days' : $order_shipping['estimation'].' Day' }}</td>
	</tr>
</table>

<table border="1">
	<tr>
		<th>Product Name</th>
		<th>Quantity</th>
		<th>Subtotal (Rp)</th>
	</tr>

	@foreach ($product as $products)
	<tr>
		<td>{{ $products->name }}</td>
		<td>{{ $products->quantity }}</td>
		<td>{{ $products->subtotal_price }}</td>
	</tr>
	<?php
	$subtotal[] = $products->subtotal_price;
	?>
	@endforeach

	<tr>
		<td></td>
		<td>Price back</td>
		<td>{{ number_format($price_back, 0, ',', '.') }}</td>
	</tr>
	<tr>
		<td></td>
		<td>Product</td>
		<td>{{ number_format(array_sum($subtotal), 0, ',', '.') }}</td>
	</tr>
	<tr>
		<td></td>
		<td>Total</td>
		<td>{{ number_format(array_sum($subtotal) + $order_shipping['cost'] - $price_back, 0, ',', '.') }}</td>
	</tr>
</table>
<hr>

<p>Silahkan transfer ke salah satu bank dibawah:</p>
<table>
	<tr>
		@foreach ($bank as $banks)
		<td>
			<table>
				<tr><td>{{ $banks->name }}</td></tr>
				<tr><td>{{ $banks->account_name }}</td></tr>
				<tr><td>{{ $banks->account_number }}</td></tr>
				<tr><td>{{ $banks->branch }}</td></tr>
			</table>
		</td>
		@endforeach
	</tr>
</table>