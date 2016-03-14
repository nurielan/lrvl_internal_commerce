<?php

class OrderConfirm extends Eloquent {

	protected $table = 'order_confirm';

	public function order_main() {
		return $this->belongsTo('OrderMain', 'order_main_code', 'code');
	}
}