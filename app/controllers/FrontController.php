<?php

class FrontController extends BaseController {

	public function home() {
		$data['home_image'] = HomeImage::all();

		return View::make('front.home', $data);
	}

	public function customer_care() {
		$data['profile'] = Profile::find(1);

		return View::make('front.customer_care', $data);
	}

	public function customer_care_store() {
		$validator = Validator::make(Input::all(), [
			'name' => ['required', 'regex:/^[a-zA-z]+((\s){1}[a-zA-z]+)*$/'],
			'email' => 'required|email',
			'subject' => 'required',
			'message' => 'required',
			'captcha' => 'required|captcha'
		]);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			$contact = new Contact;
			$contact->name = Input::get('name');
			$contact->email = Input::get('email');
			$contact->subject = Input::get('subject');
			$contact->message = Input::get('message');
			$contact->save();

			Session::flash('event.success', 'Thank you for contacting us! Message has been delivered.');

			return Redirect::back();
		}
	}
}