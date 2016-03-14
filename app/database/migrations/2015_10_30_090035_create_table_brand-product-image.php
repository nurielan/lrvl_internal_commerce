<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableBrandProductImage extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('brand_product_image', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('brand_product_id')->unsigned();
			$table->string('title')->nullable();
			$table->text('content')->nullable();
			$table->string('image');
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
		Schema::drop('brand_product_image');
	}

}
