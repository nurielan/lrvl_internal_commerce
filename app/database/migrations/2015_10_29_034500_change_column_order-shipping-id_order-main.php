<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeColumnOrderShippingIdOrderMain extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('order_main', function(Blueprint $table)
		{
			//
			$table->dropColumn('order_shipping_id');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('order_main', function(Blueprint $table)
		{
			//
			$table->integer('order_shipping_id')->unsigned()->after('buyer_custom_code');
		});
	}

}
