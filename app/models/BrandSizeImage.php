<?php

class BrandSizeImage extends Eloquent {

	protected $table = 'brand_size_image';

	public function brand_size() {
		return $this->belongTo('BrandSize', 'brand_size_id', 'id');
	}
}