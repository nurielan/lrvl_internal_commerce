@extends('front.layout')

@section('title', 'Home')

@section('content')
	<div class="main-index main">
		<!-- For carousel image -->
		<section class="big-slider">
			<div class="owl-carousel one-carousel">
				@foreach ($home_image as $home_images)
				<img src="{{ asset('assets/images/home_image/original/'.$home_images->image) }}" alt="{{ $home_images->title }}">
				@endforeach
			</div>
		</section>

		<!-- For product link -->
		<section class="product">
			<div class="container">
				<h2 class="title">Main Brand Products</h2>

				@foreach ($brand as $brand_item)
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="main-product">
						<h4 class="title">{{ ucwords($brand_item->name) }}</h4>
						<a href="{{ route('f_product_index', strtolower(str_replace(' ', '_', $brand_item->name))) }}">
							<img class="img-responsive" src="{{ asset('assets/images/brand/thumbnail/'.$brand_item->image) }}" alt="{{ ucwords($brand_item->name) }}">
						</a>
						<div class="cek-pro">
							<a href="{{ route('f_product_index', strtolower(str_replace(' ', '_', $brand_item->name))) }}" class="btn btn-default">{{ ucwords($brand_item->name) }} Product</a>
						</div>
					</div>
				</div>
				@endforeach
				<?php unset($brand_item) ?>
			</div>
		</section>
		
		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection