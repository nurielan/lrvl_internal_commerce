<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeColumnIdBuyerCustom extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('buyer_custom', function(Blueprint $table)
		{
			//
			//$table->dropColumn('id');
			DB::statement('ALTER TABLE buyer_custom DROP id');
			//$table->string('code')->first();
			DB::statement('ALTER TABLE buyer_custom ADD code VARCHAR(255) PRIMARY KEY FIRST');
			//$table->primary('code');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('buyer_custom', function(Blueprint $table)
		{
			//
			//$table->dropColumn('code');
			DB::statement('ALTER TABLE buyer_custom DROP code');
			DB::statement('ALTER TABLE buyer_custom ADD id INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT FIRST');
		});
	}

}
