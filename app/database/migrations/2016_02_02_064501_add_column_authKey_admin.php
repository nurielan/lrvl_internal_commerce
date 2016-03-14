<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnAuthKeyAdmin extends Migration {

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
			$table->string('auth_key')->nullable()->after('role');
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
			$table->dropColumn('auth_key');
		});
	}

}
