@extends('back.layout')

@section('title')
Show
@stop

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>SHOW</span>
			</div>

			<div class="panel-body">
				@include('back.brandsize.menu')

				@if (Session::has('event.brandsize.success'))
					<div class="alert alert-success">
						<button class="close" data-dismiss="alert">&times;</button>

						<span>{{ Session::get('event.brandsize.success') }}</span>
					</div>
				@endif

				<table class="table table-condensed table-striped -table-hover">
					<thead>
						<tr>
							<th width="1px">No.</th>
							<th>Name</th>
							<th>Image</th>
							<th>Product</th>
							<th width="10px">&nbsp;</th>
						</tr>
					</thead>

					<tbody>
						@foreach ($brandsize as $brandsize_item)
						<tr>
							<td width="1px"></td>
							<td><a href="{{ route('b_brandsize_edit', $brandsize_item->id) }}">{{ ucwords($brandsize_item->name) }}</a></td>
							<td><a href="{{ route('b_brandsizeimage_index', $brandsize_item->id) }}"><span class="fa fa-picture-o"></span></a></td>
							<td><a href="{{ route('b_brandproduct_index', $brandsize_item->id) }}"><span class="fa fa-cubes"></span></a></td>
							<td width="10px">
								{{ Form::open(['route' => 'b_brandsize_destroy']) }}
									{{ Form::hidden('id', $brandsize_item->id) }}

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