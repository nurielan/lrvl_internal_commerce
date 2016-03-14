@extends('back.layout')

@section('title')
Index
@stop

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>INDEX</span>
			</div>

			<div class="panel-body">
				@include('back.point.menu')

				<table class="table table-condensed table-striped table-hover">
					<thead>
						<tr>
							<th width="1">No.</th>
							<th>Buyer Name</th>
							<th>Point</th>
							<th>Total Value (Rp)</th>
						</tr>
					</thead>

					<tbody>
						@foreach ($buyer as $buyer_item)
						<tr>
							<td></td>
							<td>{{ $buyer_item->name }}</td>
							<td>{{ $buyer_item->point }}</td>
							<td>{{ $buyer_item->point * $point->price_back }}</td>
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@stop