@extends('back.layout')

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>Report</span>
			</div>

			<div class="panel-body">
				@include('back.order_main.menu')

				<table class="table table-condensed table-striped table-hover">
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
						@foreach ($order_main_report_details as $order_main_details)
						<tr>
							<td>{{ $no++ }}</td>
							<td><a href="{{ route('b_order_main_show', $order_main_details->code) }}">{{ $order_main_details->code }}</a></td>
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

					@if (count($order_main_report_details) > 0)
					<tfoot>
						<tr>
							<td colspan='3'></td>
							<td>
								{{ Form::open(['method' => 'POST', 'route' => 'b_order_main_download_details']) }}
									{{ Form::hidden('date_1', $tanggal1) }}
									{{ Form::hidden('date_2', $tanggal2) }}
									{{ Form::input('submit', 'Download', 'Download Report as .xls', ['class' => 'btn']) }}
								{{ Form::close() }}
								<!-- <a href="{{ route('b_order_main_download_details') }}" class="btn">Download Report as .xls</a> -->
							</td>
							<td><b>{{ array_sum($total) }}</b></td>
						</tr>
					</tfoot>
					@else
					<tfoot>
						<tr>
							<td colspan='5'></td>
						</tr>
					</tfoot>
					@endif
				</table>
			</div>
		</div>
	</div>
</div>
@stop