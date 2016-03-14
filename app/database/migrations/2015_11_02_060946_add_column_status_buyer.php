<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnStatusBuyer extends Migration {

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
			$table->tinyInteger('status')->after('email_code');
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
			$table->dropColumn('status');
		});
	}

}
