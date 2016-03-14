<?php

use hok00age\RajaOngkir;

class FrontProductCartController extends BaseController {

	public function __construct() {
		$rajaongkir = new RajaOngkir("cb3bec8c07b832b421e22ebd229d35dc");

		if (! Cache::has('rajaongkir')) {
			$expiredAt = Carbon::now()->addMinutes(60);

			Cache::put('rajaongkir', json_decode($rajaongkir->getCity()->raw_body), $expiredAt);
		}
	}

	public function data($no, $params = null) {
		header('Content-Type: application/json');

		switch ($no) {
			case 1:
				# code...
				foreach (Cache::get('rajaongkir')->rajaongkir->results as $results_item) {
					$data1['id'] = $results_item->city_id;
					$data1['value'] = $results_item->city_name.($results_item->type == 'Kota' ? ' (Kota)' : '');
					$data2[] = $data1;
				}

				echo json_encode($data2);

				break;
			
			default:
				# code...
				break;
		}
	}

	public function index() {
		$data['cart_content'] = Cart::content();

		if (count(Cart::content()) != 0) {
			foreach (Cart::content() as $cart_item) {
				$weight[] = $cart_item->options->weight * $cart_item->qty;
			}

			$data['cart_content_weight'] = array_sum($weight);

			Session::put('cart.weight', $data['cart_content_weight']);
		}

		return View::make('front.product.cart.index', $data);
		/*echo '<pre>';
		print_r(Cart::content()['42a537abd035c9b678032be592f73d4d']->options->options['weight']);
		echo '</pre>';*/
	}

