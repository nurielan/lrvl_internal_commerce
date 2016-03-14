<?php

class AdminController extends BaseController {

	public function __construct() {
		if (Session::has('event')) {
			Session::forget('event');
		}
	}

	public function login() {
		return View::make('back.admin.login');
	}

	public function login_process() {
		$validator = Validator::make(Input::all(), [
			'username' => 'required',
			'password' => 'required',
			'captcha' => 'required|captcha'
		]);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			$regex_email = preg_match('/^[a-z0-9]+((\.|-|_){1}[a-z0-9]+)*@[a-z0-9]+((\.|-|_){1}[a-z]+)*$/', Input::get('username'));

			if ($regex_email == 0) {
				$admin = Admin::where('username', '=', Input::get('username'))->first();

				if (count($admin) == 0) {
					Session::flash('event', 'Username not valid.');

					return Redirect::back();
				} else {
					if (Hash::check(Input::get('password'), $admin->password)) {
						Auth::admin()->login($admin);

						return Redirect::route('b_admin_index');
					} else {
						Session::flash('event', 'Password not valid.');

						return Redirect::back();
					}
				}
			} else {
				if (Auth::admin()->attempt(['email' => Input::get('username'), 'password' => Input::get('password')])) {
					return Redirect::route('b_admin_index');
				} else {
					Session::flash('event', 'E-Mail or Password not valid.');

					return Redirect::back();
				}
			}
		}
	}

	public function logout_process() {
		Auth::admin()->logout();

		Session::flash('event', 'You are logged out successfully.');

		return Redirect::route('b_admin_login');
	}

	public function index() {
		return View::make('back.admin.index');
	}

	public function edit() {
		$data['admin'] = Admin::find(Auth::admin()->user()->id);

		return View::make('back.admin.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'username' => ['required', 'regex: /^[A-Za-z0-9]+((\.|-|_){1}[A-Za-z0-9]+)*$/'],
			'email' => 'required|email'
		]);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			$admin = Admin::find(Auth::admin()->user()->id);
			$admin->username = Input::get('username');
			$admin->email = Input::get('email');
			$admin->save();

			Session::flash('event', 'Update Data successfully.');

			return Redirect::back();
		}
	}

	public function edit_password() {
		return View::make('back.admin.edit_password');
	}

	public function update_password() {
		$validator = Validator::make(Input::all(), [
			'old_password' => 'required|min:8',
			'new_password' => 'required|min:8',
			'repeat_new_password' => 'required|same:new_password'
		]);

		if ($validator->fails()) {
			return Redirect::back()->withErrors($validator)->withInput(Input::all());
		} else {
			if (Hash::check(Input::get('old_password'), Auth::admin()->user()->password)) {
				$admin = Admin::find(Auth::admin()->user()->id);
				$admin->password = Hash::make(Input::get('repeat_new_password'));
				$admin->save();

				Session::flash('event', 'Update Password successfully.');

				return Redirect::back();
			} else {
				Session::flash('event', 'Old Password not valid.');

				return Redirect::back();
			}
		}
	}
}
