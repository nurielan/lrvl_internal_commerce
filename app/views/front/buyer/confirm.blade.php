@extends('front.layout')

@section('title', 'Confirm Order')

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
								{{ Form::open(['class' => 'form-horizontal col-md-8 col-md-offset-2', 'route' => 'f_buyer_store_confirm']) }}
									{{ Form::hidden('order_main_code', $order_main_code) }}

									<div class="form-group">
										{{ Form::label('bank', 'Bank Name', ['class' => 'control-label col-md-4']) }}
										<div class="col-md-8">
											{{ Form::text('bank', '', ['class' => 'form-control']) }}
										</div>
									</div>

									<div class="form-group">
										{{ Form::label('account_number', 'Bank Account Number', ['class' => 'control-label col-md-4']) }}
										<div class="col-md-8">
											{{ Form::text('account_number', '', ['class' => 'form-control']) }}
										</div>
									</div>

									<div class="form-group">
										{{ Form::label('amount', 'Value Amount', ['class' => 'control-label col-md-4']) }}
										<div class="col-md-8">
											<div class="input-group">
												<span class="input-group-addon">Rp.</span>
												{{ Form::text('amount', '', ['class' => 'form-control']) }}
											</div>
										</div>
									</div>

									@if (Session::has('event.buyer.error'))
									<div class="form-group">
										<div class="col-md-8 col-md-offset-4">
											<div class="alert alert-danger">
												<button class="close" data-dismiss="alert">&times;</button>

												@foreach (Session::get('event.buyer.error') as $error)
												<p>{{ $error }}</p>
												@endforeach
											</div>
										</div>
									</div>
									@endif

									<div class="form-group">
										<div class="col-md-8 col-md-offset-4">
											{{ Form::button('Finish', ['class' => 'btn btn-primary', 'type' => 'submit']) }}
										</div>
									</div>
								{{ Form::close() }}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection