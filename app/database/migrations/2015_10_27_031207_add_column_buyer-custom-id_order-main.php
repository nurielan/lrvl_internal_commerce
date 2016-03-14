<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnBuyerCustomIdOrderMain extends Migration {

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
			$table->integer('buyer_custom_id')->unsigned()->nullable()->after('buyer_id');
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
			$table->dropColumn('buyer_custom_id');
		});
	}

}
