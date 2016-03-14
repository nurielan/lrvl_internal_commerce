<?php

class AdminTableSeeder extends Seeder {

	public function run() {
		Eloquent::unguard();

		DB::table('admin')->delete();

		Admin::create([
			'username' => 'adminstore',
			'email' => 'store@internal.com',
			'password' => Hash::make('kotaksegitiga'),
			'role' => 1
		]);

		Admin::create([
			'username' => 'adminfinance',
			'email' => 'finance@internal.com',
			'password' => Hash::make('segitigakotak'),
			'role' => 2
		]);
	}
}