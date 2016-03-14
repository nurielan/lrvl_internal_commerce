<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary" id="sidebar">
			<div class="panel-heading">
				<span>MENU&nbsp;<i class="caret"></i></span>
			</div>

			<ul class="list-group">
				<li class="list-group-item @if (Request::is('back/admin/*')) {{ 'active' }} @endif"><a href="{{ route('b_admin_index') }}">Admin {{ (Auth::admin()->user()->role == 1 ? 'Store' : 'Finance') }}</a></li>
				<li class="list-group-item @if (Request::is('back/brand/*')) {{ 'active' }} @endif"><a href="{{ route('b_brand_index') }}">Brand</a></li>
				<li class="list-group-item @if (Request::is('back/brandsize/*') || Request::is('back/brandproduct/*') || Request::is('back/brandsizeimage/*') || Request::is('back/brandproductimage/*')) {{ 'active' }} @endif"><a href="{{ route('b_brandsize_index') }}">Brand Size</a></li>
				<li class="list-group-item @if (Request::is('back/order_main/*')) {{ 'active' }} @endif"><a href="{{ route('b_order_main_index') }}">Order Manager</a></li>
				<li class="list-group-item @if (Request::is('back/point/*')) {{ 'active' }} @endif"><a href="{{ route('b_point_index') }}">Point</a></li>
				<li class="list-group-item @if (Request::is('back/home_image/*')) {{ 'active' }} @endif"><a href="{{ route('b_home_image_index') }}">Home Image</a>
				<li class="list-group-item @if (Request::is('back/bank/*')) {{ 'active' }} @endif"><a href="{{ route('b_bank_index') }}">Bank</a>
				<li class="list-group-item @if (Request::is('back/shipping_service/*')) {{ 'active' }} @endif"><a href="{{ route('b_shipping_service_index') }}">Shipping Service</a>
			</ul>
		</div>
	</div>
</div>