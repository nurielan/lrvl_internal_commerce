<div class="navbar navbar-default">
	<div class="navbar-header">
	<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>

		<a class="navbar-brand">ADMIN {{ strtoupper((Auth::admin()->user()->role == 1 ? 'Store' : 'Finance')) }}</a>
	</div>

	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li @if(Request::is('back/admin/index')) {{ 'class="active"' }} @endif><a href="{{ route('b_admin_index') }}">Index</a></li>
			<li @if(Request::is('back/admin/edit')) {{ 'class="active"' }} @endif><a href="{{ route('b_admin_edit') }}">Edit</a></li>
			<li @if(Request::is('back/admin/edit_password')) {{ 'class="active"' }} @endif><a href="{{ route('b_admin_edit_password') }}">Edit Password</a></li>
			<li><a href="{{ route('b_admin_logout') }}">Logout</a></li>
		</ul>
	</div>
</div>