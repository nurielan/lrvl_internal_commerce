<?php

class OrderShipping extends Eloquent {

	protected $table = 'order_shipping';
	protected $primaryKey = 'code';

	public function order_main() {
		return $this->belongsTo('OrderMain', 'order_main_code', 'code');
	}
}