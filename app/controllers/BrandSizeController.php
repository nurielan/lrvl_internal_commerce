<?php

class BrandSizeController extends BaseController {

	public function index() {
		$data['brand'] = Brand::all();

		return View::make('back.brandsize.index', $data);
	}

	public function show($brandid) {
		$data['brandsize'] = BrandSize::whereHas('brand', function($query) use ($brandid) {
			$query->where('id', '=', $brandid);
		})->get();

		Session::put('brandsize.brand_id', $brandid);

		return View::make('back.brandsize.show', $data);
	}

	public function create() {
		$data['brand'] = Brand::all();

		return View::make('back.brandsize.create', $data);
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			//'description' => 'required'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandsize.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandsize = new BrandSize;
			$brandsize->brand_id = Session::get('brandsize.brand_id');
			$brandsize->name = Input::get('name');
			$brandsize->description = Input::get('description');
			$brandsize->push();

			Session::flash('event.brand.success', 'New BrandSize saved successfully.');

			return Redirect::route('b_brandsize_show', Session::get('brandsize.brand_id'));
		}
	}

	public function edit($id) {
		$data['brand'] = Brand::all();
		$data['brandsize'] = BrandSize::find($id);

		return View::make('back.brandsize.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			//'description' => 'required'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandsize.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandsize = BrandSize::find(Input::get('id'));
			$brandsize->brand_id = Session::get('brandsize.brand_id');
			$brandsize->name = Input::get('name');
			$brandsize->description = Input::get('description');
			$brandsize->push();

			Session::flash('event.brandsize.success', 'BrandSize '.Input::get('name').' updated successfully.');

			return Redirect::back();
		}
	}

	/*public function destroy() {
		$brandsize = BrandSize::find(Input::get('id'));
		$name = $brandsize->name;
		$brandsize->delete();

		DB::statement('ALTER TABLE brand_size DROP id');
		DB::statement('ALTER TABLE brand_size ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		Session::flash('event.brand.success', 'BrandSize '.$name.' deleted successfully.');

		return Redirect::route('b_brandsize_index');
	}*/

	public function destroy() {
		$brand_size = BrandSize::with(['brand_size_image', 'brand_product', 'brand_product.brand_product_image'])->where('id', '=', Input::get('id'))->first();

		foreach ($brand_size->brand_size_image as $brand_size_images) {
			if ($brand_size_images->image != 'empty.png' || $brand_size_images->image != null) {
				File::delete(public_path('assets/images/brandsizeimage/original/'.$brand_size_images->image));
				File::delete(public_path('assets/images/brandsizeimage/thumbnail/'.$brand_size_images->image));
			}

			BrandSizeImage::find($brand_size_images->id)->delete();
		}

		foreach ($brand_size->brand_product as $brand_products) {
			foreach ($brand_products->brand_product_image as $brand_product_images) {
				if ($brand_product_images->image != 'empty.png' || $brand_product_images->image != null) {
					File::delete(public_path('assets/images/brandproductimage/original/'.$brand_product_images->image));
					File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brand_product_images->image));
				}

				BrandProductImage::find($brand_product_images->id)->delete();
			}

			BrandProduct::find($brand_products->id)->delete();
		}

		$name = $brand_size->name;
		$brand_size->delete();

		Session::flash('event.brand.success', 'Brand Size '.$name.' deleted successfully.');

		return Redirect::route('b_brandsize_index');
	}
}