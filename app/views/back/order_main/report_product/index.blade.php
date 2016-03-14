@extends('back.layout')

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>Report Product</span>
			</div>

			<div class="panel-body">
				@include('back.order_main.menu')

				<table class="table table-condensed table-striped table-hover">
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

					@if (count($order_main_report_product_details) > 0)
					<tfoot>
						<tr>
							<td colspan='5'></td>
							<td>
								<a href="{{ route('b_order_main_report_product_download') }}" class="btn btn-default">Download Report as .xls</a>
							</td>
						</tr>
					</tfoot>
					@else
					<tfoot>
						<tr>
							<td colspan='6'></td>
						</tr>
					</tfoot>
					@endif
				</table>
			</div>
		</div>
	</div>
</div>
@stop