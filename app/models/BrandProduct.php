<?php

class BrandProduct extends Eloquent {

	protected $table = 'brand_product';

	public function order_list() {
		return $this->hasMany('OrderList');
	}

	public function brand_size() {
		return $this->belongsTo('BrandSize', 'brand_size_id', 'id');
	}

	public function brand_product_image() {
		return $this->hasMany('BrandProductImage', 'brand_product_id', 'id');
	}
}