<?php

class OrderMainController extends BaseController {

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

	public function index() {
		$data['order_main'] = OrderMain::with('buyer', 'buyer_custom', 'buyer_voucher', 'order_shipping', 'order_list.brand_product')->orderBy('status', 'desc')->get();

		return View::make('back.order_main.index', $data);
	}

	public function show($code) {
		$data['order_main'] = OrderMain::with('buyer', 'buyer_custom', 'buyer_voucher', 'order_shipping', 'order_list.brand_product')->where('code', '=', $code)->first();

		return View::make('back.order_main.show', $data);
	}

	public function create() {
		//return View::make('back.order_main.create');
	}

	public function store() {
		/*$validator = Validator::make(Input::all(), [
			'name' => 'required',
			'description' => 'required',
			'image' => 'required|image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.order_main.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$order_main = new OrderMain;
			$order_main->name = Input::get('name');
			$order_main->description = Input::get('description');
			if (Input::hasFile('image')) {
				$name = strtolower(str_replace(' ', '_', Input::get('name')));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(512, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/order_main/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(256, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/order_main/thumbnail/'.$name.'.'.$extension), 50);

				$order_main->image = $name.'.'.$extension;
			}
			$order_main->push();

			Session::flash('event.order_main.success', 'New OrderMain saved successfully.');

			return Redirect::route('b_order_main_index');
		}*/
	}

	public function edit($id) {
		/*$data['order_main'] = OrderMain::find($id);

		return View::make('back.order_main.edit', $data);*/
	}

	public function update() {
		if (Input::has('id') && ! Input::has('code')) {
			$order_main = OrderMain::find(Input::get('id'));

			if ($order_main->status == 1) {
				$order_main->status = 2;
				$order_main->push();
			}

			Session::flash('event.order_main.success', 'Order Status with code: '.$order_main->code.' has been updated.');

			return Redirect::route('b_order_main_index');
		} elseif (Input::has('id') && Input::has('code')) {
			$validator = Validator::make(Input::all(), [
				'waybill_number' => 'required'
			]);

			if ($validator->fails()) {
				foreach ($validator->messages()->all() as $messages_item) {
					echo '<p>'.$messages_item.'</p>';
				}
			} else {
				$order_shipping = OrderShipping::where('code', '=', Input::get('code'))->first();
				$order_shipping->waybill_number = Input::get('waybill_number');
				$order_shipping->push();

				$order_main = OrderMain::with('order_list', 'order_list.brand_product', 'order_shipping', 'buyer', 'buyer_custom')->find(Input::get('id'));
				$order_main->status = 3;

				if ($order_main->status == 3) {
					Mail::send('back.order_main.mail_deliver', ['data' => $order_main], function($message) use ($order_main) {
						//$message->from('salesonline@internalgroup.id');
						$message->from('admin@internalgroup.id');
						$message->to($order_main->buyer->email);

						if ($order_main->buyer_custom != null) {
							$message->to($order_main->buyer_custom->email);
						}

						$message->subject('Order deliver');
					});
				}

				$id = Input::get('id');

				$buyer = Buyer::whereHas('order_main', function($query) use ($id) {
					$query->where('id', '=', $id);
				})->first();

				foreach ($order_main->order_list as $order_list_item) {
					$subtotal[] = $order_list_item->subtotal_price;
				}

				$buyer_point = $buyer->point;

				$point = Point::find(1);

				$buyer->point = floor(array_sum($subtotal) / $point->price) + $buyer_point;
				$buyer->push();

				$order_main->push();

				Session::flash('event.order_main.success', 'Order Status with code: '.$order_main->code.' has been updated.');

				return '<meta http-equiv="refresh" content="1; URL='.route('b_order_main_index').'">';
			}
		}

		/*$validator = Validator::make(Input::all(), [
			'name' => 'required',
			'description' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.order_main.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$order_main = OrderMain::find(Input::get('id'));
			$order_main->name = Input::get('name');
			$order_main->description = Input::get('description');
			if (Input::has('name') && ! Input::hasFile('image')) {
				
				$name = strtolower(str_replace(' ', '_', Input::get('name')));
				$extension = substr($order_main->image, strpos($order_main->image, '.'));

				rename(public_path('assets/images/order_main/original/'.$order_main->image), public_path('assets/images/order_main/original/'.$name.$extension));
				rename(public_path('assets/images/order_main/thumbnail/'.$order_main->image), public_path('assets/images/order_main/thumbnail/'.$name.$extension));

				$order_main->image = $name.$extension;
			} elseif (Input::has('name') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/order_main/original/'.$order_main->image));
				File::delete(public_path('assets/images/order_main/thumbnail/'.$order_main->image));

				$name = strtolower(str_replace(' ', '_', Input::get('name')));
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(512, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/order_main/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(256, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/order_main/thumbnail/'.$name.'.'.$extension), 50);

				$order_main->image = $name.'.'.$extension;
			}
			$order_main->push();

			Session::flash('event.order_main.success', 'OrderMain '.Input::get('name').' updated successfully.');

			return Redirect::route('b_order_main_edit', Input::get('id'));
		}*/
	}

	public function destroy() {
		$om = OrderMain::find(Input::get('id'));
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

		Session::flash('event.order_main.success', 'OrderMain with code '.$om_code.' deleted successfully.');

		return Redirect::route('b_order_main_index');
	}
	
	// ====================== REPORT ORDERED===========================

	public function report()
	{
		return View::make('back.order_main.report.index');
	}

	public function report_details()
	{
		$data['tanggal1'] = Input::get('date_1');
		$data['tanggal2'] = Input::get('date_2');
		// $tanggal1 = Input::get('date_1');
		// $tanggal2 = Input::get('date_2');
		// $tanggal = Input::all();
		$data['order_main_report_details'] = OrderMain::with('buyer', 'buyer_custom')->where('created_at', '>=', Input::get('date_1'))->where('created_at', '<=', 	Input::get('date_2'))->where('status', '=', '3')->get();

		return View::make('back.order_main.report.details', $data);
	}

	public function report_download()
	{
		// $data['tanggal1'] = $date1;
		// $data['tanggal2'] = $date2;
		$data['tanggal1'] = Input::get('date_1');
		$data['tanggal2'] = Input::get('date_2');
		$data['order_main_download_details'] = OrderMain::with('buyer', 'buyer_custom')->where('created_at', '>=', Input::get('date_1'))->where('created_at', '<=', Input::get('date_2'))->where('status', '=', '3')->get();
		return View::make('back.order_main.report.download', $data);
	}


	// ====================== REPORT PRODUCT ===========================
	public function report_product()
	{
		$data['order_main_report_product_details'] = BrandProduct::all();
		return View::make('back.order_main.report_product.index', $data);
	}

	public function report_product_download()
	{
		$data['order_main_report_product_details'] = BrandProduct::all();
		return View::make('back.order_main.report_product.download', $data);
	}

	public function get_order_main_mail() {
		$data = OrderMain::where('status', '=', 1)->get();

		foreach ($data as $datas) {
			$mail = [
				'data' => $datas
			];

			Mail::send('back.order_main.mail', $mail, function($message) {
				$message->from('salesonline@internalgroup.id', 'Sales Department Store');
				//$message->from('nuril@idekreatif.id');
				//$message->to('firegliese@gmail.com');
				$message->to('onlinefinance@internalgroup.id');
				$message->subject('Order Confirmed');
			});
		}
	}

	public function post_order_main_mail($id) {
		if ($id) {
			$order_main = OrderMain::find($id);

			if ($order_main->status == 1) {
				$order_main->status = 2;
				$order_main->push();
			}

			//Session::flash('event.order_main.success', 'Order Status with code: '.$order_main->code.' has been updated.');

			//return Redirect::route('b_order_main_index');
			return 'Success';
		}
	}
}
