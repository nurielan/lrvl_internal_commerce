<?php

class BuyerTableSeeder extends Seeder {

	public function run() {
		$faker = Faker\Factory::create();

		Eloquent::unguard();

		Buyer::create([
			'name' => 'Abraham Lincoln',
			'address' => 'Bandung',
			'phone_number' => '022123456789',
			'email' => 'abraham.lincoln@usa.com',
			'message' => 'To do list: Nothing.',
			'password' => Hash::make('abrahamlincoln')
		]);

		for ($i = 1; $i <= 5; $i++) {
			$firstName = $faker->firstName;
			$lastName = $faker->lastName;
			$name = $firstName.' '.$lastName;

			Buyer::create([
				'name' => $name,
				'address' => $faker->address,
				'phone_number' => $faker->unique()->regexify('/^(\+628|02|08){1}[1-9]{7,10}$/'),
				'email' => strtolower(str_replace(' ', '.', $name)).$faker->regexify('/^@[a-z]{4,5}(\.[a-z]{2,3}){1}$/'),
				'message' => $faker->sentence(10),
				'password' => Hash::make(strtolower($firstName.$lastName))
			]);
		}
	}
}