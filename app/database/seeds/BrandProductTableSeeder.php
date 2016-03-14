<?php

class BrandProductTableSeeder extends Seeder {

	public function run() {
		$faker = Faker\Factory::create();

		Eloquent::unguard();

		for ($i = 1; $i <= 10; $i++) {
			BrandProduct::create([
				'brand_size_id' => 1,
				'name' => ucwords(implode(' ', $faker->words(2))),
				'stock' => $faker->randomDigit,
				'price' => implode('', [$faker->unique()->numberBetween(10, 99), '0000']),
				'weight' => 500,
				'discount' => 5,
				'description' => $faker->unique()->text
			]);

			BrandProduct::create([
				'brand_size_id' => 2,
				'name' => ucwords(implode(' ', $faker->words(2))),
				'stock' => $faker->randomDigit,
				'price' => implode('', [$faker->unique()->numberBetween(5, 59), '0000']),
				'weight' => 700,
				'discount' => 0,
				'description' => $faker->unique()->text
			]);

			BrandProduct::create([
				'brand_size_id' => 3,
				'name' => ucwords(implode(' ', $faker->words(2))),
				'stock' => $faker->randomDigit,
				'price' => implode('', [$faker->unique()->numberBetween(30, 399), '0000']),
				'weight' => 900,
				'discount' => 10,
				'description' => $faker->unique()->text
			]);

			BrandProduct::create([
				'brand_size_id' => 4,
				'name' => ucwords(implode(' ', $faker->words(2))),
				'stock' => $faker->randomDigit,
				'price' => implode('', [$faker->unique()->numberBetween(40, 89), '0000']),
				'weight' => 1100,
				'discount' => 0,
				'description' => $faker->unique()->text
			]);
		}
	}
}