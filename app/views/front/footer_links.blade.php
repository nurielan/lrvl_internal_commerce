		<section class="site-map">
			<div class="container">
				<div class="col-md-3 col-xs-6">
					<div class="main-site-map">
						<h3>Navigasi</h3>
						<ul class="nav">
							<li><a href="{{ route('f_home') }}">HOME</a></li>
							<li><a href="{{ route('f_product') }}">PRODUCTS</a></li>
							<li><a href="{{ route('f_customer_care') }}">CUSTOMER CARE</a></li>
							<li>
								<a href="{{ route('f_buyer') }}">
									@if (! Auth::buyer()->check())
									Login
									@else
									{{ ucwords(Auth::buyer()->user()->name) }}
									@endif
								</a>
							</li>
							<li><a href="{{ route('f_product_cart_index') }}">Cart ({{ (count(Cart::content()) == 0 ? '0' : count(Cart::content())) }})</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="main-site-map">
						<h3>Pembelian</h3>
						<ul class="nav">
							@foreach ($brand as $brand_item)
							<li><a href="{{ route('f_product_index', strtolower(str_replace(' ', '_', $brand_item->name))) }}">{{ ucwords($brand_item->name) }}</a></li>
							@endforeach
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="main-site-map">
						<h3>Pengiriman</h3>
						<ul class="nav">
							@foreach ($ss as $ss_item)
							<li style="background: #fff; margin: 5px; padding: 5px;"><img src="{{ asset('assets/images/shipping_service/thumbnail/'.$ss_item->image) }}" width="128px"></li>
							@endforeach
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="main-site-map">
						<h3>Rekomendasikan Kami</h3>
						<div class="social">
							<a href="#" target="_blank"><span class="fa fa-facebook-official"></span></a>
							<a href="#" target="_blank"><span class="fa fa-twitter"></span></a>
							<a href="#" target="_blank"><span class="fa fa-instagram"></span></a>
						</div>	
					</div>
				</div>
			</div>
		</section>