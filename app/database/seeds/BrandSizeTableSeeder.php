<?php

class BrandSizeTableSeeder extends Seeder {

	public function run() {
		$faker = Faker\Factory::create();

		Eloquent::unguard();

		DB::table('brand_size')->delete();

		BrandSize::create([
			'brand_id' => 1,
			'name' => 'Single',
			'description' => $faker->text
		]);

		BrandSize::create([
			'brand_id' => 1,
			'name' => 'Queen',
			'description' => $faker->text
		]);

		BrandSize::create([
			'brand_id' => 1,
			'name' => 'King',
			'description' => $faker->text
		]);

		BrandSize::create([
			'brand_id' => 1,
			'name' => 'Extra King',
			'description' => $faker->text
		]);
	}
}