<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnAccessTokenAdmin extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('admin', function(Blueprint $table)
		{
			//
			$table->string('access_token')->nullable()->after('auth_key');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('admin', function(Blueprint $table)
		{
			//
			$table->dropColumn('access_token');
		});
	}

}
