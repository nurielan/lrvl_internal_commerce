<?php

class BrandSize extends Eloquent {

	protected $table = 'brand_size';

	public function brand_product() {
		return $this->hasMany('BrandProduct', 'brand_size_id', 'id');
	}

	public function brand() {
		return $this->belongsTo('Brand', 'brand_id', 'id');
	}

	public function brand_size_image() {
		return $this->hasMany('BrandSizeImage', 'brand_size_id', 'id');
	}
}