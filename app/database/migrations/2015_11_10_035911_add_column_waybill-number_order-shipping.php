<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnWaybillNumberOrderShipping extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('order_shipping', function(Blueprint $table)
		{
			//
			$table->string('waybill_number')->nullable()->after('estimation');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('order_shipping', function(Blueprint $table)
		{
			//
			$table->droColumn('waybill_number');
		});
	}

}
