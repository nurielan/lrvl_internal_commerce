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
				@include('back.bank.menu')

				@if (Session::has('event.bank.success'))
					<div class="alert alert-success">
						<button class="close" data-dismiss="alert">&times;</button>

						<span>{{ Session::get('event.bank.success') }}</span>
					</div>
				@endif

				<ul id="image-index">
					@foreach ($bank as $bank_item)
					<li>
						<div class="row">
							<div class="col-md-12">
								<a href="{{ route('b_bank_edit', $bank_item->id) }}">
									<img src="{{ asset('assets/images/bank/thumbnail/'.$bank_item->image) }}" width="128px" height="128px">
								</a>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								{{ Form::open(['route' => 'b_bank_destroy']) }}
									{{ Form::hidden('id', $bank_item->id) }}

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