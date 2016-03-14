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
				@include('back.bank.menu')
			
				{{ Form::open(['route' => 'b_bank_update', 'files' => true]) }}
					{{ Form::hidden('id', $bank->id) }}

					<div class="form-group">
						{{ Form::text('name', $bank->name, ['class' => 'form-control', 'placeholder' => 'Title']) }}
					</div>

					<div class="form-group">
						{{ Form::text('account_number', $bank->account_number, ['class' => 'form-control', 'placeholder' => 'Account Number']) }}
					</div>

					<div class="form-group">
						{{ Form::text('account_name', $bank->account_name, ['class' => 'form-control', 'placeholder' => 'Account Name']) }}
					</div>

					<div class="form-group">
						{{ Form::text('branch', $bank->branch, ['class' => 'form-control', 'placeholder' => 'Branch']) }}
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-md-4 col-md-offset-4" align="center">
								<img class="img-responsive" src="{{ asset('assets/images/bank/thumbnail/'.$bank->image) }}">
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								{{ Form::file('image', ['class' => 'form-control', 'placeholder' => 'Content']) }}
							</div>
						</div>
					</div>

					@if (Session::has('event.bank.error'))
					<div class="form-group">
						<div class="alert alert-danger">
							<button class="close" data-dismiss="alert">&times;</button>

							@foreach (Session::get('event.bank.error') as $errors_item)
							<p>{{ $errors_item }}</p>
							@endforeach
						</div>
					</div>
					@elseif (Session::has('event.bank.success'))
					<div class="form-group">
						<div class="alert alert-success">
							<button class="close" data-dismiss="alert">&times;</button>

							<span>{{ Session::get('event.bank.success') }}</span>
						</div>
					</div>
					@endif

					<div class="form-group">
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<a class="btn btn-primary" href="{{ route('b_bank_index') }}"><span class="fa fa-arrow-left"></span>&nbsp;Back</a>
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