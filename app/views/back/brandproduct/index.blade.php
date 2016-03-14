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
				@include('back.brandproduct.menu')

				@if (Session::has('event.brandproduct.success'))
					<div class="alert alert-success">
						<button class="close" data-dismiss="alert">&times;</button>

						<span>{{ Session::get('event.brandproduct.success') }}</span>
					</div>
				@endif

				<table class="table table-condensed table-striped -table-hover">
					<thead>
						<tr>
							<th width="1px">No.</th>
							<th>Name</th>
							<th>Stock</th>
							<th>Price (Rp)</th>
							<th>Weight (g)</th>
							<th>Image</th>
							<th width="10px">&nbsp;</th>
						</tr>
					</thead>

					<tbody>
						@foreach ($brandproduct as $brandproduct_item)
						<tr>
							<td width="1px"></td>
							<td><a href="{{ route('b_brandproduct_edit', $brandproduct_item->id) }}">{{ ucwords($brandproduct_item->name) }}</a></td>
							<td>{{ number_format($brandproduct_item->stock, 0, ',', '.') }}</td>
							<td>{{ number_format($brandproduct_item->price, 0, ',', '.') }}</td>
							<td>{{ number_format($brandproduct_item->weight, 0, ',', '.') }}</td>
							<td><a href="{{ route('b_brandproductimage_index', $brandproduct_item->id) }}"><span class="fa fa-picture-o"></span></a></td>
							<td width="10px">
								{{ Form::open(['route' => 'b_brandproduct_destroy']) }}
									{{ Form::hidden('id', $brandproduct_item->id) }}

									<button class="btn btn-danger btn-xs btn-block" type="submit">
										<span class="fa fa-trash"></span>
									</button>
								{{ Form::close() }}
							</td>
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@stop