<?php

class FrontBuyerController extends BaseController {

	public function __construct() {
		$carbon = new Carbon();

		$order_main = OrderMain::where('status', '=', 0)->get();

		foreach ($order_main as $order_main_item) {
			if ($carbon->timestamp(strtotime($order_main_item->created_at))->timezone('Asia/Jakarta')->diffInDays($carbon->now('Asia/Jakarta')) > 3) {
				$om = OrderMain::find($order_main_item->id);
				$om_code = $om->code;
				$om_bc_code = $om->buyer_custom_code;
				$om_os_code = $om->order_shipping_code;
				$om_bv_id = $om->buyer_voucher_id;

				OrderList::where('order_main_code', '=', $om_code)->delete();

				$om->delete();

				BuyerCustom::where('code', '=', $om_bc_code)->delete();

				OrderShipping::where('code', '=', $om_os_code)->delete();

				BuyerVoucher::where('id', '=', $om_bv_id)->delete();

				/*DB::statement('ALTER TABLE order_list DROP id');
				DB::statement('ALTER TABLE order_list ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

				DB::statement('ALTER TABLE order_main DROP id');
				DB::statement('ALTER TABLE order_main ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

				DB::statement('ALTER TABLE buyer_custom DROP code');
				DB::statement('ALTER TABLE buyer_custom ADD code INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

				DB::statement('ALTER TABLE order_shipping DROP code');
				DB::statement('ALTER TABLE order_shipping ADD code INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

				DB::statement('ALTER TABLE buyer_voucher DROP id');
				DB::statement('ALTER TABLE buyer_voucher ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');*/
			}
		}
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			//'name' => ['required', 'regex:/^[a-zA-Z]+((\s){1}[a-zA-Z+])*$/'],
			'name' => 'required',
			'address' => 'required',
			//'phone_number_register' => ['required', 'regex: /^((\+){1}62|0){1}[1-9]+$/'],
			'phone_number_register' => 'required',
			'email' => 'required|email|unique:buyer,email',
			'password_register' => 'required|min:8',
			'repeat_password_register' => 'required|same:password_register'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.register.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$faker = Faker\Factory::create();

			$email_code = 'EC'.$faker->numberBetween(1000000000, 9999999999);

			$buyer = new Buyer;
			$buyer->name = Input::get('name');
			$buyer->address = Input::get('address');
			$buyer->phone_number = Input::get('phone_number_register');
			$buyer->email = Input::get('email');
			$buyer->password = Hash::make(Input::get('repeat_password_register'));
			$buyer->email_code = $email_code;
			//$buyer->status = 1;
			$buyer->save();

			$mail = [
				'name' => Input::get('name'),
				'email_code' => $email_code
			];

			Mail::send('front.buyer.mail', $mail, function($message) {
				//$message->from(Profile::find(1)->email, 'Internal Group');
				$message->from('admin@internalgroup.id', 'Internal Group');
				$message->to(Input::get('email'));$message->to('admin@internalgroup.id');
				$message->subject('Register Confirmation Code');
			});

			Session::flash('event.register.success', 'Confirmation link has been sent to your E-Mail.');
			//Session::flash('event.register.success', 'Registration Successed.');

			return Redirect::back();
		}
	}

	public function confirm_email($email_code) {
		$buyer = Buyer::where('email_code', '=', $email_code)->where('status', '=', 0)->first();

		if (count($buyer) != 1) {
			return Redirect::route('f_buyer_login')->with('event.register.error', ['Your email confirmation code not valid.']);
		} else {
			$buyer->status = 1;
			$buyer->save();

			return Redirect::route('f_buyer_login')->with('event.register.success', 'Your account has been confirmed.');
		}
	}

	public function login() {
		return View::make('front.buyer.login');
	}

	public function login_process() {
		$validator = Validator::make(Input::all(), [
			'phone_number_login' => 'required',
			'password_login' => 'required|min:8',
			'captcha_login' => 'required|captcha'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.login.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$regex_email = preg_match('/^[a-z0-9]+((\.|-|_){1}[a-z0-9]+)*@[a-z0-9]+((\.|-|_){1}[a-z]+)*$/', Input::get('phone_number_login'));

			if ($regex_email == 0) {
				$buyer = Buyer::where('phone_number', '=', Input::get('phone_number_login'))->where('status', '=', 1)->first();

				if (count($buyer) == 0) {
					Session::flash('event.login.error', ['Phone Number not valid.']);

					return Redirect::back();
				} else {
					if (Hash::check(Input::get('password_login'), $buyer->password)) {
						Auth::buyer()->login($buyer);

						//return Redirect::route('b_buyer_index');
						return Redirect::intended('buyer/show');
					} else {
						Session::flash('event.login.error', ['Password not valid.']);

						return Redirect::back();
					}
				}
			} else {
				if (Auth::buyer()->attempt(['email' => Input::get('phone_number_login'), 'password' => Input::get('password_login'), 'status' => 1])) {
					//return Redirect::route('b_buyer_index');
					return Redirect::intended('buyer/show');
				} else {
					Session::flash('event.login.error', ['E-Mail or Password not valid.']);

					return Redirect::back();
				}
			}
		}
	}

	public function logout_process() {
		Auth::buyer()->logout();

		Session::flash('event.logout.success', 'You are logged out successfully.');

		return Redirect::route('f_buyer_login');
	}

	public function index() {
		return View::make('front.buyer.index');
	}

	public function edit() {
		$data['buyer'] = Buyer::find(Auth::buyer()->user()->id);

		return View::make('front.buyer.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'name' => ['required', 'regex:/^[a-zA-Z]+((\s){1}[a-zA-Z]+)*$/'],
			'address' => 'required',
			'phone_number' => ['required', 'regex: /^((\+){1}62|08|02|03){1}[0-9]+$/'],
			'email' => 'required|email'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.buyer.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$buyer = Buyer::find(Auth::buyer()->user()->id);
			$buyer->name = Input::get('name');
			$buyer->address = Input::get('address');
			$buyer->phone_number = Input::get('phone_number');
			$buyer->email = Input::get('email');
			$buyer->save();

			Session::flash('event.buyer.success', 'Update Data successfully.');

			return Redirect::back();
		}
	}

	public function edit_password() {
		return View::make('front.buyer.edit_password');
	}

	public function update_password() {
		$validator = Validator::make(Input::all(), [
			'old_password' => 'required|min:8',
			'new_password' => 'required|min:8',
			'repeat_new_password' => 'required|same:new_password'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.buyer.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			if (Hash::check(Input::get('old_password'), Auth::buyer()->user()->password)) {
				$buyer = Buyer::find(Auth::buyer()->user()->id);
				$buyer->password = Hash::make(Input::get('repeat_new_password'));
				$buyer->save();

				Session::flash('event.buyer.success', 'Update Password successfully.');

				return Redirect::back();
			} else {
				Session::flash('event.buyer.error', ['Old Password not valid.']);

				return Redirect::back();
			}
		}
	}

	public function show() {
		$data['order'] = OrderMain::where('buyer_id', '=', Auth::buyer()->user()->id)->orderBy('created_at', 'desc')->get();

		return View::make('front.buyer.show', $data);
	}

	public function show_modal($order_main_code) {
		if (Request::ajax()) {
			$data['order'] = OrderMain::with('order_list.brand_product', 'buyer', 'buyer_custom', 'order_shipping', 'buyer_voucher')->where('code', '=', $order_main_code)->first();

			if (Auth::buyer()->user()->point > 0 && $data['order']->status < 1) {
				$price_back = Point::find(1)->price_back * Auth::buyer()->user()->point;
			} else {
				$price_back = 0;
			}

			$data['price_back'] = $price_back;

			return View::make('front.buyer.modal', $data);
		}
	}

	public function show_confirm($order_main_code) {
		$data['order_main_code'] = $order_main_code;

		return View::make('front.buyer.confirm', $data);
	}

	public function store_confirm() {
		$validator = Validator::make(Input::all(), [
			'bank' => 'required|alpha',
			//'account_number' => ['required', 'regex:/^[a-zA-Z0-9]+$/'],
			'account_number' => 'required',
			'amount' => 'required|numeric'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.buyer.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$order = OrderMain::where('code', '=', Input::get('order_main_code'))->first();

			if (Input::get('amount') != $order->total_price) {
				return Redirect::back()->with('event.buyer.error', ['Value Amount must valued at Rp. '.number_format($order->total_price, 0, ',', '.').''])->withInput(Input::all());
			} else {
				$order_confirm = new OrderConfirm;
				$order_confirm->order_main_code = $order->code;
				$order_confirm->via = 'bank';
				$order_confirm->bank = Input::get('bank');
				$order_confirm->account_number = Input::get('account_number');
				$order_confirm->amount = Input::get('amount');
				$order_confirm->save();

				$oc = OrderConfirm::with(['order_main', 'order_main.buyer'])->where('order_main_code', '=', $order->code)->first();

				Mail::send('front.buyer.mail_confirm', ['data' => $oc], function($message) {
					$message->from('salesonline@internalgroup.id', 'Sales Online Internal Store');
					$message->to('onlinefinance@internalgroup.id');
					$message->to('admin@internalgroup.id');
					$message->subject('Order Confirmation');
				});

				/*$om = OrderMain::where('code', '=', $order->code)->first();

				Mail::send('back.order_main.mail', ['data' => $om], function($message) {
					$message->from('admin@internalgroup.id', 'Internal Group');
					//$message->from('nuril@idekreatif.id');
					//$message->to('firegliese@gmail.com');
					$message->to('onlinefinance@internalgroup.id');
					//$message->to('admin@internalgroup.id');
					$message->subject('Order Confirmed');
				});*/

				$order->status = 1;
				$order->save();

				Session::flash('event.buyer.success', 'Thank you for your Order Confirmation. Your Order is being processed.');

				return Redirect::route('f_buyer_show');
			}
		}
	}

	public function show_invoice() {
		//$data['order'] = OrderMain::with('order_list.brand_product', 'buyer', 'buyer_custom', 'order_shipping', 'buyer_voucher')->where('code', '=', Input::get('code'))->first();

		$pdf = PDF::loadView('front.buyer.invoice');

		//return $pdf->download('invoice.pdf');
		return $pdf->stream();
	}
}
