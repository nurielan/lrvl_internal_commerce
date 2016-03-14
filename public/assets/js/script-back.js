$(document).ready(function() {
	//uri = 'http://localhost/lrvl_internal_commerce/public/back/';
	uri = 'http://store.internalgroup.id/back/';

	// Get mail
    get_mail = setInterval(function() {
    	$.get(uri+'get_mail');
    }, 600000);

	$('#sidebar .panel-heading').click(function() {
		$('#sidebar .list-group').slideToggle();
	});

	var t = $('.table').DataTable( {
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
        "order": [[ 1, 'asc' ]]
    } );
 
    t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();

    tinymce.init({
	    selector: "textarea",
	    plugins: [
	        "advlist autolink lists link charmap print preview anchor",
	        "searchreplace visualblocks code fullscreen",
	        "insertdatetime table contextmenu paste"
	    ],
	    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link"
	});

	$('input[name="image"]').change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('.img-responsive').attr('src', e.target.result).css('display', 'block');
			}
																		            
			reader.readAsDataURL(this.files[0]);
		}
	});

	$('.modal_wbn_button').click(function() {
		$('#modal_wbn').find('input[name="code"]').val($(this).data('code'));
		$('#modal_wbn').find('input[name="id"]').val($(this).data('id'));

		$('#modal_wbn').modal({
			show: true,
			backdrop: 'static'
		});

		return false;
	});

	$('#modal_wbn').find('button[type="submit"]').click(function() {
		$('#modal_wbn_alert').css('display', 'block');

		$.ajax({
			url: uri+'order_main/update',
			data: $('#modal_wbn').find('form').serialize(),
			type: 'post',
			beforeSend: function() {
				$('#modal_wbn_alert div').html('Please wait...');
			},
			success: function(result) {
				$('#modal_wbn_alert div').html(result);
			},
			error: function(xhr) {
				$('#modal_wbn_alert div').html(xhr.status+' '+xhr.statusText);
			}
		});

		return false;
	});

	$('#modal_wbn').on('hidden.bs.modal', function(e) {
		$(this).find('input[name="id"]').val('');
		$(this).find('input[name="code"]').val('');
		$(this).find('input[name="waybill_number"]').val('');
		$('#modal_wbn_alert').css('display', 'none');
		$('#modal_wbn_alert div').empty();
	});
	
	// ============ Date Report ========
	$('.tanggal').each(function(){
	$(this).datepicker({
			dayNamesMin: [ "Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab" ],
			changeYear:true,
			changeMonth:true,
			dateFormat:"yy/mm/dd",
			duration:"fast"
		});
	});
});