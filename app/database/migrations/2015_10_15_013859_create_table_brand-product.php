<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableBrandProduct extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('brand_product', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('brand_size_id')->unsigned();
			$table->string('name');
			$table->integer('stock')->default(0);
			$table->integer('price')->default(0);
			$table->integer('discount')->default(0);
			$table->text('description')->nullable();
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
		Schema::drop('brand_product');
	}

}
