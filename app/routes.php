<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

# Front
View::share('brand', Brand::all());
View::share('ss', ShippingService::all());

Route::get('get_mail', ['as' => 'b_get_order_main_mail', 'uses' => 'OrderMainController@get_order_main_mail']);
Route::get('post_mail/{id}', ['as' => 'b_post_order_main_mail', 'uses' => 'OrderMainController@post_order_main_mail']);

Route::get('/', function()
{
	//return View::make('hello');
	return Redirect::route('f_home');
	//return View::make('front.buyer.invoice');
});
Route::get('home', ['as' => 'f_home', 'uses' => 'FrontController@home']);

## Front Product
Route::get('product', ['as' => 'f_product', function() {
	return Redirect::route('f_product_index');
}]);
Route::group(['prefix' => 'product'], function() {
	Route::get('index/{brand?}/{brand_size?}', ['as' => 'f_product_index', 'uses' => 'FrontProductController@index']);
	Route::get('detail/{brand_product}/{id}', ['as' => 'f_product_detail', 'uses' => 'FrontProductController@detail']);

	### Front Product Cart
	Route::get('cart', ['as' => 'f_product_cart', function() {
		return Redirect::route('f_product_cart_index');
	}]);
	Route::group(['prefix' => 'cart'], function() {
		Route::get('index', ['as' => 'f_product_cart_index', 'uses' => 'FrontProductCartController@index']);
		Route::post('store', ['as' => 'f_product_cart_store', 'uses' => 'FrontProductCartController@store']);
		Route::post('update', ['as' => 'f_product_cart_update', 'uses' => 'FrontProductCartController@update']);
		Route::get('destroy/{rowid}', ['as' => 'f_product_cart_destroy', 'uses' => 'FrontProductCartController@destroy']);
		
		Route::group(['before' => 'auth_buyer'], function() {
			Route::group(['before' => 'auth_cart'], function() {
				Route::get('buyer',['as' => 'f_product_cart_buyer', 'uses' => 'FrontProductCartController@buyer']);
				Route::post('buyer_process',['as' => 'f_product_cart_buyer_process', 'uses' => 'FrontProductCartController@buyer_process']);
				Route::get('shipping',['as' => 'f_product_cart_shipping', 'uses' => 'FrontProductCartController@shipping']);
				Route::post('shipping_process',['as' => 'f_product_cart_shipping_process', 'uses' => 'FrontProductCartController@shipping_process']);
				Route::get('detail',['as' => 'f_product_cart_detail', 'uses' => 'FrontProductCartController@detail']);
				Route::post('detail_process',['as' => 'f_product_cart_detail_process', 'uses' => 'FrontProductCartController@detail_process']);
				Route::get('data/{no}/{params?}', ['as' => 'f_product_cart_data', 'uses' => 'FrontProductCartController@data']);
			});
		});
	});
});

Route::get('data_point', function() {
	$buyer = Buyer::where('status', '=', 1)->where('point', '>', 0)->orderBy('point', 'desc')->get();

	if (count($buyer) == 0) {
		return 'No data.';
	} else {
		return Response::json($buyer);
	}
});

## Front Customer
Route::get('customer_care', ['as' => 'f_customer_care', 'uses' => 'FrontController@customer_care']);
Route::group(['prefix' => 'customer_care'], function() {
	Route::post('store', ['as' => 'f_customer_care_store', 'uses' => 'FrontController@customer_care_store']);
});

