<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableOrderList extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('order_list', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('order_main_code');
			$table->integer('brand_product_id')->unsigned();
			$table->integer('quantity');
			$table->integer('subtotal_price');
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
		Schema::drop('order_list');
	}

}
