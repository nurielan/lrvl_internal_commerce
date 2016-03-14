<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnEmailCodeBuyer extends Migration {

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
			$table->string('email_code')->after('password');
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
			$table->dropColumn('email_code');
		});
	}

}
