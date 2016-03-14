<?php

class BrandSizeImageController extends BaseController {

	public function index($brandsizeid) {
		$data['brandsizeimage'] = BrandSizeImage::where('brand_size_id', '=', $brandsizeid)->get();
		$brandsize = BrandSize::find($brandsizeid);

		Session::put('brandsizeimage.brand_size_id', $brandsizeid);
		Session::put('brandsize.name', $brandsize->name);

		return View::make('back.brandsizeimage.index', $data);
	}

	public function create() {
		return View::make('back.brandsizeimage.create');
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			//'title' => 'required|unique:brand_size_image,title',
			'image' => 'required|image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandsizeimage.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandsizeimage = new BrandSizeImage;
			$brandsizeimage->brand_size_id = Session::get('brandsizeimage.brand_size_id');
			/*$brandsizeimage_title = Session::get('brandsize.name').'-_-'.Input::get('title');
			$brandsizeimage->title = $brandsizeimage_title;
			$brandsizeimage->content = Input::get('content');

			if (Input::hasFile('image')) {
				$title = strtolower(str_replace(' ', '_', $brandsizeimage_title));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(800, 256)->save(public_path('assets/images/brandsizeimage/thumbnail/'.$title.'.'.$extension), 50);

				$brandsizeimage->image = $title.'.'.$extension;
			}*/
			if (Input::hasFile('image')) {
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(800, 256, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brandsizeimage/original/'.$name.'.'.$extension), 75);

				$brandsizeimage->image = $name.'.'.$extension;
			}

			$brandsizeimage->push();

			Session::flash('event.brandsizeimage.success', 'New Brand Size Image saved successfully.');

			return Redirect::route('b_brandsizeimage_index', Session::get('brandsizeimage.brand_size_id'));
		}
	}

	public function edit($id) {
		$data['brandsize'] = BrandSize::with('brand')->get();
		$data['brandsizeimage'] = BrandSizeImage::find($id);

		return View::make('back.brandsizeimage.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			//'title' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.brandsizeimage.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$brandsizeimage = BrandSizeImage::find(Input::get('id'));
			/*$brandsizeimage_title = Session::get('brandsize.name').'-_-'.Input::get('title');
			$brandsizeimage->title = $brandsizeimage_title;
			$brandsizeimage->content = Input::get('content');
			if (Input::has('title') && ! Input::hasFile('image')) {
				
				$title = strtolower(str_replace(' ', '_', $brandsizeimage_title));
				$extension = substr($brandsizeimage->image, strpos($brandsizeimage->image, '.'));

				rename(public_path('assets/images/brandsizeimage/original/'.$brandsizeimage->image), public_path('assets/images/brandsizeimage/original/'.$title.$extension));
				rename(public_path('assets/images/brandsizeimage/thumbnail/'.$brandsizeimage->image), public_path('assets/images/brandsizeimage/thumbnail/'.$title.$extension));

				$brandsizeimage->image = $title.$extension;
			} elseif (Input::has('title') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/brandsizeimage/original/'.$brandsizeimage->image));
				File::delete(public_path('assets/images/brandsizeimage/thumbnail/'.$brandsizeimage->image));

				$title = strtolower(str_replace(' ', '_', $brandsizeimage_title));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(800, 256)->save(public_path('assets/images/brandsizeimage/thumbnail/'.$title.'.'.$extension), 50);

				$brandsizeimage->image = $title.'.'.$extension;
			}*/
			//if (Input::has('title') && Input::hasFile('image')) {
			if (Input::hasFile('image')) {
				File::delete(public_path('assets/images/brandsizeimage/original/'.$brandsizeimage->image));

				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(800, 256, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/brandsizeimage/original/'.$name.'.'.$extension), 75);

				$brandsizeimage->image = $name.'.'.$extension;
			}

			$brandsizeimage->push();

			//Session::flash('event.brandsizeimage.success', 'Brand Size Image '.$brandsizeimage_title.' updated successfully.');
			Session::flash('event.brandsizeimage.success', 'Brand Size Image updated successfully.');

			return Redirect::route('b_brandsizeimage_index', Session::get('brandsizeimage.brand_size_id'));
		}
	}

	public function destroy() {
		$brandsizeimage = BrandSizeImage::find(Input::get('id'));
		
		if ($brandsizeimage->image) {
			File::delete(public_path('assets/images/brandsizeimage/original/'.$brandsizeimage->image));
			File::delete(public_path('assets/images/brandsizeimage/thumbnail/'.$brandsizeimage->image));
		}

		$brandsizeimage->delete();

		/*DB::statement('ALTER TABLE brand_size_image DROP id');
		DB::statement('ALTER TABLE brand_size_image ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');*/

		//Session::flash('event.brandsizeimage.success', 'Brand Size Image '.$title.' deleted successfully.');
		Session::flash('event.brandsizeimage.success', 'Brand Size Image deleted successfully.');

		return Redirect::route('b_brandsizeimage_index', Session::get('brandsizeimage.brand_size_id'));
	}
}