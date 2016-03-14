<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnOrderShippingIdOrderMain extends Migration {

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
			$table->string('order_shipping_code')->nullable()->after('buyer_custom_code');
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
			$table->dropColumn('order_shipping_code');
		});
	}

}
