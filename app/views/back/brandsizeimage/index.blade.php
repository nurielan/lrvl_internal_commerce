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
				@include('back.brandsizeimage.menu')

				@if (Session::has('event.brandsizeimage.success'))
					<div class="alert alert-success">
						<button class="close" data-dismiss="alert">&times;</button>

						<span>{{ Session::get('event.brandsizeimage.success') }}</span>
					</div>
				@endif

				<ul id="image-index">
					@foreach ($brandsizeimage as $brandsizeimage_item)
					<li>
						<div class="row">
							<div class="col-md-12">
								<a href="{{ route('b_brandsizeimage_edit', $brandsizeimage_item->id) }}">
									<img src="{{ asset('assets/images/brandsizeimage/original/'.$brandsizeimage_item->image) }}" width="128px" height="128px">
								</a>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								{{ Form::open(['route' => 'b_brandsizeimage_destroy']) }}
									{{ Form::hidden('id', $brandsizeimage_item->id) }}

									<button class="btn btn-danger btn-xs btn-block" type="submit">
										<span class="fa fa-trash"></span>
									</button>
								{{ Form::close() }}
							</div>
						</div>
					</li>
					@endforeach
				</ul>
			</div>
		</div>
	</div>
</div>
@stop