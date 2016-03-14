<?php

class Brand extends Eloquent {

	protected $table = 'brand';

	public function brand_size() {
		return $this->hasMany('BrandSize', 'brand_id', 'id');
	}
}