	public function create() {
		
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'quantity' => ['required', 'integer', 'regex:/^\d$/']
		]);

		if ($validator->fails()) {
			return Redirect::back();
		} else {
			$brand_product = BrandProduct::find(Input::get('brand_product_id'));
			$cart_search = Cart::search(['options' => ['brand_product_id' => $brand_product->id]]);

			if ($cart_search == false) {
				//Cart::add(str_random(8), $brand_product->name, Input::get('quantity'), $brand_product->price, 'options' => ['brand_product_id' => $brand_product->id]);
				Cart::add(['id' => str_random(8), 'name' => $brand_product->name, 'qty' => Input::get('quantity'), 'price' => $brand_product->price, 'options' => ['brand_product_id' => $brand_product->id, 'weight' => $brand_product->weight]]);
			} else {
				Cart::update($cart_search[0], Input::get('quantity') + Cart::get($cart_search[0])['qty']);
			}

			return Redirect::route('f_product_cart_index');
		}
	}

	public function show() {
		
	}

	public function edit() {
		
	}

	public function update() {
		for ($i = 0; $i < sizeof(Input::get('quantity')); $i++) {
			$quantity = ['quantity.'.$i => ['required', 'integer', 'regex:/^\d$/']];
		}

		$validator = Validator::make(Input::all(), $quantity);

		if ($validator->fails()) {
			return Redirect::back();
		} else {
			$i = 0;

			foreach (Cart::content() as $cart_item) {
				Cart::update($cart_item->rowid, Input::get('quantity')[$i++]);
			}

			return Redirect::back();
		}
	}

	public function destroy($rowid) {
		Cart::remove($rowid);

		return Redirect::back();
	}

	public function buyer() {
		if (Auth::buyer()->user()->point > 0) {
			Session::put('price_back', Point::find(1)->price_back);
		} else {
			Session::put('price_back', 0);
		}

		return View::make('front.product.cart.buyer');
	}

	public function buyer_process() {
		$validator = Validator::make(Input::all(), [
			'name' => ['required', 'regex:/^[a-zA-Z]+((\s)[a-zA-Z]+)*$/'],
			'email' => 'required|email',
			'phone_number' => ['required', 'regex:/^((\+){1}62|08|02|03){1}[0-9]+$/'],
			'address' => 'required',
			'destination' => 'required',
			'spend_point' => 'numeric'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.buyer.error', $validator->messages()->all());
		} else {
			if (! Input::has('destination_id')) {
				return Redirect::back()->with('event.buyer.error', ['City not valid.']);
			} else {
				if (Input::has('account')) {
					Session::put('buyer.account', 1);
				}
				Session::put('buyer.name', Input::get('name'));
				Session::put('buyer.email', Input::get('email'));
				Session::put('buyer.phone_number', Input::get('phone_number'));
				Session::put('buyer.address', Input::get('address'));
				Session::put('buyer.message', Input::get('message'));
				Session::put('buyer.destination_id', Input::get('destination_id'));
				Session::put('buyer.destination', Input::get('destination'));
				Session::put('buyer.service', Input::get('service'));

				if (Auth::buyer()->user()->point > 0) {
					Session::put('price_back', Point::find(1)->price_back * Input::get('spend_point'));
				} else {
					Session::put('price_back', 0);
				}

				$buyer = Buyer::find(Auth::buyer()->user()->id);
				$buyer->point = $buyer->point - Input::get('spend_point');
				$buyer->save();

				return Redirect::route('f_product_cart_shipping');
			}
		}
	}

	public function shipping() {
		$rajaongkir = new RajaOngkir("cb3bec8c07b832b421e22ebd229d35dc");
		$data['shipping_cost'] = $rajaongkir->getCost(23, Session::get('buyer.destination_id'), Session::get('cart.weight'), Session::get('buyer.service'))->body->rajaongkir;

		return View::make('front.product.cart.shipping', $data);

		/*echo '<pre>';
		print_r($data['shipping_cost']);
		echo '</pre>';*/
	}

	public function shipping_process() {
		if (! Input::has('service_package')) {
			return Redirect::back()->with('event.shipping.error', ['Please choose Service Package.']);
		} else {
			$service_package = explode(',', Input::get('service_package'));

			Session::put('buyer.service_delivery', $service_package[0]);
			Session::put('buyer.service_package', $service_package[1]);
			Session::put('buyer.cost', $service_package[2]);
			Session::put('buyer.estimation', $service_package[3]);

			return Redirect::route('f_product_cart_detail');
		}
	}

	public function detail() {
		return View::make('front.product.cart.detail');
	}

	public function detail_process() {
		$faker = Faker\Factory::create();

		$buyer_custom_code = 'BCC'.date('dmYhis').$faker->numberBetween(100, 999);
		$order_shipping_code = 'OSC'.date('dmYhis').$faker->numberBetween(100, 999);
		//$order_main_code = 'IOMC'.date('dmYhis').$faker->numberBetween(1000000000, 9999999999);
		$order_main_code = 'INT'.date('dmYhis').$faker->numberBetween(100, 999);

		// Buyer Custom
		if (Session::has('buyer.account')) {
			$buyer_custom = new BuyerCustom;
			$buyer_custom->code = $buyer_custom_code;
			$buyer_custom->name = Session::get('buyer.name');
			$buyer_custom->email = Session::get('buyer.email');
			$buyer_custom->phone_number = Session::get('buyer.phone_number');
			$buyer_custom->address = Session::get('buyer.address');
			$buyer_custom->message = Session::get('buyer.message');
			$buyer_custom->save();
		}

		// Order Shipping
		$order_shipping = new OrderShipping;
		$order_shipping->code = $order_shipping_code;
		$order_shipping->order_main_code = $order_main_code;
		$order_shipping->origin = 'Bandung (Kota)';
		$order_shipping->destination = Session::get('buyer.destination');
		$order_shipping->service = Session::get('buyer.service_delivery');
		$order_shipping->service_package = Session::get('buyer.service_package');
		$order_shipping->weight = Session::get('cart.weight');
		$order_shipping->cost = Session::get('buyer.cost');
		$order_shipping->estimation = Session::get('buyer.estimation');
		$order_shipping->save();

		// Order List
		foreach (Cart::content() as $cart_item) {
			$order_list = new OrderList;
			$order_list->order_main_code = $order_main_code;
			$order_list->brand_product_id = $cart_item->options->brand_product_id;
			$order_list->quantity = $cart_item->qty;
			$order_list->subtotal_price = $cart_item->price * $cart_item->qty;
			$order_list->save();

			$product1['name'] = BrandProduct::find($cart_item->options->brand_product_id)->name;
			$product1['quantity'] = $cart_item->qty;
			$product1['subtotal_price'] = $cart_item->price * $cart_item->qty;
			$product2[] = (object) $product1;
		}

		// Order Main
		$order_main = new OrderMain;
		$order_main->code = $order_main_code;
		$order_main->buyer_id = Auth::buyer()->user()->id;
		if (Session::has('buyer.account')) {
			$order_main->buyer_custom_code = $buyer_custom_code;
		}
		$order_main->total_price = Session::get('buyer.cost') + Cart::total() - Session::get('price_back');
		$order_main->status = 0;
		$order_main->save();

			$mail = [
				'order_main' => [
					'code' => $order_main_code
				],
				'buyer' => [
					'name' => Auth::buyer()->user()->name,
					'email' => Auth::buyer()->user()->email,
					'phone_number' => Auth::buyer()->user()->phone_number,
					'address' => Auth::buyer()->user()->address
				],
				'buyer_custom' => [
					'name' => Session::get('buyer.name'),
					'email' => Session::get('buyer.email'),
					'phone_number' => Session::get('buyer.phone_number'),
					'address' => Session::get('buyer.address')
				],
				'order_shipping' => [
					'destination' => Session::get('buyer.destination'),
					'service' => Session::get('buyer.service_delivery'),
					'service_package' => Session::get('buyer.service_package'),
					'weight' => Session::get('cart.weight'),
					'cost' => Session::get('buyer.cost'),
					'estimation' => Session::get('buyer.estimation')
				],
				'product' => $product2,
				'bank' => Bank::all(),
				'price_back' => Session::get('price_back')
			];

		Mail::send('front.product.cart.mail', $mail, function($message) {
			$message->from('admin@internalgroup.id', 'Internal Group');
			//$message->from(Profile::find(1)->email, 'Internal Group');
			//$message->from('nuril@idekreatif.id', 'Internal Group');
			if (Session::has('buyer.account')) {
				$message->to(Session::get('buyer.email'));
			} else {
				$message->to(Auth::buyer()->user()->email);
			}
			$message->to('salesonline@internalgroup.id');
			$message->to('admin@internalgroup.id');
			$message->subject('Buying Confirmation');
		});

		Session::forget('cart');
		Cart::destroy();
		Session::forget('buyer');

		return Redirect::route('f_buyer_show');
	}
}
