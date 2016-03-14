<?php

class HomeImageController extends BaseController {

	public function __construct() {
		Session::forget('event');
	}

	public function index() {
		$data['home_image'] = HomeImage::all();

		return View::make('back.home_image.index', $data);
	}

	public function create() {
		return View::make('back.home_image.create');
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'title' => ['required', 'regex: /^[A-Za-z0-9]+(\s[A-Za-z0-9]+)*$/'],
			//'content' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			$home_image = new HomeImage;
			$home_image->title = Input::get('title');
			$home_image->content = Input::get('content');
			if (Input::hasFile('image')) {
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->fit(1920, 1200, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/home_image/original/'.$name.'.'.$extension), 75);

				Image::make(Input::file('image'))->fit(320, 240, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/home_image/thumbnail/'.$name.'.'.$extension), 50);

				$home_image->image = $name.'.'.$extension;
			}
			$home_image->push();

			Session::flash('event', 'New Home Image saved successfully.');

			return Redirect::route('b_home_image_index');
		}
	}

	public function edit($id) {
		$data['home_image'] = HomeImage::find($id);

		return View::make('back.home_image.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'title' => ['required', 'regex: /^[A-Za-z0-9]+(\s[A-Za-z0-9]+)*$/'],
			//'content' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			$home_image = HomeImage::find(Input::get('id'));
			$home_image->title = Input::get('title');
			$home_image->content = Input::get('content');
			/*if (Input::has('title') && ! Input::hasFile('image')) {
				$name = strtolower(str_replace(' ', '_', Input::get('title')));
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = substr($home_image->image, strpos($home_image->image, '.'));

				rename(public_path('assets/images/home_image/original/'.$home_image->image), public_path('assets/images/home_image/original/'.$name.$extension));
				rename(public_path('assets/images/home_image/thumbnail/'.$home_image->image), public_path('assets/images/home_image/thumbnail/'.$name.$extension));

				$home_image->image = $name.$extension;
			} else*/if (Input::has('title') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/home_image/original/'.$home_image->image));
				File::delete(public_path('assets/images/home_image/thumbnail/'.$home_image->image));

				//$name = strtolower(str_replace(' ', '_', Input::get('title')));
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				/*Image::make(Input::file('image'))->resize(1920, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/home_image/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/home_image/thumbnail/'.$name.'.'.$extension), 50);*/
				Image::make(Input::file('image'))->fit(1920, 1200, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/home_image/original/'.$name.'.'.$extension), 75);

				Image::make(Input::file('image'))->fit(320, 240, function($constraint) {
					$constraint->upsize();
				})->save(public_path('assets/images/home_image/thumbnail/'.$name.'.'.$extension), 50);

				$home_image->image = $name.'.'.$extension;
			}
			$home_image->push();

			Session::flash('event', 'Home Image '.Input::get('title').' updated successfully.');

			return Redirect::route('b_home_image_index');
		}
	}

	public function destroy() {
		$home_image = HomeImage::find(Input::get('id'));
		$title = $home_image->title;
		if ($home_image->image) {
			File::delete(public_path('assets/images/home_image/original/'.$home_image->image));
			File::delete(public_path('assets/images/home_image/thumbnail/'.$home_image->image));
		}
		$home_image->delete();

		DB::statement('ALTER TABLE home_image DROP id');
		DB::statement('ALTER TABLE home_image ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		Session::flash('event', 'Home Image '.$title.' deleted successfully.');

		return Redirect::route('b_home_image_index');
	}
}