## Front Buyer
Route::get('buyer', ['as' => 'f_buyer', function() {
	return Redirect::route('f_buyer_show');
}]);
Route::group(['prefix' => 'buyer'], function() {
	Route::group(['before' => 'guest_buyer'], function() {
		Route::post('register_process', ['as' => 'f_buyer_store', 'uses' => 'FrontBuyerController@store']);
		Route::get('register_confirm_email/{email_code}', ['as' => 'f_buyer_confirm_email', 'uses' => 'FrontBuyerController@confirm_email']);
		Route::get('login', ['as' => 'f_buyer_login', 'uses' => 'FrontBuyerController@login']);
		Route::post('login_process', ['as' => 'f_buyer_login_process', 'uses' => 'FrontBuyerController@login_process']);
	});

	Route::group(['before' => 'auth_buyer'], function() {
		Route::get('logout_process', ['as' => 'f_buyer_logout', 'uses' => 'FrontBuyerController@logout_process']);
		Route::get('show', ['as' => 'f_buyer_show', 'uses' => 'FrontBuyerController@show']);
		Route::get('edit', ['as' => 'f_buyer_edit', 'uses' => 'FrontBuyerController@edit']);
		Route::post('edit_process', ['as' => 'f_buyer_edit_process', 'uses' => 'FrontBuyerController@update']);
		Route::get('edit_password', ['as' => 'f_buyer_edit_password', 'uses' => 'FrontBuyerController@edit_password']);
		Route::post('edit_password_process', ['as' => 'f_buyer_edit_password_process', 'uses' => 'FrontBuyerController@update_password']);
		Route::get('modal/{order_main_code}', ['as' => 'f_buyer_modal', 'uses' => 'FrontBuyerController@show_modal']);
		Route::get('confirm/{order_main_code}', ['as' => 'f_buyer_confirm', 'uses' => 'FrontBuyerController@show_confirm']);
		Route::post('store_confirm', ['as' => 'f_buyer_store_confirm', 'uses' => 'FrontBuyerController@store_confirm']);
		Route::post('show_invoice', ['as' => 'f_buyer_show_invoice', 'uses' => 'FrontBuyerController@show_invoice']);
	});
});

Route::get('try', function() {
	/*//echo preg_match('/^[a-z0-9]+((\.|-|_){1}[a-z0-9]+)*@[a-z0-9]+([a-z]+)*$/', 'asq-@asd');
	//echo count(Cart::search(['name' => 'Dolorem Qui']));
	echo '<pre>';
	//print_r(Cart::content());
	//echo floor(2910000 / 50000) * 50;
	$carbon = new Carbon();
	//echo $carbon->timestamp(strtotime(OrderMain::find(1)->created_at))->timezone('Asia/Jakarta')->diffInHours();
	if ($carbon->timestamp(strtotime(OrderMain::find(1)->created_at))->timezone('Asia/Jakarta')->diffInDays($carbon->now('Asia/Jakarta')) > 2) {
		echo 'Your time is up.';
	} else {
		echo 'You have some limit chance.';
	}
	echo $carbon->timestamp(strtotime(OrderMain::find(1)->created_at))->timezone('Asia/Jakarta')->addDays(3);
	echo '</pre>';*/

	echo Hash::make('segitiga');
	print_r(OrderConfirm::with(['order_main', 'order_main.buyer'])->where('id', '=', 2)->first()->order_main->buyer->name);
});

