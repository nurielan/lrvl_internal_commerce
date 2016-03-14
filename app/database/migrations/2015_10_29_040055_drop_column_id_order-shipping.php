<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DropColumnIdOrderShipping extends Migration {

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
			$table->dropColumn('id');
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
			DB::statement('ALTER TABLE order_shipping ADD id INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');
		});
	}

}
