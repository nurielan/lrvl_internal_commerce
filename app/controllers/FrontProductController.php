<?php

class FrontProductController extends BaseController {

	public function index($brand = null, $brand_size = null) {
		$brand = ucwords(str_replace('_', ' ', $brand));
		$brand_size = ucwords(str_replace('_', ' ', $brand_size));

		if ($brand == null && $brand_size == null) {
			$data['brand'] = Brand::with(['brand_size', 'brand_size.brand_product' => function($query) {
				$query->take(12)->skip(12 * (Input::get('page') - 1));
				$query->orderBy('id', 'desc');
			}, 'brand_size.brand_product.brand_product_image'])->orderBy('id', 'desc')->get();
			$data['brand_paginate'] = BrandProduct::orderBy('id', 'desc')->paginate(12);
		} elseif ($brand != null && $brand_size == null) {
			$data['brand'] = Brand::where('name', '=', $brand)->with(['brand_size', 'brand_size.brand_size_image', 'brand_size.brand_product' => function($query) {
				$query->take(12)->skip(12 * (Input::get('page') - 1));
				$query->orderBy('id', 'desc');
			}, 'brand_size.brand_product.brand_product_image'])->orderBy('id', 'desc')->get();
			$data['brand_paginate'] = BrandProduct::whereHas('brand_size', function($query) use ($brand) {
				$query->whereHas('brand', function($queryy) use ($brand) {
					$queryy->where('name', '=', $brand);
				});
			})->paginate(12);
		} elseif ($brand != null && $brand_size != null) {
			$data['brand'] = Brand::where('name', '=', $brand)->with(['brand_size' => function($query) use ($brand_size) {
				$query->where('name', '=', $brand_size);
			}, 'brand_size.brand_product' => function($query) {
				$query->take(9)->skip(9 * (Input::get('page') - 1));
				$query->orderBy('id', 'desc');
			}, 'brand_size.brand_product.brand_product_image'])->orderBy('id', 'desc')->get();
			$data['brand_paginate'] = BrandProduct::whereHas('brand_size', function($query) use ($brand, $brand_size) {
				$query->where('name', '=', $brand_size);
				$query->whereHas('brand', function($queryy) use ($brand) {
					$queryy->where('name', '=', $brand);
				});
			})->paginate(9);
		}

		$data['categorie'] = Brand::with('brand_size')->get();

		return View::make('front.product.index', $data);
	}

	public function detail($brand_product, $id) {
		$brand_product = ucwords(str_replace('_', ' ', $brand_product));

		$data['brand_product'] = BrandProduct::with('brand_product_image', 'brand_size.brand')->where('name', 'like', '%'.$brand_product.'%')->where('id', '=', $id)->first();

		return View::make('front.product.detail', $data);
	}
}
