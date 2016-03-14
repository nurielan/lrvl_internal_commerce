@extends('front.layout')

@section('title', 'Product')

@section('content')
	<div class="main">
		<!-- left right content -->
		<div class="container">
			<section class="left col-md-3">
				<div class="left-block">
					<div class="categories">
					<h3 class="title">Categories</h3>
						<ul class="main-sub">
							@foreach ($categorie as $categorie_item)
							<li class="parent">
								<a href="{{ route('f_product_index', strtolower(str_replace(' ', '_', $categorie_item->name))) }}"><h4>{{ ucwords($categorie_item->name) }}</h4></a>
								<span class="toggle-trigger"><p class="caret"></p></span>
								<ul class="submenu">
									@forelse ($categorie_item->brand_size as $categorie_size_item)
									<li><a href="{{ route('f_product_index', [strtolower(str_replace(' ', '_', $categorie_item->name)), strtolower(str_replace(' ', '_', $categorie_size_item->name))]) }}">{{ ucwords($categorie_size_item->name) }}</a></li>
									@empty
									<li>No Product</li>
									@endforelse
								</ul>
							</li>
							@endforeach
						</ul>
					</div>
				</div>

				<div class="left-block">
					<div class="price-range">
						<h3 class="title">Price Range</h3>
						<div class="form-range">
							<div id="slider"></div>
							<form action="" method="">
								<div class="form-group">
									<input type="hidden" name="" id="harga-dari">
									<input type="hidden" name="" id="harga-hingga">
									<div class="label-harga">
										Rp:
										<input type="text" id="dari"> - 
										<input type="text" id="hingga">
									</div>
								</div>
								<input type="submit" value="Filter" class="btn btn-
								default">
							</form>
						</div>
					</div>
				</div>
			</section>
			
			<!-- Right Content -->
			<section class="right col-md-9">
				@if (Request::is('product/index/'.Request::segment(3)))
				<div class="right-block">
					<!--h3 class="title">Product of XXX</h3-->
					<!-- images slider product -->
					<div class="product-img-slider">
						<div class="owl-carousel small-carousel">
							@foreach ($brand as $brand_item)
							@foreach ($brand_item->brand_size as $brand_size_item)
							@foreach ($brand_size_item->brand_size_image as $brand_size_image_item)
							<img src="{{ asset('assets/images/brandsizeimage/original/'.$brand_size_image_item->image) }}" alt="slide 1">
							@endforeach
							@endforeach
							@endforeach
						</div>
					</div>
				</div>
				@endif

				<div class="right-block">

					<div id="trigger-title">
						@if (Request::is('product/index'))
						<h3 align="center">All Product</h3>
						@else
						<h3 align="center">Product {{ ucwords(str_replace('_', ' ', Request::segment(3))) }}</h3>
						@endif
					</div>

					<div class="trigger-grid">
						<button class="btn btn-default grid"><span class="fa fa-th"></span></button>
						<button class="btn btn-default list"><span class="fa fa-list"></span></button>
					</div>
				</div>

				<div class="row">
					<div class="right-block">
						@foreach ($brand as $brand_item)
						@foreach ($brand_item->brand_size as $brand_size_item)
						@foreach ($brand_size_item->brand_product as $brand_product_item)
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="list-product">
								<div class="img-overlay">
									@if (count($brand_product_item->brand_product_image))
									<img src="{{ asset('assets/images/brandproductimage/thumbnail/'.$brand_product_item->brand_product_image[0]->image) }}" alt="" class="img-responsive">
									@else
									<img src="{{ asset('assets/images/no_image.png') }}" alt="" class="img-responsive">
									@endif
									<div class="overlay">
										<a class="view btn btn-default" href="{{ route('f_product_detail', [strtolower(str_replace(' ', '_', $brand_product_item->name)), $brand_product_item->id]) }}"><p class="fa fa-eye"></p></a>
									</div>
								</div>
								
								<div class="info">
									<h4>{{ ucwords($brand_product_item->name) }}</h4>
									<span>Harga Rp {{ number_format($brand_product_item->price, 0, ',', '.') }}</span>
									{{ Form::open(['route' => 'f_product_cart_store']) }}
										{{ Form::hidden('brand_product_id', $brand_product_item->id) }}
										{{ Form::hidden('quantity', 1) }}
										{{ Form::button('Add to Cart', ['class' => 'btn btn-default', 'type' => 'submit']) }}
									{{ Form::close() }}
								</div>
							</div>
						</div>
						@endforeach
						@endforeach
						@endforeach
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div align="center">
							{{ $brand_paginate->links() }}
						</div>
					</div>
				</div>

				<!--div class="right-block">
					<div class="paging">
						<ul class="pagination">
						  <li class="active"><a href="#">1</a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						</ul>
					</div>
				</div-->
			</section>
		</div>

		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection
