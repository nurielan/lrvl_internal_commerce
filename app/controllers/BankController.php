<?php

class BankController extends BaseController {

	public function index() {
		$data['bank'] = Bank::all();

		return View::make('back.bank.index', $data);
	}

	public function create() {
		return View::make('back.bank.create');
	}

	public function store() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required|unique:bank,name',
			'account_number' => 'required|unique:bank,account_number|numeric',
			'account_name' => 'required',
			'branch' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.bank.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$bank = new Bank;
			$bank->name = Input::get('name');
			$bank->account_number = Input::get('account_number');
			$bank->account_name = Input::get('account_name');
			$bank->branch = Input::get('branch');
			
			if (Input::hasFile('image')) {
				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(600, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/bank/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/bank/thumbnail/'.$name.'.'.$extension), 40);

				$bank->image = $name.'.'.$extension;
			}

			$bank->push();

			Session::flash('event.bank.success', 'New Bank saved successfully.');

			return Redirect::route('b_bank_index');
		}
	}

	public function edit($id) {
		$data['bank'] = Bank::find($id);

		return View::make('back.bank.edit', $data);
	}

	public function update() {
		$validator = Validator::make(Input::all(), [
			'name' => 'required',
			'account_number' => 'required|numeric',
			'account_name' => 'required',
			'branch' => 'required',
			'image' => 'image'
		]);

		if ($validator->fails()) {
			return Redirect::back()->with('event.bank.error', $validator->messages()->all())->withInput(Input::all());
		} else {
			$bank = Bank::find(Input::get('id'));
			$bank->name = Input::get('name');
			$bank->account_number = Input::get('account_number');
			$bank->account_name = Input::get('account_name');
			$bank->branch = Input::get('branch');
			
			if (Input::has('name') && Input::hasFile('image')) {
				File::delete(public_path('assets/images/bank/original/'.$bank->image));
				File::delete(public_path('assets/images/bank/thumbnail/'.$bank->image));

				$name = Carbon::now('Asia/Jakarta')->timestamp;
				$extension = Input::file('image')->getClientOriginalExtension();

				Image::make(Input::file('image'))->resize(600, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/bank/original/'.$name.'.'.$extension), 60);

				Image::make(Input::file('image'))->resize(320, null, function($constraint) {
					$constraint->aspectRatio();
					$constraint->upsize();
				})->save(public_path('assets/images/bank/thumbnail/'.$name.'.'.$extension), 40);

				$bank->image = $name.'.'.$extension;
			}
			
			$bank->push();

			Session::flash('event.bank.success', 'Bank '.Input::get('name').' updated successfully.');

			return Redirect::route('b_bank_index');
		}
	}

	public function destroy() {
		$bank = Bank::find(Input::get('id'));
		$name = $bank->name;
		if ($bank->image) {
			File::delete(public_path('assets/images/bank/original/'.$bank->image));
			File::delete(public_path('assets/images/bank/thumbnail/'.$bank->image));
		}
		$bank->delete();

		DB::statement('ALTER TABLE bank DROP id');
		DB::statement('ALTER TABLE bank ADD id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');

		Session::flash('event.bank.success', 'Bank '.$name.' deleted successfully.');

		return Redirect::route('b_bank_index');
	}
}