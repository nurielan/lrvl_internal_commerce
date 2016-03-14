<div class="navbar navbar-default">
	<div class="navbar-header">
	<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>

		<a class="navbar-brand">BRANDSIZEIMAGE</a>
	</div>

	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="{{ route('b_brandsize_show', Session::get('brandsize.brand_id')) }}">Back</a></li>
			<li @if(Request::is('back/brandsizeimage/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_brandsizeimage_index', Session::get('brandsizeimage.brand_size_id')) }}">Index</a></li>
			<li @if(Request::is('back/brandsizeimage/create')) {{ 'class="active"' }} @endif><a href="{{ route('b_brandsizeimage_create') }}">Create</a></li>
		</ul>
	</div>
</div>