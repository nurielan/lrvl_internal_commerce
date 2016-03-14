<?php

class BuyerCustom extends Eloquent {

	protected $table = 'buyer_custom';

	public function order_main() {
		return $this->hasMany('OrderMain', 'buyer_custom_code', 'code');
	}
}