# Back
Route::get('back', function() {
	return Redirect::route('b_admin_index');
});
Route::group(['prefix' => 'back'], function() {
	Route::group(['before' => 'guest_admin'], function() {
		Route::get('login', ['as' => 'b_admin_login', 'uses' => 'AdminController@login']);
		Route::post('login_process', ['as' => 'b_admin_login_process', 'uses' => 'AdminController@login_process']);
	});

	Route::group(['before' => 'auth_admin'], function() {
		// Admin
		Route::get('logout', ['as' => 'b_admin_logout', 'uses' => 'AdminController@logout_process']);
		Route::get('admin', function() {
			return Redirect::route('b_admin_index');
		});
		Route::group(['prefix' => 'admin'], function() {
			Route::get('index', ['as' => 'b_admin_index', 'uses' => 'AdminController@index']);
			Route::get('edit', ['as' => 'b_admin_edit', 'uses' => 'AdminController@edit']);
			Route::post('update', ['as' => 'b_admin_update', 'uses' => 'AdminController@update']);
			Route::get('edit_password', ['as' => 'b_admin_edit_password', 'uses' => 'AdminController@edit_password']);
			Route::post('update_password', ['as' => 'b_admin_update_password', 'uses' => 'AdminController@update_password']);
		});
		// End Admin

		// Brand
		Route::group(['prefix' => 'brand'], function() {
			Route::get('index', ['as' => 'b_brand_index', 'uses' => 'BrandController@index']);
			Route::get('create', ['as' => 'b_brand_create', 'uses' => 'BrandController@create']);
			Route::post('store', ['as' => 'b_brand_store', 'uses' => 'BrandController@store']);
			Route::get('edit/{id}', ['as' => 'b_brand_edit', 'uses' => 'BrandController@edit']);
			Route::post('update', ['as' => 'b_brand_update', 'uses' => 'BrandController@update']);
			Route::post('destroy', ['as' => 'b_brand_destroy', 'uses' => 'BrandController@destroy']);
		});
		// End Brand

		// BrandSize
		Route::group(['prefix' => 'brandsize'], function() {
			Route::get('index', ['as' => 'b_brandsize_index', 'uses' => 'BrandSizeController@index']);
			Route::get('show/{brand_id}', ['as' => 'b_brandsize_show', 'uses' => 'BrandSizeController@show']);
			Route::get('create', ['as' => 'b_brandsize_create', 'uses' => 'BrandSizeController@create']);
			Route::post('store', ['as' => 'b_brandsize_store', 'uses' => 'BrandSizeController@store']);
			Route::get('edit/{id}', ['as' => 'b_brandsize_edit', 'uses' => 'BrandSizeController@edit']);
			Route::post('update', ['as' => 'b_brandsize_update', 'uses' => 'BrandSizeController@update']);
			Route::post('destroy', ['as' => 'b_brandsize_destroy', 'uses' => 'BrandSizeController@destroy']);
		});
		// End BrandSize

		// BrandSizeImage
		Route::group(['prefix' => 'brandsizeimage'], function() {
			Route::get('index/{brand_size_id}', ['as' => 'b_brandsizeimage_index', 'uses' => 'BrandSizeImageController@index']);
			Route::get('create', ['as' => 'b_brandsizeimage_create', 'uses' => 'BrandSizeImageController@create']);
			Route::post('store', ['as' => 'b_brandsizeimage_store', 'uses' => 'BrandSizeImageController@store']);
			Route::get('edit/{id}', ['as' => 'b_brandsizeimage_edit', 'uses' => 'BrandSizeImageController@edit']);
			Route::post('update', ['as' => 'b_brandsizeimage_update', 'uses' => 'BrandSizeImageController@update']);
			Route::post('destroy', ['as' => 'b_brandsizeimage_destroy', 'uses' => 'BrandSizeImageController@destroy']);
		});
		// End BrandSizeImage

		// BrandProduct
		Route::group(['prefix' => 'brandproduct'], function() {
			Route::get('index/{brand_size_id}', ['as' => 'b_brandproduct_index', 'uses' => 'BrandProductController@index']);
			Route::get('create', ['as' => 'b_brandproduct_create', 'uses' => 'BrandProductController@create']);
			Route::post('store', ['as' => 'b_brandproduct_store', 'uses' => 'BrandProductController@store']);
			Route::get('edit/{id}', ['as' => 'b_brandproduct_edit', 'uses' => 'BrandProductController@edit']);
			Route::post('update', ['as' => 'b_brandproduct_update', 'uses' => 'BrandProductController@update']);
			Route::post('destroy', ['as' => 'b_brandproduct_destroy', 'uses' => 'BrandProductController@destroy']);
		});
		// End BrandProduct

		// BrandProductImage
		Route::group(['prefix' => 'brandproductimage'], function() {
			Route::get('index/{brand_product_id}', ['as' => 'b_brandproductimage_index', 'uses' => 'BrandProductImageController@index']);
			Route::get('create', ['as' => 'b_brandproductimage_create', 'uses' => 'BrandProductImageController@create']);
			Route::post('store', ['as' => 'b_brandproductimage_store', 'uses' => 'BrandProductImageController@store']);
			Route::get('edit/{id}', ['as' => 'b_brandproductimage_edit', 'uses' => 'BrandProductImageController@edit']);
			Route::post('update', ['as' => 'b_brandproductimage_update', 'uses' => 'BrandProductImageController@update']);
			Route::post('destroy', ['as' => 'b_brandproductimage_destroy', 'uses' => 'BrandProductImageController@destroy']);
		});
		// End BrandProductImage

		// Buyer
		Route::group(['prefix' => 'buyer'], function() {
			Route::get('index', ['as' => 'b_buyer_index', 'uses' => 'BuyerController@index']);
			Route::get('create', ['as' => 'b_buyer_create', 'uses' => 'BuyerController@create']);
			Route::post('store', ['as' => 'b_buyer_store', 'uses' => 'BuyerController@store']);
			Route::get('edit/{id}', ['as' => 'b_buyer_edit', 'uses' => 'BuyerController@edit']);
			Route::post('update', ['as' => 'b_buyer_update', 'uses' => 'BuyerController@update']);
			Route::post('destroy', ['as' => 'b_buyer_destroy', 'uses' => 'BuyerController@destroy']);
		});
		// End Buyer

		// BuyerCustom
		Route::group(['prefix' => 'buyercustom'], function() {
			Route::get('index', ['as' => 'b_buyercustom_index', 'uses' => 'BuyerCustomController@index']);
			Route::get('create', ['as' => 'b_buyercustom_create', 'uses' => 'BuyerCustomController@create']);
			Route::post('store', ['as' => 'b_buyercustom_store', 'uses' => 'BuyerCustomController@store']);
			Route::get('edit/{id}', ['as' => 'b_buyercustom_edit', 'uses' => 'BuyerCustomController@edit']);
			Route::post('update', ['as' => 'b_buyercustom_update', 'uses' => 'BuyerCustomController@update']);
			Route::post('destroy', ['as' => 'b_buyercustom_destroy', 'uses' => 'BuyerCustomController@destroy']);
		});
		// End BuyerCustom

		// BuyerVoucher
		Route::group(['prefix' => 'buyervoucher'], function() {
			Route::get('index', ['as' => 'b_buyervoucher_index', 'uses' => 'BuyerVoucherController@index']);
			Route::get('create', ['as' => 'b_buyervoucher_create', 'uses' => 'BuyerVoucherController@create']);
			Route::post('store', ['as' => 'b_buyervoucher_store', 'uses' => 'BuyerVoucherController@store']);
			Route::get('edit/{id}', ['as' => 'b_buyervoucher_edit', 'uses' => 'BuyerVoucherController@edit']);
			Route::post('update', ['as' => 'b_buyervoucher_update', 'uses' => 'BuyerVoucherController@update']);
			Route::post('destroy', ['as' => 'b_buyervoucher_destroy', 'uses' => 'BuyerVoucherController@destroy']);
		});
		// End BuyerVoucher

		// OrderConfirm
		Route::group(['prefix' => 'order_confirm'], function() {
			Route::get('index', ['as' => 'b_order_confirm_index', 'uses' => 'OrderConfirmController@index']);
			Route::get('create', ['as' => 'b_order_confirm_create', 'uses' => 'OrderConfirmController@create']);
			Route::post('store', ['as' => 'b_order_confirm_store', 'uses' => 'OrderConfirmController@store']);
			Route::get('edit/{id}', ['as' => 'b_order_confirm_edit', 'uses' => 'OrderConfirmController@edit']);
			Route::post('update', ['as' => 'b_order_confirm_update', 'uses' => 'OrderConfirmController@update']);
			Route::post('destroy', ['as' => 'b_order_confirm_destroy', 'uses' => 'OrderConfirmController@destroy']);
		});
		// End OrderConfirm

		// OrderList
		Route::group(['prefix' => 'order_list'], function() {
			Route::get('index', ['as' => 'b_order_list_index', 'uses' => 'OrderListController@index']);
			Route::get('create', ['as' => 'b_order_list_create', 'uses' => 'OrderListController@create']);
			Route::post('store', ['as' => 'b_order_list_store', 'uses' => 'OrderListController@store']);
			Route::get('edit/{id}', ['as' => 'b_order_list_edit', 'uses' => 'OrderListController@edit']);
			Route::post('update', ['as' => 'b_order_list_update', 'uses' => 'OrderListController@update']);
			Route::post('destroy', ['as' => 'b_order_list_destroy', 'uses' => 'OrderListController@destroy']);
		});
		// End OrderList

		// OrderMain
		Route::group(['prefix' => 'order_main'], function() {
			Route::get('index', ['as' => 'b_order_main_index', 'uses' => 'OrderMainController@index']);
			Route::get('show/{code}', ['as' => 'b_order_main_show', 'uses' => 'OrderMainController@show']);
			Route::get('create', ['as' => 'b_order_main_create', 'uses' => 'OrderMainController@create']);
			Route::post('store', ['as' => 'b_order_main_store', 'uses' => 'OrderMainController@store']);
			Route::get('edit/{id}', ['as' => 'b_order_main_edit', 'uses' => 'OrderMainController@edit']);
			Route::post('update', ['as' => 'b_order_main_update', 'uses' => 'OrderMainController@update']);
			Route::post('destroy', ['as' => 'b_order_main_destroy', 'uses' => 'OrderMainController@destroy']);
			
						
			// =================== Part as Report ================
			// =================== Report Ordered ================
			Route::get('report', ['as' => 'b_order_main_report', 'uses' => 'OrderMainController@report']);
			Route::post('report', ['as' => 'b_order_main_report_details', 'uses' => 'OrderMainController@report_details']);
			Route::post('report/download/', ['as' => 'b_order_main_download_details', 'uses' => 'OrderMainController@report_download']);

			// =================== Report Product ================
			Route::get('report/product', ['as' => 'b_order_main_report_product', 'uses' => 'OrderMainController@report_product']);
			Route::get('report/product/download', ['as' => 'b_order_main_report_product_download', 'uses' => 'OrderMainController@report_product_download']);
		});
		// End OrderMain

		// OrderShipping
		Route::group(['prefix' => 'order_shipping'], function() {
			Route::get('index', ['as' => 'b_order_shipping_index', 'uses' => 'OrderShippingController@index']);
			Route::get('create', ['as' => 'b_order_shipping_create', 'uses' => 'OrderShippingController@create']);
			Route::post('store', ['as' => 'b_order_shipping_store', 'uses' => 'OrderShippingController@store']);
			Route::get('edit/{id}', ['as' => 'b_order_shipping_edit', 'uses' => 'OrderShippingController@edit']);
			Route::post('update', ['as' => 'b_order_shipping_update', 'uses' => 'OrderShippingController@update']);
			Route::post('destroy', ['as' => 'b_order_shipping_destroy', 'uses' => 'OrderShippingController@destroy']);
		});
		// End OrderShipping

		// Point
		Route::group(['prefix' => 'point'], function() {
			Route::get('index', ['as' => 'b_point_index', 'uses' => 'PointController@index']);
			//Route::get('create', ['as' => 'b_point_create', 'uses' => 'PointController@create']);
			//Route::post('store', ['as' => 'b_point_store', 'uses' => 'PointController@store']);
			Route::get('edit/{id?}', ['as' => 'b_point_edit', 'uses' => 'PointController@edit']);
			Route::post('update', ['as' => 'b_point_update', 'uses' => 'PointController@update']);
			//Route::post('destroy', ['as' => 'b_point_destroy', 'uses' => 'PointController@destroy']);
		});
		// End Point

		// HomeImage
		Route::group(['prefix' => 'home_image'], function() {
			Route::get('index', ['as' => 'b_home_image_index', 'uses' => 'HomeImageController@index']);
			Route::get('create', ['as' => 'b_home_image_create', 'uses' => 'HomeImageController@create']);
			Route::post('store', ['as' => 'b_home_image_store', 'uses' => 'HomeImageController@store']);
			Route::get('edit/{id}', ['as' => 'b_home_image_edit', 'uses' => 'HomeImageController@edit']);
			Route::post('update', ['as' => 'b_home_image_update', 'uses' => 'HomeImageController@update']);
			Route::post('destroy', ['as' => 'b_home_image_destroy', 'uses' => 'HomeImageController@destroy']);
		});
		// End HomeImage

		// Bank
		Route::group(['prefix' => 'bank'], function() {
			Route::get('index', ['as' => 'b_bank_index', 'uses' => 'BankController@index']);
			Route::get('create', ['as' => 'b_bank_create', 'uses' => 'BankController@create']);
			Route::post('store', ['as' => 'b_bank_store', 'uses' => 'BankController@store']);
			Route::get('edit/{id}', ['as' => 'b_bank_edit', 'uses' => 'BankController@edit']);
			Route::post('update', ['as' => 'b_bank_update', 'uses' => 'BankController@update']);
			Route::post('destroy', ['as' => 'b_bank_destroy', 'uses' => 'BankController@destroy']);
		});
		// End Bank

		// ShippingService
		Route::group(['prefix' => 'shipping_service'], function() {
			Route::get('index', ['as' => 'b_shipping_service_index', 'uses' => 'ShippingServiceController@index']);
			Route::get('create', ['as' => 'b_shipping_service_create', 'uses' => 'ShippingServiceController@create']);
			Route::post('store', ['as' => 'b_shipping_service_store', 'uses' => 'ShippingServiceController@store']);
			Route::get('edit/{id}', ['as' => 'b_shipping_service_edit', 'uses' => 'ShippingServiceController@edit']);
			Route::post('update', ['as' => 'b_shipping_service_update', 'uses' => 'ShippingServiceController@update']);
			Route::post('destroy', ['as' => 'b_shipping_service_destroy', 'uses' => 'ShippingServiceController@destroy']);
		});
		// End ShippingService
	});
});
