<?php

class ShippingServiceController extends BaseController {

	public function index() {
		$data['shipping_service'] = ShippingService::all();

		return View::make('back.shipping_service.index', $data);
	}

	public function create() {
		return View::make('back.shipping_service.create');
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required|unique:shipping_service,name',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.shipping_service.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$shipping_service = new ShippingService;
			$shipping_service->name = Input::get('name');
			
			if (Input::hasFile('image')) {
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(600, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/shipping_service/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/shipping_service/thumbnail/'.$name.'.'.$extension), 40);

				$shipping_service->image = $name.'.'.$extension;
			}

			$shipping_service->push();

			Session::flash('event.shipping_service.success', 'New Shipping Service saved successfully.');

			return Redirect::route('b_shipping_service_index');
		}
	}

	public function edit($id) {
		$data['shipping_service'] = ShippingService::find($id);

		return View::make('back.shipping_service.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.shipping_service.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$shipping_service = ShippingService::find(Input::get('id'));
			$shipping_service->name = Input::get('name');
			
			if (Input::has('name') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/shipping_service/original/'.$shipping_service->image));
				File::delete(public_path('assets/images/shipping_service/thumbnail/'.$shipping_service->image));

				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(600, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/shipping_service/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/shipping_service/thumbnail/'.$name.'.'.$extension), 40);

				$shipping_service->image = $name.'.'.$extension;
			}
			
			$shipping_service->push();

			Session::flash('event.shipping_service.success', 'Shipping Service '.Input::get('name').' updated successfully.');

			return Redirect::route('b_shipping_service_index');
		}
	}

	public function destroy() {
		$shipping_service = ShippingService::find(Input::get('id'));
		$name = $shipping_service->name;
		if ($shipping_service->image) {
			File::delete(public_path('assets/images/shipping_service/original/'.$shipping_service->image));
			File::delete(public_path('assets/images/shipping_service/thumbnail/'.$shipping_service->image));
		}
		$shipping_service->delete();

		DB::statement('ALTER TABLE shipping_service DROP id');
		DB::statement('ALTER TABLE shipping_service ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		Session::flash('event.shipping_service.success', 'Shipping Service '.$name.' deleted successfully.');

		return Redirect::route('b_shipping_service_index');
	}
}