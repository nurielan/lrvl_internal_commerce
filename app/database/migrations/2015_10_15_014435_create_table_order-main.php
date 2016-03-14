<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableOrderMain extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('order_main', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('code')->unique();
			$table->integer('buyer_id')->unsigned();
			$table->integer('order_shipping_id')->unsigned()->unique();
			$table->integer('buyer_voucher_id')->unsigned()->unique()->nullable();
			$table->integer('total_price');
			$table->tinyInteger('status');
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
		Schema::drop('order_main');
	}

}
