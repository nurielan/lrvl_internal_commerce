<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableOrderShipping extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('order_shipping', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('order_main_code')->unique();
			$table->string('origin');
			$table->string('destination');
			$table->string('service');
			$table->string('service_package');
			$table->integer('weight');
			$table->integer('cost');
			$table->integer('estimation');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('order_shipping');
	}

}
