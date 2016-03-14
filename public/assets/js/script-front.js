//<![CDATA[
var main = function() {
	//uri = 'http://localhost/lrvl_internal_commerce/public/';
	uri = 'http://store.internalgroup.id/';

	// Spend Point
	pb = $('input[name="price_back"]');
	spn = $('#spend_point_number');
	sp = $('input[name="spend_point"]');
	spv = $('input[name="spend_point_value"]');
	sp.val(spn.text());
	spv.val(pb.val() * sp.val());
	sp.keyup(function() {
		if ($(this).val() > Number(spn.text())) {
			alert('Input between 0 - '+spn.text());
			$(this).val(spn.text());
		} else {
			spv.val(pb.val() * sp.val());
		}
	});

	// Get mail
    get_mail = setInterval(function() {
    	$.get(uri+'get_mail');
    }, 600000);

	$('img.lazy').show().lazyload({
		threshold : 2000,
		effect : "fadeIn",
		failure_limit : 10,
		skip_invisible : true
	});

	// tinymce.init({
	//     selector: "textarea",
	//     plugins: [
	//         "advlist autolink lists link charmap print preview anchor",
	//         "searchreplace visualblocks code fullscreen",
	//         "insertdatetime table contextmenu paste"
	//     ],
	//     toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link"
	// });

	input = [];

	$('input[type="text"]').each(function() {
		input.push($(this).val());
	});

	$('input[name="account"]').click(function() {
		if ($(this).is(':checked')) {
			$('input[type="text"]').val('').removeAttr('readonly');
			$('textarea[name="message"]').val('').removeAttr('readonly');
		} else {
			$('input[name="name"]').val(input[0]).attr('readonly', true);
			$('input[name="email"]').val(input[1]).attr('readonly', true);
			$('input[name="phone_number"]').val(input[2]).attr('readonly', true);
			$('input[name="address"]').val(input[3]).attr('readonly', true);
			$('textarea[name="message"]').val(input[4]).attr('readonly', true);
		}
	});

	$('input[name="destination"]').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: uri+'product/cart/data/1',
				dataType: 'json',
				success: function(data) {
					var re = $.ui.autocomplete.escapeRegex(request.term);
					var matcher = new RegExp('^'+re, 'i');

					response($.grep(data, function(item) {
						return matcher.test(item.value);
					}));
				}
			});
		},
		delay: 0,
		select: function(event, ui) {
			$('input[name="destination_id"]').val(ui.item.id);
		}
	});

	var t = $('.datatable').DataTable( {
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
        "order": [[ 1, 'desc' ]]
    } );
 
    t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();

    $('.buyer_detail').click(function() {
    	$('#buyer_modal').modal({
    		show: true,
    		backdrop: 'static'
    	});

    	$.ajax({
    		url: uri+'buyer/modal/'+$(this).data('ordermaincode'),
    		type: 'get',
    		beforeSend: function() {
    			$('#buyer_modal_content').empty();
    			$('#buyer_modal_content').html('<span class="fa fa-spin fa-spinner"></span>');
    		},
    		success: function(data) {
    			$('#buyer_modal_content').empty();
    			$('#buyer_modal_content').html(data);
    		},
    		error: function(xhr) {
    			$('#buyer_modal_content').empty();
    			$('#buyer_modal_content').html(xhr.status+' '+xhr.statusText);
    		}
    	});

    	return false;
    });

	// Owl carousel
	var sync1 = $('#sync1');
	var sync2 = $('#sync2');

	$('.one-carousel').owlCarousel
	({
		singleItem: true,
		// pagination: true,
		slideSpeed: 300,
		pagination: true,
		autoPlay: true,
		transitionStyle : "fadeUp"
	});

	$('.small-carousel').owlCarousel
	({
		items: 5,
		singleItem: true,
		autoPlay: 2000,
		pagination: false
	});

	sync1.owlCarousel
	({
		singleItem: true,
		pagination:false,
		slideSpeed: 1000,
		reponsiveRefreshRate: 200,
		transitionStyle : "fadeUp",
		afterAction: syncPosition
	});

	sync2.owlCarousel
	({
		items: 4,
		reponsiveRefreshRate: 100,
		pagination:false,
		transitionStyle : "fadeUp",
		responsive:false,
		navigation: true,
		afterInit : function(el)
		{
			el.find('.owl-item').eq(0).addClass('synced');
		}
	});

	function syncPosition(el)
	{
		var current = this.currentItem;
		$('#sync2')
		.find(".owl-item")
		.removeClass("synced")
		.eq(current)
		.addClass("synced")
		if ($("#sync2").data("owlCarousel") !== undefined)
		{
			center(current);
		};
	}

	$("#sync2").on("click", ".owl-item", function(e){
		e.preventDefault();
		var number = $(this).data("owlItem");
		sync1.trigger("owl.goTo", number);
	});

	function center(number){
		var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
		var num = number;
		var found = false;
		for (var i in sync2visible) 
		{
			if (num === sync2visible[i])
			{
				var found = true;
			};
		};

		if (found === false)
		{
			if (num > sync2visible[sync2visible.length-1])
			{
				sync2.trigger("owl.goTo", num - sync2visible.length+2)
			}
			else
			{
				if (num - 1 === -1)
				{
					num = 0;
				};
				sync2.trigger("owl.goTo", num);
			}
		}
		else if (num === sync2visible[sync2visible.length-1])
		{
			sync2.trigger("owl.goTo", sync2visible[1]);
		}
		else if (num === sync2visible[0])
		{
			sync2.trigger("owl.goTo", num-1);
		};
	}

	// ========================Slider==========================
	var slider = document.getElementById('slider');
	var dariinput = document.getElementById('harga-dari');
	var dari = document.getElementById('dari');
	var sampaiinput = document.getElementById('harga-hingga');
	var hingga = document.getElementById('hingga');

	noUiSlider.create(slider, {
		start: [50000, 1000000],
		step: 10000,
		connect: true,
		range: {
			'min' : 50000,
			'max' : 1000000
		}
		// format: {
		//   to: function ( value ) { return value + ''; },
		//   from: function ( value ) { return value.replace('', ''); }
		// }
	});

	slider.noUiSlider.on('update', function (values, handle){
		if (handle)
		{
			sampaiinput.value = values[handle];
			hingga.value = values[handle];
		}
		else
		{
			dariinput.value = values[handle];
			dari.value = values[handle];
		}
	});

	dari.addEventListener('change', function(){
		slider.noUiSlider.set([this.value, null]);
	});

	hingga.addEventListener('change', function(){
		slider.noUiSlider.set([null, this.value]);
	});

	// =====================Grid Mode==================//
	$( ".list" ).click(function() 
	{
		  $('.right-block .col-md-4').removeClass('col-md-4').removeClass('col-sm-4').addClass('col-md-12').addClass('col-sm-12').addClass('list-view');
		  $('.list-product').addClass('list-view');
	});

	$( ".grid" ).click(function() 
	{
		  $('.right-block .col-md-12').removeClass('col-md-12').removeClass('col-sm-12').addClass('col-md-4').addClass('col-sm-4');
		  $('.list-product').removeClass('list-view');
	});
	
	// =====================close row table cart==================//
	$('.del').click(function(e){
		$(this).closest('tr').remove();
	});

	// =====================Trigger drowdown submenu categories==================//
	$('.toggle-trigger').on('click', function(event)
	{
		event.preventDefault();
		$(this).toggleClass(' ').next('.submenu').slideToggle(300).end();
	});
}

// ===================== Breadcrumb progress==================//
$(".breadcrumb-progress .crumb").each(function(){

    if (window.location.href.match("product/cart/index"))
    {
      $("#crumb1").addClass('active');
    }

    if (window.location.href.match("product/cart/buyer"))
    {
      $("#crumb1").addClass('active');
      $("#crumb2").addClass('active');
    };

    if (window.location.href.match("product/cart/shipping"))
    {
      $("#crumb1").addClass('active');
      $("#crumb2").addClass('active');
      $("#crumb3").addClass('active');
    };

    if (window.location.href.match("product/cart/detail"))
    {
      $("#crumb1").addClass('active');
      $("#crumb2").addClass('active');
      $("#crumb3").addClass('active');
      $("#crumb4").addClass('active');
    };
});

$(document).ready(main);
//]]>