<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Internal Commerce @yield('title')</title>
	<meta name="Description" content="Website Resmi - Merk Internal | sprei, bantal, bed cover, selimut berkualitas dengan harga terjangkau dengan berbagai macam ukuran & motif unik dan menarik">
<meta name="Keywords" content="Merk, Internal, Group, Jual, Bantal, Selimut, Sprei, Bed Cover, Kain, Selimut, Motif, Murah, Harga, Terjangkau, Toko Online">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" media="all">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" media="all">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.css" media="all">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.structure.min.css" media="all">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.theme.min.css" media="all">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css" media="all">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css" media="all">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.transitions.min.css" media="all">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.0.2/nouislider.min.css" media="all">

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

	<link rel="stylesheet" href="{{ asset('assets/css/style-front.css') }}" media="all">

	<!--[if lt IE 9]>
	<script type="text/javascript" src="{{ asset('assets/js/html5shiv.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('assets/js/respond.min.js') }}"></script>
	<![endif]-->
</head>
<body>
	<!-- For navigation bar -->
	<nav class="page-header navbar navbar-default" role="navigation">

		<div class="container">
			<div class="logo pull-left">
				<a href="{{ route('f_home') }}" class="navbar-brand">
					<img src="{{ asset('assets/images/logo.png') }}" alt="Logo">
				</a>
			</div>

			<div class="store pull-left">
				<ul class="nav navbar-nav">
					<li><a><h2>STORE</h2></a></li>
				</ul>
			</div>
		
			<div class="pull-right">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="fa fa-bars"></span>
					</button>
				</div>	
			</div>	
		
			<!-- Main Link -->		
			<div class="collapse navbar-collapse navbar-right nav-link">
				<ul class="nav navbar-nav">
					<li><a href="{{ route('f_home') }}">HOME</a></li>
					<li><a href="{{ route('f_product') }}">PRODUCTS</a></li>
					<li><a href="{{ route('f_customer_care') }}">CUSTOMER CARE</a></li>
					<li>
						<a href="{{ route('f_buyer') }}" class="border login">
							<span class="fa fa-user"></span>
							&nbsp;
							@if (! Auth::buyer()->check())
							Login
							@else
							{{ ucwords(Auth::buyer()->user()->name) }}
							@endif
						</a>
					</li>
					<li><a href="{{ route('f_product_cart_index') }}" class="border cart"><span class="fa fa-shopping-cart"></span> Cart ({{ (count(Cart::content()) == 0 ? '0' : count(Cart::content())) }})</a></li>
				</ul>
			</div>
		</div>
	
	</nav>

	<!-- For Section Main body -->
	@yield('content')

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="col-md-12">
				<h4 class="pull-left"><img src="{{ asset('assets/images/logonegative.png') }}" alt="logo">&copy Copyright 2015 - INTERNAL GROUP</h4>
				<h4 class="pull-right">Powered by <a href="http://idekreatif.id" target="_blank">Ide Kreatif</a></h4>
			</div>
		</div>
	</footer>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.0.2/nouislider.min.js"></script>
	<script type="text/javascript" src="{{ asset('assets/js/datatables.min.js') }}"></script>
	<script type="text/javascript" src="http://internalgroup.id/assets/js/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.2.5/tinymce.min.js"></script>
	<script type="text/javascript" src="{{ asset('assets/js/script-front.js') }}"></script>
	<script type="text/javascript" src="http://customer.internalgroup.id/php/app.php?widget-init.js"></script>
</body>
</html>