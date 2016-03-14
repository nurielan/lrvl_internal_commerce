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
			<li @if(Request::is('back/point/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_point_index') }}">Index</a></li>
			<li @if(Request::is('back/point/edit')) {{ 'class="active"' }} @endif><a href="{{ route('b_point_edit', 1) }}">Edit</a></li>
		</ul>
	</div>
</div>