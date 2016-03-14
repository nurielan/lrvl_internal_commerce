<?php

class PointController extends BaseController {

	public function index() {
		$data['buyer'] = Buyer::where('point', '>', 0)->get();
		$data['point'] = Point::find(1);

		return View::make('back.point.index', $data);
	}

	public function edit($id = 1) {
		$data['point'] = Point::find($id);

		return View::make('back.point.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'price' => 'required|integer',
			'price_back' => 'required|integer'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.point.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$point = Point::find(1);
			$point->price = Input::get('price');
			$point->price_back = Input::get('price_back');
			$point->push();

			Session::flash('event.point.success', 'Point saved successfully.');

			return Redirect::route('b_point_edit');
		}
	}
}