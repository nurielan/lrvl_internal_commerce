<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnRememberTokenBuyer extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('buyer', function(Blueprint $table)
		{
			//
			$table->rememberToken()->after('point');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('buyer', function(Blueprint $table)
		{
			//
			$table->dropColumn('remember_token');
		});
	}

}
