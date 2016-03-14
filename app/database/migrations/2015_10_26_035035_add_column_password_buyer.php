<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnPasswordBuyer extends Migration {

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
			$table->string('password')->after('point');
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
			$table->dropColumn('password');
		});
	}

}
