<h1>Internal Group</h1>
<hr>
<table>
	<tr>
		<td>No. Order</td>
		<td>:</td>
		<td>{{ $data->code }}</td>
	</tr>

	@if ($data->buyer_custom != null)
	<tr>
		<td>Name</td>
		<td>:</td>
		<td>{{ $data->buyer_custom->name }}</td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td>:</td>
		<td>{{ $data->buyer_custom->email }}</td>
	</tr>
	<tr>
		<td>Phone Number</td>
		<td>:</td>
		<td>{{ $data->buyer_custom->phone_number }}</td>
	</tr>
	<tr>
		<td>Address</td>
		<td>:</td>
		<td>{{ $data->buyer_custom->address }}</td>
	</tr>
	@else
	<tr>
		<td>Name</td>
		<td>:</td>
		<td>{{ $data->buyer->name }}</td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td>:</td>
		<td>{{ $data->buyer->email }}</td>
	</tr>
	<tr>
		<td>Phone Number</td>
		<td>:</td>
		<td>{{ $data->buyer->phone_number }}</td>
	</tr>
	<tr>
		<td>Address</td>
		<td>:</td>
		<td>{{ $data->buyer->address }}</td>
	</tr>
	@endif

	<tr>
		<td>No. Air Waybill</td>
		<td>:</td>
		<td>{{ $data->order_shipping->waybill_number }}</td>
	</tr>
	<tr>
		<td>Destination</td>
		<td>:</td>
		<td>{{ $data->order_shipping->destination }}</td>
	</tr>
	<tr>
		<td>Service</td>
		<td>:</td>
		<td>{{ $data->order_shipping->service }}</td>
	</tr>
	<tr>
		<td>Service Package</td>
		<td>:</td>
		<td>{{ $data->order_shipping->service_package }}</td>
	</tr>
	<tr>
		<td>Weight</td>
		<td>:</td>
		<td>{{ $data->order_shipping->weight }}</td>
	</tr>
	<tr>
		<td>Cost</td>
		<td>:</td>
		<td>{{ $data->order_shipping->cost }}</td>
	</tr>
	<tr>
		<td>Estimation</td>
		<td>:</td>
		<td>{{ $data->order_shipping->estimation }}</td>
	</tr>
</table>

<table border="1">
	<tr>
		<th>Product Name</th>
		<th>Quantity</th>
		<th>Subtotal (Rp)</th>
	</tr>

	@foreach ($data->order_list as $order_lists)
	<tr>
		<td>{{ $order_lists->brand_product->name }}</td>
		<td>{{ $order_lists->quantity }}</td>
		<td>{{ $order_lists->subtotal_price }}</td>
	</tr>
	<?php
	$subtotal[] = $order_lists->subtotal_price;
	?>
	@endforeach

	<tr>
		<td></td>
		<td>Total (Rp)</td>
		<td>{{ number_format(array_sum($subtotal), 0, ',', '.') }}</td>
	</tr>
</table>