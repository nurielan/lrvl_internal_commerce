<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeColumnBuyerCustomIdOrderMain extends Migration {

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
			$table->dropColumn('buyer_custom_id');
			$table->string('buyer_custom_code')->nullable()->after('buyer_id');
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
			$table->dropColumn('buyer_custom_code');
			$table->integer('buyer_custom_id')->unsigned()->after('buyer_id');
		});
	}

}
