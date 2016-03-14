<?php

class BuyerVoucher extends Eloquent {

	protected $table = 'buyer_voucher';

	public function order_main() {
		return $this->hasOne('OrderMain', 'buyer_voucher_id', 'id');
	}

	public function buyer() {
		return $this->belongsTo('Buyer', 'buyer_id', 'id');
	}
}