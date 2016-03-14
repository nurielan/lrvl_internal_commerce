<?php 
	header("Content-type: application/vnd-ms-excel");
	header("Content-Disposition: attachment; filename=laporan-product.xls");
?>
<span>Data Download: <?php echo date('Y/m/d'); ?></span><br>
<br>
<table border="1">
	<thead>
		<tr>
			<th width="1">No.</th>
			<th>Product Name</th>
			<th>Stock</th>
			<th>Price</th>
			<th>Weight</th>
			<th>Discount %</th>
		</tr>

	</thead>
	<?php 
		$no = 1;
	?>
	<tbody>
		<tbody>
			@foreach($order_main_report_product_details as $item_product)
			<tr>
				<td>{{ $no++ }}</td>
				<td>{{ $item_product->name }}</td>
				<td>{{ $item_product->stock }}</td>
				<td>{{ $item_product->price }}</td>
				<td>{{ $item_product->weight }}</td>
				<td>{{ $item_product->discount }}</td>
			</tr>
			@endforeach()
		</tbody>
	</tbody>
</table>