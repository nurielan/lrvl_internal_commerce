<h1>Order Confirmation</h1>
<br>
<table>
	<tr>
		<td>Order Main Code</td>
		<td>:</td>
		<td>{{ $data->order_main_code }}</td>
	</tr>
	<tr>
		<td>Name</td>
		<td>:</td>
		<td>{{ $data->order_main->buyer->name }}</td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td>:</td>
		<td>{{ $data->order_main->buyer->email }}</td>
	</tr>
	<tr>
		<td>Phone Number</td>
		<td>:</td>
		<td>{{ $data->order_main->buyer->phone_number }}</td>
	</tr>
	<tr>
		<td>Address</td>
		<td>:</td>
		<td>{{ $data->order_main->buyer->address }}</td>
	</tr>
	<tr>
		<td>Via</td>
		<td>:</td>
		<td>{{ $data->via }}</td>
	</tr>
	<tr>
		<td>Transfer Amount</td>
		<td>:</td>
		<td>Rp {{ number_format($data->amount, 0, ',', '.') }}</td>
	</tr>
	<tr>
		<td>Bank</td>
		<td>:</td>
		<td>{{ $data->bank }}</td>
	</tr>
	<tr>
		<td>Bank Account Number</td>
		<td>:</td>
		<td>{{ $data->account_number }}</td>
	</tr>
</table>