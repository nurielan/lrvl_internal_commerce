<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableOrderConfirm extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('order_confirm', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('order_main_code')->unique();
			$table->string('via');
			$table->integer('amount');
			$table->string('bank');
			$table->string('account_number');
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
		Schema::drop('order_confirm');
	}

}
