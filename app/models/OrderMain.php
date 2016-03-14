<?php

class OrderMain extends Eloquent {

	protected $table = 'order_main';

	public function order_list() {
		return $this->hasMany('OrderList', 'order_main_code', 'code');
	}

	public function order_confirm() {
		return $this->hasOne('OrderConfirm', 'order_main_code', 'code');
	}

	public function order_shipping() {
		return $this->hasOne('OrderShipping', 'order_main_code', 'code');
	}

	public function buyer() {
		return $this->belongsTo('Buyer', 'buyer_id', 'id');
	}

	public function buyer_custom() {
		return $this->belongsTo('BuyerCustom', 'buyer_custom_code', 'code');
	}

	public function buyer_voucher() {
		return $this->belongsTo('BuyerVoucher', 'buyer_voucher_id', 'id');
	}
}