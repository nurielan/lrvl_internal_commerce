<?php 
	header("Content-type: application/vnd-ms-excel");
	header("Content-Disposition: attachment; filename=laporan-order-manager.xls");
?>
<span>Data Download: <?php echo date('Y/m/d'); ?></span><br>
<span>Data Dari Tanggal: {{ $tanggal1 }}</span><br>
<span>Hingga Tanggal: {{ $tanggal2 }}</span><br>
<br>
<table border="1">
	<thead>
		<tr>
			<th width="1">No.</th>
			<th>Code</th>
			<th>Buyer Custom</th>
			<th>Buyer Name</th>
			<th>Total Price</th>
		</tr>

	</thead>
	<?php 
		$no = 1;
	?>
	<tbody>
		<tbody>
			@foreach ($order_main_download_details as $order_main_details)
			<tr>
				<td>{{ $no++ }}</td>
				<td>{{ $order_main_details->code }}</td>
				<td>{{ $order_main_details->buyer->name }}</td>
				@if (count($order_main_details->buyer_custom) == 0)
					<td></td>
					@else
					<td>{{ $order_main_details->buyer_custom->name }}</td>
				@endif
				<td>{{ $order_main_details->total_price }}</td>
			</tr>
			<?php 
				$total[] = $order_main_details->total_price;
			?>
			@endforeach
		</tbody>
	</tbody>
	<tfoot>
		<tr>
			<td colspan='4'></td>
			<td><b>{{ array_sum($total) }}</b></td>
		</tr>
	</tfoot>
</table>