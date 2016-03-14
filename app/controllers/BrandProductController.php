<?php

class BrandProductController extends BaseController {

	public function index($brand_size_id) {
		$data['brandproduct'] = BrandProduct::where('brand_size_id', '=', $brand_size_id)->get();

		Session::put('brand_product.brand_size_id', $brand_size_id);

		return View::make('back.brandproduct.index', $data);
	}

	public function create() {
		$data['brandsize'] = BrandSize::with('brand')->get();

		return View::make('back.brandproduct.create', $data);
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			'stock' => 'integer',
			'price' => 'integer',
			'weight' => 'integer'
			//'discount' => 'integer'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandproduct.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandproduct = new BrandProduct;
			$brandproduct->brand_size_id = Session::get('brand_product.brand_size_id');
			$brandproduct->name = Input::get('name');
			$brandproduct->stock = Input::get('stock');
			$brandproduct->price = Input::get('price');
			$brandproduct->weight = Input::get('weight');
			//$brandproduct->discount = Input::get('discount');
			$brandproduct->description = Input::get('description');
			$brandproduct->push();

			Session::flash('event.brandproduct.success', 'New BrandProduct saved successfully.');

			return Redirect::route('b_brandproduct_index', Session::get('brand_product.brand_size_id'));
		}
	}

	public function edit($id) {
		$data['brandsize'] = BrandSize::with('brand')->get();
		$data['brandproduct'] = BrandProduct::find($id);

		return View::make('back.brandproduct.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			'stock' => 'integer',
			'price' => 'integer',
			'weight' => 'integer'
			//'discount' => 'integer'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandproduct.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandproduct = BrandProduct::find(Input::get('id'));
			$brandproduct->brand_size_id = Session::get('brand_product.brand_size_id');
			$brandproduct->name = Input::get('name');
			$brandproduct->stock = Input::get('stock');
			$brandproduct->price = Input::get('price');
			$brandproduct->weight = Input::get('weight');
			//$brandproduct->discount = Input::get('discount');
			$brandproduct->description = Input::get('description');
			$brandproduct->push();

			Session::flash('event.brandproduct.success', 'BrandProduct '.Input::get('name').' updated successfully.');

			return Redirect::back();
		}
	}

	/*public function destroy() {
		$brandproduct = BrandProduct::find(Input::get('id'));

		$brandproductimage = BrandProductImage::where('brand_product_id', '=', $brandproduct->id)->get();
		foreach ($brandproductimage as $brandproductimages) {
			$title = $brandproductimages->title;
			if ($brandproductimages->image) {
				File::delete(public_path('assets/images/brandproductimage/original/'.$brandproductimages->image));
				File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brandproductimages->image));
			}
			$brandproductimages->delete();
		}
		DB::statement('ALTER TABLE brand_product_image DROP id');
		DB::statement('ALTER TABLE brand_product_image ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		$name = $brandproduct->name;
		$brandproduct->delete();

		DB::statement('ALTER TABLE brand_product DROP id');
		DB::statement('ALTER TABLE brand_product ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		Session::flash('event.brandproduct.success', 'BrandProduct '.$name.' deleted successfully.');

		return Redirect::route('b_brandproduct_index', Session::get('brand_product.brand_size_id'));
	}*/

	public function destroy() {
		$brand_product = BrandProduct::with('brand_product_image')->where('id', '=', Input::get('id'))->first();

		foreach ($brand_product->brand_product_image as $brand_product_images) {
			if ($brand_product_images->image != 'empty.png' || $brand_product_images->image != null) {
				File::delete(public_path('assets/images/brandproductimage/original/'.$brand_product_images->image));
				File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brand_product_images->image));
			}

			BrandProductImage::find($brand_product_images->id)->delete();
		}

		$name = $brand_product->name;
		$brand_product->delete();

		Session::flash('event.brandproduct.success', 'Brand Product '.$name.' deleted successfully.');

		return Redirect::route('b_brandproduct_index', Session::get('brand_product.brand_size_id'));
	}
}