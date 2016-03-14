<?php

class OrderList extends Eloquent {

	protected $table = 'order_list';

	public function brand_product() {
		return $this->belongsTo('BrandProduct', 'brand_product_id', 'id');
	}

	public function order_main() {
		return $this->belongsTo('OrderMain', 'order_main_code', 'code');
	}
}