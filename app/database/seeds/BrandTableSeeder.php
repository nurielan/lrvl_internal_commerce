<?php

class BrandTableSeeder extends Seeder {

	public function run() {
		Eloquent::unguard();

		$faker = Faker\Factory::create();

		DB::table('brand')->delete();

		Brand::create([
			'name' => 'Internal',
			'description' => $faker->text,
			'image' => 'internal.png'
		]);

		Brand::create([
			'name' => 'Lady Rose',
			'description' => $faker->text,
			'image' => 'lady_rose.png'
		]);

		Brand::create([
			'name' => 'Vallery',
			'description' => $faker->text,
			'image' => 'vallery.png'
		]);
	}
}