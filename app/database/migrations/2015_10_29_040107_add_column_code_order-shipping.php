<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnCodeOrderShipping extends Migration {

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
			DB::statement('ALTER TABLE order_shipping ADD code VARCHAR(255) PRIMARY KEY FIRST');
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
			$table->dropColumn('code');
		});
	}

}
