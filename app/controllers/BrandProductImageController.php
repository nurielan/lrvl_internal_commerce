<?php

class BrandProductImageController extends BaseController {

	public function index($brandproductid) {
		$data['brandproductimage'] = BrandProductImage::where('brand_product_id', '=', $brandproductid)->get();
		$brandproduct = BrandProduct::find($brandproductid);

		Session::put('brandproductimage.brand_product_id', $brandproductid);
		Session::put('brandproduct.name', $brandproduct->name);

		return View::make('back.brandproductimage.index', $data);
	}

	public function create() {
		return View::make('back.brandproductimage.create');
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			//'title' => 'required|unique:brand_product_image,title',
			'image' => 'required|image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandproductimage.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandproductimage = new BrandProductImage;
			$brandproductimage->brand_product_id = Session::get('brandproductimage.brand_product_id');
			/*$brandproductimage_title = Session::get('brandproduct.name').'-_-'.Input::get('title');
			$brandproductimage->title = $brandproductimage_title;
			$brandproductimage->content = Input::get('content');
			if (Input::hasFile('image')) {
				$title = strtolower(str_replace(' ', '_', $brandproductimage_title));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(800, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/original/'.$title.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/thumbnail/'.$title.'.'.$extension), 50);

				$brandproductimage->image = $title.'.'.$extension;
			}*/
			if (Input::hasFile('image')) {
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(600, 400, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->fit(320, 240, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/thumbnail/'.$name.'.'.$extension), 40);

				$brandproductimage->image = $name.'.'.$extension;
			}

			$brandproductimage->push();

			Session::flash('event.brandproductimage.success', 'New Brand Product Image saved successfully.');

			return Redirect::route('b_brandproductimage_index', Session::get('brandproductimage.brand_product_id'));
		}
	}

	public function edit($id) {
		$data['brandsize'] = BrandSize::with('brand')->get();
		$data['brandproductimage'] = BrandProductImage::find($id);

		return View::make('back.brandproductimage.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			//'title' => 'unique:brand_product_image,title',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandproductimage.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandproductimage = BrandProductImage::find(Input::get('id'));
			/*$brandproductimage_title = Session::get('brandproduct.name').'-_-'.Input::get('title');
			$brandproductimage->title = $brandproductimage_title;
			$brandproductimage->content = Input::get('content');
			if (Input::has('title') && ! Input::hasFile('image')) {
				
				$title = strtolower(str_replace(' ', '_', $brandproductimage_title));
				$extension = substr($brandproductimage->image, strpos($brandproductimage->image, '.'));

				rename(public_path('assets/images/brandproductimage/original/'.$brandproductimage->image), public_path('assets/images/brandproductimage/original/'.$title.$extension));
				rename(public_path('assets/images/brandproductimage/thumbnail/'.$brandproductimage->image), public_path('assets/images/brandproductimage/thumbnail/'.$title.$extension));

				$brandproductimage->image = $title.$extension;
			} elseif (Input::has('title') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/brandproductimage/original/'.$brandproductimage->image));
				File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brandproductimage->image));

				$title = strtolower(str_replace(' ', '_', $brandproductimage_title));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(800, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/original/'.$title.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/thumbnail/'.$title.'.'.$extension), 50);

				$brandproductimage->image = $title.'.'.$extension;
			}*/
			//if (Input::has('title') && Input::hasFile('image')) {
			if (Input::hasFile('image')) {
				File::delete(public_path('assets/images/brandproductimage/original/'.$brandproductimage->image));
				File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brandproductimage->image));

				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(600, 400, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->fit(320, 240, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brandproductimage/thumbnail/'.$name.'.'.$extension), 40);

				$brandproductimage->image = $name.'.'.$extension;
			}
			
			$brandproductimage->push();

			//Session::flash('event.brandproductimage.success', 'Brand Product Image '.$brandproductimage_title.' updated successfully.');
			Session::flash('event.brandproductimage.success', 'Brand Product Image updated successfully.');

			return Redirect::route('b_brandproductimage_index', Session::get('brandproductimage.brand_product_id'));
		}
	}

	public function destroy() {
		$brandproductimage = BrandProductImage::find(Input::get('id'));

		if ($brandproductimage->image) {
			File::delete(public_path('assets/images/brandproductimage/original/'.$brandproductimage->image));
			File::delete(public_path('assets/images/brandproductimage/thumbnail/'.$brandproductimage->image));
		}

		$brandproductimage->delete();

		/*DB::statement('ALTER TABLE brand_product_image DROP id');
		DB::statement('ALTER TABLE brand_product_image ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');*/

		//Session::flash('event.brandproductimage.success', 'Brand Product Image '.$title.' deleted successfully.');
		Session::flash('event.brandproductimage.success', 'Brand Product Image deleted successfully.');

		return Redirect::route('b_brandproductimage_index', Session::get('brandproductimage.brand_product_id'));
	}
}