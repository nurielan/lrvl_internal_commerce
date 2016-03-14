<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableBank extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bank', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('name');
			$table->string('account_number');
			$table->string('account_name');
			$table->string('branch');
			$table->string('image')->default('empty.png');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('bank');
	}

}
