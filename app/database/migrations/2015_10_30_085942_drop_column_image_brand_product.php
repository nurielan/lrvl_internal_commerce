<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DropColumnImageBrandProduct extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('brand_product', function(Blueprint $table)
		{
			//
			$table->dropColumn('image');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('brand_product', function(Blueprint $table)
		{
			//
			$table->string('image')->default('empty.png')->after('description');
		});
	}

}
