<?php

class PointTableSeeder extends Seeder {

	public function run() {
		Eloquent::unguard();

		DB::table('point')->truncate();

		Point::create([
			'price' => 50000,
			'price_back' => 5000
		]);
	}
}