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
				@include('back.brandproductimage.menu')
			
				{{ Form::open(['route' => 'b_brandproductimage_update', 'files' => true]) }}
					{{ Form::hidden('id', $brandproductimage->id) }}

					<div class="form-group">
						<div class="row">
							<div class="col-md-4 col-md-offset-4" align="center">
								<img class="img-responsive" src="{{ asset('assets/images/brandproductimage/thumbnail/'.$brandproductimage->image) }}">
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								{{ Form::file('image', ['class' => 'form-control', 'placeholder' => 'Content']) }}
							</div>
						</div>
					</div>

					@if (Session::has('event.brandproductimage.error'))
					<div class="form-group">
						<div class="alert alert-danger">
							<button class="close" data-dismiss="alert">&times;</button>

							@foreach (Session::get('event.brandproductimage.error') as $errors_item)
							<p>{{ $errors_item }}</p>
							@endforeach
						</div>
					</div>
					@elseif (Session::has('event.brandproductimage.success'))
					<div class="form-group">
						<div class="alert alert-success">
							<button class="close" data-dismiss="alert">&times;</button>

							<span>{{ Session::get('event.brandproductimage.success') }}</span>
						</div>
					</div>
					@endif

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_brandproductimage_index', Session::get('brandproductimage.brand_product_id')) }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
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