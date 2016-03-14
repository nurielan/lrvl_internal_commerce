<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableBuyerVoucher extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('buyer_voucher', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('buyer_id')->unsigned();
			$table->string('code')->unique();
			$table->integer('validity');
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
		Schema::drop('buyer_voucher');
	}

}
