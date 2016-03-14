<?php

class BrandController extends BaseController {

	public function index() {
		$data['brand'] = Brand::all();

		return View::make('back.brand.index', $data);
	}

	public function create() {
		return View::make('back.brand.create');
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			//'description' => 'required',
			'image' => 'required|image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brand.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brand = new Brand;
			$brand->name = Input::get('name');
			$brand->description = Input::get('description');
			if (Input::hasFile('image')) {
				$name = strtolower(str_replace(' ', '_', Input::get('name')));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(512, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brand/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(256, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brand/thumbnail/'.$name.'.'.$extension), 50);

				$brand->image = $name.'.'.$extension;
			}
			/*if (Input::hasFile('image')) {
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(600, 400, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brand/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->fit(320, 240, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brand/thumbnail/'.$name.'.'.$extension), 40);

				$brand->image = $name.'.'.$extension;
			}*/
			
			$brand->push();

			Session::flash('event.brand.success', 'New Brand saved successfully.');

			return Redirect::route('b_brand_index');
		}
	}

	public function edit($id) {
		$data['brand'] = Brand::find($id);

		return View::make('back.brand.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			//'description' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brand.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brand = Brand::find(Input::get('id'));
			$brand->name = Input::get('name');
			$brand->description = Input::get('description');
			/*if (Input::has('name') && ! Input::hasFile('image')) {
				
				$name = strtolower(str_replace(' ', '_', Input::get('name')));
				$extension = substr($brand->image, strpos($brand->image, '.'));

				rename(public_path('assets/images/brand/original/'.$brand->image), public_path('assets/images/brand/original/'.$name.$extension));
				rename(public_path('assets/images/brand/thumbnail/'.$brand->image), public_path('assets/images/brand/thumbnail/'.$name.$extension));

				$brand->image = $name.$extension;
			} else*/if (Input::has('name') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/brand/original/'.$brand->image));
				File::delete(public_path('assets/images/brand/thumbnail/'.$brand->image));

				//$name = strtolower(str_replace(' ', '_', Input::get('name')));
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(512, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brand/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(256, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brand/thumbnail/'.$name.'.'.$extension), 50);

				$brand->image = $name.'.'.$extension;
			}
			/*if (Input::has('name') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/brand/original/'.$brand->image));
				File::delete(public_path('assets/images/brand/thumbnail/'.$brand->image));

				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(600, 400, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brand/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->fit(320, 240, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brand/thumbnail/'.$name.'.'.$extension), 40);

				$brand->image = $name.'.'.$extension;
			}*/

			$brand->push();

			Session::flash('event.brand.success', 'Brand '.Input::get('name').' updated successfully.');

			return Redirect::route('b_brand_edit', Input::get('id'));
		}
	}

	/*public function destroy() {
		$brand = Brand::find(Input::get('id'));
		$name = $brand->name;
		if ($brand->image) {
			File::delete(public_path('assets/images/brand/original/'.$brand->image));
			File::delete(public_path('assets/images/brand/thumbnail/'.$brand->image));
		}
		$brand->delete();

		DB::statement('ALTER TABLE brand DROP id');
		DB::statement('ALTER TABLE brand ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		Session::flash('event.brand.success', 'Brand '.$name.' deleted successfully.');

		return Redirect::route('b_brand_index');
	}*/

	public function destroy() {
		$brand = Brand::with(['brand_size', 'brand_size.brand_size_image', 'brand_size.brand_product', 'brand_size.brand_product.brand_product_image'])->where('id', '=', Input::get('id'))->first();

		foreach ($brand->brand_size as $brand_sizes) {
			foreach ($brand_sizes->brand_size_image as $brand_size_images) {
				if ($brand_size_images->image != 'empty.png' || $brand_size_images->image != null) {
					File::delete(public_path('assets/images/brandsizeimage/original/'.$brand_size_images->image));
					File::delete(public_path('assets/images/brandsizeimage/thumbnail/'.$brand_size_images->image));
				}

				BrandSizeImage::find($brand_size_images->id)->delete();
			}

			foreach ($brand_sizes->brand_product as $brand_products) {
				foreach ($brand_products->brand_product_image as $brand_product_images) {
					if ($brand_product_images->image != 'empty.png' || $brand_product_images->image != null) {
						File::delete(public_path('assets/images/brandproductimage/original/'.$brand_product_images->image));
						File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brand_product_images->image));
					}

					BrandProductImage::find($brand_product_images->id)->delete();
				}

				BrandProduct::find($brand_products->id)->delete();
			}

			BrandSize::find($brand_sizes->id)->delete();
		}

		$name = $brand->name;

		if ($brand->image != 'empty.png' || $brand->image != null) {
			File::delete(public_path('assets/images/brand/original/'.$brand->image));
			File::delete(public_path('assets/images/brand/thumbnail/'.$brand->image));
		}

		$brand->delete();

		Session::flash('event.brand.success', 'Brand '.$name.' deleted successfully.');

		return Redirect::route('b_brand_index');
	}
}
