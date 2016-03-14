@extends('back.layout')

@section('title')
Edit
@stop

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<span>EDIT</span>
			</div>

			<div class="panel-body">
				@include('back.brandproduct.menu')
			
				{{ Form::open(['route' => 'b_brandproduct_update']) }}
					{{ Form::hidden('id', $brandproduct->id) }}

					<div class="form-group">
						{{ Form::text('name', $brandproduct->name, ['class' => 'form-control', 'placeholder' => 'Title']) }}
					</div>

					<div class="form-group">
						{{ Form::text('stock', $brandproduct->stock, ['class' => 'form-control', 'placeholder' => 'Stock']) }}
					</div>

					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">Rp</span>
							{{ Form::text('price', $brandproduct->price, ['class' => 'form-control', 'placeholder' => 'Price']) }}
						</div>
					</div>

					<div class="form-group">
						<div class="input-group">
							{{ Form::text('weight', $brandproduct->weight, ['class' => 'form-control', 'placeholder' => 'Weight']) }}
							<span class="input-group-addon">g</span>
						</div>
					</div>

					<div class="form-group">
						{{ Form::textarea('description', $brandproduct->description, ['class' => 'form-control', 'placeholder' => 'Content']) }}
					</div>

					@if (Session::has('event.brandproduct.error'))
					<div class="form-group">
						<div class="alert alert-danger">
							<button class="close" data-dismiss="alert">&times;</button>

							@foreach (Session::get('event.brandproduct.error') as $errors_item)
							<p>{{ $errors_item }}</p>
							@endforeach
						</div>
					</div>
					@elseif (Session::has('event.brandproduct.success'))
					<div class="form-group">
						<div class="alert alert-success">
							<button class="close" data-dismiss="alert">&times;</button>

							<span>{{ Session::get('event.brandproduct.success') }}</span>
						</div>
					</div>
					@endif

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_brandproduct_index', Session::get('brand_product.brand_id')) }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
							</div>

							<div class="btn-group">
								<button class="btn btn-success" type="submit"><span class="fa fa-edit"></span>&nbsp;Edit</button>
							</div>

							<div class="btn-group">
								<button class="btn btn-default" type="reset"><span class="fa fa-eraser"></span>&nbsp;Reset</button>
							</div>
						</div>
					</div>
				{{ Form::close() }}
			</div>
		</div>
	</div>
</div>
@stop