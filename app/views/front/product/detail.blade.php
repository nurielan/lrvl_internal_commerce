@extends('front.layout')

@section('title', 'Product')

@section('content')
	<div class="main">
		<div class="container">
			<div class="col-md-12">
				<div class="row">
					<div class="detail-product">
						<div class="col-md-5">
							<div class="owl-carousel sync-carousel" id="sync1">
								@forelse ($brand_product->brand_product_image as $brand_product_image_item)
								<div class="item"><img src="{{ asset('assets/images/brandproductimage/original/'.$brand_product_image_item->image) }}" alt="{{ $brand_product_image_item->title }}"></div>
								@empty
								<div class="item"><img src="{{ asset('assets/images/no_image.png') }}" alt="No image"></div>
								@endforelse
							</div>

							<div class="owl-carousel sync-carousel thumb" id="sync2">
								@forelse ($brand_product->brand_product_image as $brand_product_image_item)
								<div class="item"><img src="{{ asset('assets/images/brandproductimage/original/'.$brand_product_image_item->image) }}" alt="{{ $brand_product_image_item->title }}"></div>
								@empty
								<div class="item"><img src="{{ asset('assets/images/no_image.png') }}" alt="No image"></div>
								@endforelse
							</div>
						</div>

						<div class="col-md-7">
							<div class="des-pro">
								<h3 class="judul-pro">{{ ucwords($brand_product->brand_size->name.' '.$brand_product->name) }}</h3>
								<div class="harga">
									<p>Rp. {{ number_format($brand_product->price, 0, ',', '.') }}</p>
								</div>
								<div class="clearfix"></div>
								<h4>Brand <a href="{{ route('f_product_index', strtolower(str_replace(' ', '_', $brand_product->brand_size->brand->name))) }}" class="brand">{{ ucwords($brand_product->brand_size->brand->name) }}</a></h4>
								<hr>
								{{ $brand_product->description }}
								<hr>
								<div class="form-qty">
									{{ Form::open(['route' => 'f_product_cart_store']) }}
										{{ Form::hidden('brand_product_id', $brand_product->id) }}
										{{ Form::number('quantity', 1, ['min' => 1]) }}
										{{ Form::button('Add to Cart', ['class' => 'btn btn-default', 'type' => 'submit']) }}
									{{ Form::close() }}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- For sitemap -->
		@include('front.footer_links')
	</div>
@endsection