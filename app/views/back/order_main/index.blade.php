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
				@include('back.order_main.menu')

				@if (Session::has('event.order_main.success'))
					<div class="alert alert-success">
						<button class="close" data-dismiss="alert">&times;</button>

						<span>{{ Session::get('event.order_main.success') }}</span>
					</div>
				@endif
				
				<table class="table table-condensed table-striped table-hover">
					<thead>
						<tr>
							<th width="1">No.</th>
							<th>Code</th>
							<th>Ordered At</th>
							<th>Status Update At</th>
							<th>Status</th>
							<th width="1"></th>
							<th width="1"></th>
						</tr>
					</thead>

					<tbody>
						@foreach ($order_main as $order_main_item)
						<tr>
							<td width="1"></td>
							<td><a href="{{ route('b_order_main_show', $order_main_item->code) }}">{{ $order_main_item->code }}</a></td>
							<td>{{ date('d M Y', strtotime($order_main_item->created_at)) }}</td>
							<td>{{ date('d M Y', strtotime($order_main_item->updated_at)) }}</td>
							<td>
								@if ($order_main_item->status == 0)
								<span class="label label-danger">Ordered</span>
								@elseif ($order_main_item->status == 1)
								<span class="label label-warning">Awaiting</span>
								@elseif ($order_main_item->status == 2)
								<span class="label label-primary">On Process</span>
								@elseif ($order_main_item->status == 3)
								<span class="label label-success">Delivered</span>
								@endif
							</td>
							<td width="1">
								{{ Form::open(['route' => 'b_order_main_update']) }}
									@if ($order_main_item->status == 0)
									<button class="btn btn-primary btn-xs" type="button" disabled><span class="fa fa-check"></span></button>
									@elseif ($order_main_item->status == 2)
									<button class="btn btn-primary btn-xs modal_wbn_button" data-code="{{ $order_main_item->order_shipping->code }}" data-id="{{ $order_main_item->id }}" type="button">
										<span class="fa fa-check"></span>
									</button>
									@elseif ($order_main_item->status == 3)
									<button class="btn btn-primary btn-xs" type="button" disabled><span class="fa fa-check"></span></button>
									@else
									{{ Form::hidden('id', $order_main_item->id) }}
									<button class="btn btn-primary btn-xs" type="submit">
										<span class="fa fa-check"></span>
									</button>
									@endif
								{{ Form::close() }}
							</td>
							<td>
								{{ Form::open(['route' => 'b_order_main_destroy']) }}
									{{ Form::hidden('id', $order_main_item->id) }}
									<button class="btn btn-danger btn-xs" type="submit">
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

<!-- Modal resi -->
<div class="modal fade" id="modal_wbn">
	<div class="modal-dialog" style="width: 250px;">
		<div class="modal-content">
			<div class="modal-body">
				{{ Form::open(['route' => 'b_order_main_update']) }}
					{{ Form::hidden('id') }}
					{{ Form::hidden('code') }}

					<div class="form-group">
						{{ Form::text('waybill_number', '', ['class' => 'form-control', 'placeholder' => 'Waybill Number']) }}
					</div>

					<div class="form-group" id="modal_wbn_alert" style="display: none;">
						<div class="alert alert-info">
							
						</div>
					</div>

					<div class="form-group">
							<div class="btn-group btn-group-justified">
								<div class="btn-group">
									<button class="btn btn-success" type="submit">OK</button>
								</div>

								<div class="btn-group">
									<button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
								</div>
							</div>
					</div>
				{{ Form::close() }}
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
@stop
