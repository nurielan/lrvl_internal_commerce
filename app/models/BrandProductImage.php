<?php

class BrandProductImage extends Eloquent {

	protected $table = 'brand_product_image';

	public function brand_product() {
		return $this->belongTo('BrandProduct', 'brand_product_id', 'id');
	}
}