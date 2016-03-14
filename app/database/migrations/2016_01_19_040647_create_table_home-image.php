<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableHomeImage extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('home_image', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('title');
			$table->string('name');
			$table->text('content');
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
		Schema::drop('home_image');
	}

}
