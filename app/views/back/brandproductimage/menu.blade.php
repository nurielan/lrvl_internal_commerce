<div class="navbar navbar-default">
	<div class="navbar-header">
	<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>

		<a class="navbar-brand">BRANDPRODUCTIMAGE</a>
	</div>

	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="{{ route('b_brandproduct_index', Session::get('brand_product.brand_size_id')) }}">Back</a></li>
			<li @if(Request::is('back/brandproductimage/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_brandproductimage_index', Session::get('brandproductimage.brand_product_id')) }}">Index</a></li>
			<li @if(Request::is('back/brandproductimage/create')) {{ 'class="active"' }} @endif><a href="{{ route('b_brandproductimage_create') }}">Create</a></li>
		</ul>
	</div>
</div>