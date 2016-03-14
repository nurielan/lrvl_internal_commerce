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
				@include('back.home_image.menu')

				@if (Session::has('event'))
					<div class="alert alert-info">
						<button class="close" data-dismiss="alert">&times;</button>

						<span>{{ Session::get('event') }}</span>
					</div>
				@endif

				<ul id="image-index">
					@foreach ($home_image as $home_image_item)
					<li>
						<div class="row">
							<div class="col-md-12">
								<a href="{{ route('b_home_image_edit', $home_image_item->id) }}">
									<img src="{{ asset('assets/images/home_image/thumbnail/'.$home_image_item->image) }}" width="128px" height="128px">
								</a>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								{{ Form::open(['route' => 'b_home_image_destroy']) }}
									{{ Form::hidden('id', $home_image_item->id) }}

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