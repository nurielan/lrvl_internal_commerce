<div class="navbar navbar-default">
	<div class="navbar-header">
	<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>

		<a class="navbar-brand">ORDER MANAGER</a>
	</div>

	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<!-- <li @if(Request::is('back/order_main/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_order_main_index') }}">Index</a></li> -->
			<!--li @if(Request::is('back/order_main/create')) {{ 'class="active"' }} @endif><a href="{{ route('b_order_main_create') }}">Create</a></li-->
			
			<li @if(Request::is('back/order_main/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_order_main_index') }}">Index</a></li>
			<li @if(Request::is('back/order_main/report/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_order_main_report') }}">Ordered Report</a></li>
			<li @if(Request::is('back/order_main/report_product/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_order_main_report_product') }}">Product Report</a></li>
		</ul>
	</div>
</div>