@extends('front.layout')

@section('title', 'Show')

@section('content')
	<div class="main-index main">
		<div class="container" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3">
						@include('front.buyer.menu')
					</div>

					<div class="col-md-9">
						<div class="panel panel-default">
							<div class="panel-heading">
								<span>Show</span>
							</div>

							<div class="panel-body">
								<div class="table-responsive">

								<table class="table datatable">
									<thead>
										<tr>
											<th>No.</th>
											<th>Order ID</th>
											<th>Order Date</th>
											<th>Status</th>
											<th></th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										@foreach ($order as $order_item)
										<tr>
											<td></td>
											<td>{{ $order_item->code }}</td>
											<td>{{ date('d F Y', strtotime($order_item->created_at)) }}</td>
											<td>
												@if ($order_item->status == 0)
												<span class="label label-danger">Ordered</span>
												@elseif ($order_item->status == 1)
												<span class="label label-warning">Awaiting</span>
												@elseif  ($order_item->status == 2)
												<span class="label label-primary">On Process</span>
												@else
												<span class="label label-success">Delivered</span>
												@endif
											</td>
											<td><a class="btn btn-primary btn-xs buyer_detail" data-ordermaincode="{{ $order_item->code }}">Detail</a></td>
											<td>
												{{ Form::open(['route' => 'f_buyer_show_invoice']) }}
													{{ Form::hidden('code', $order_item->code) }}
													<button class="btn btn-default btn-xs fa fa-file-pdf-o" type="submit"></button>
												{{ Form::close() }}
											</td>
										</tr>
										@endforeach
									</tbody>
								</table>
								</div>


								@if (Session::has('event.buyer.success'))
								<hr>
								<div class="alert alert-success">
									<button class="close" data-dismiss="alert">&times;</button>

									{{ Session::get('event.buyer.success') }}
								</div>
								@endif
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- For sitemap -->
		@include('front.footer_links')
	</div>

	<!-- Modal -->
	<div class="modal fade" id="buyer_modal" style="margin-top: 128px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">&times;</button>

					<h4>Order Detail</h4>

					<div id="buyer_modal_content">
						
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection