<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Internal Commerce Admin @section('title') Title here @show</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}" media="all">
	<link rel="stylesheet" href="{{ asset('assets/css/bootstrap-theme-lumen.min.css') }}" media="all">

	<link rel="stylesheet" href="{{ asset('assets/css/font-awesome.min.css') }}" media="all">

	<link rel="stylesheet" href="{{ asset('assets/css/jquery-ui/jquery-ui.min.css') }}" media="all">
	<link rel="stylesheet" href="{{ asset('assets/css/jquery-ui/jquery-ui.structure.min.css') }}" media="all">
	<link rel="stylesheet" href="{{ asset('assets/css/jquery-ui/jquery-ui.theme.min.css') }}" media="all">

	<link rel="stylesheet" href="{{ asset('assets/css/datatables.min.css') }}" media="all">

	<link rel="shortcut icon" href="{{ asset('assets/images/iconified/favicon.ico') }}" type="image/x-icon" />
	<link rel="apple-touch-icon" href="{{ asset('assets/images/iconified/apple-touch-icon.png') }}" />
	<link rel="apple-touch-icon" sizes="57x57" href="{{ asset('assets/images/iconified/apple-touch-icon-57x57.png') }}" />
	<link rel="apple-touch-icon" sizes="72x72" href="{{ asset('assets/images/iconified/apple-touch-icon-72x72.png') }}" />
	<link rel="apple-touch-icon" sizes="76x76" href="{{ asset('assets/images/iconified/apple-touch-icon-76x76.png') }}" />
	<link rel="apple-touch-icon" sizes="114x114" href="{{ asset('assets/images/iconified/apple-touch-icon-114x114.png') }}" />
	<link rel="apple-touch-icon" sizes="120x120" href="{{ asset('assets/images/iconified/apple-touch-icon-120x120.png') }}" />
	<link rel="apple-touch-icon" sizes="144x144" href="{{ asset('assets/images/iconified/apple-touch-icon-144x144.png') }}" />
	<link rel="apple-touch-icon" sizes="152x152" href="{{ asset('assets/images/iconified/apple-touch-icon-152x152.png') }}" />
	<link rel="apple-touch-icon" sizes="180x180" href="{{ asset('assets/images/iconified/apple-touch-icon-180x180.png') }}" />

	<link rel="stylesheet" href="{{ asset('assets/css/style-back.css') }}" media="all">

	<!--[if lt IE 9]>
	<script type="text/javascript" src="{{ asset('assets/js/html5shiv.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/respond.min.js') }}"></script>
	<![endif]-->
</head>
<body>
	<div class="container">
		<div class="row">
			@if (! Request::is('back/login'))
			<div class="col-md-3">
				@include('back.sidebar')
			</div>

			<div class="col-md-9">
				@yield('content')
			</div>
			@else
			@yield('content')
			@endif
		</div>
	</div>

	<script type="text/javascript" src="{{ asset('assets/js/jquery-2.1.4.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/jquery-ui.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/datatables.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/tinymce/tinymce.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/script-back.js') }}"></script>
</body>
</html>