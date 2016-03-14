<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnWeightBrandProduct extends Migration {

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
			$table->integer('weight')->default(0)->after('price');
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
			$table->dropColumn('weight');
		});
	}

}
