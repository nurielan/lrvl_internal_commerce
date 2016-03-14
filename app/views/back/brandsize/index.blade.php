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
				<ul id="image-index">
					@foreach ($brand as $brand_item)
					<li>
						<div class="row">
							<div class="col-md-12">
								<a href="{{ route('b_brandsize_show', $brand_item->id) }}">
									<img src="{{ asset('assets/images/brand/thumbnail/'.$brand_item->image) }}" width="128px" height="128px">
								</a>
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