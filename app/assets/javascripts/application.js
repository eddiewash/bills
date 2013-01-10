// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.datepicker
//= require bootstrap-timepicker
//= require jquery.nested-fields
//= require_tree .
	
jQuery(function($) {
	
$(document).on('touchstart.dropdown.data-api', '.dropdown-menu', function (e) { e.stopPropagation() })

// Datepicker
$('#invoice_service_date, #payment_payment_date, #invoice_invoice_date, #invoice_due_date, .appointment_date').datepicker({ dateFormat: "yy-mm-dd" });

//Timepicker
$('.timepicker-default').timepicker();

// Awesome_nested_fields Add Item  and Remove Item Links
$('FORM').nestedFields({
	afterInsert: function() {
		if (!$("div#tax2 input").val()) {
			$("td.tax2").hide()
	  };
		if (!$("div#tax1 input").val()) {
			$("td.tax1").hide()
		};
	}, 
  containerSelector: 'table',
  itemSelector: 'tr',
});

// makes tr's clickable
$("tr[data-link]").click(function() {
  window.location = this.dataset.link
});

// jquery for hiding and displaying tax

// changes to tax input
$("div#tax1 input").change(function() {
	if ($("div#tax1 input").val() > 0) {
		showTax1Table();
	}
	if ($("div#tax1 input").val() <= 0) {
		hideTax1Table();
	}	
});

// changes to tax input
$("div#tax2 input").change(function() {
	if ($("div#tax2 input").val() > 0) {
		showTax2Table();
	}
	if ($("div#tax2 input").val() <= 0) {
		hideTax2Table();
	}	
});

// hide tax1 if value is 0
if ( $("div#tax1 input").val() <=0 ) {	
	$("div#tax1 input").val(null);
	hideTax1Table();
}

// hide tax2 if value is 0
if ( $("div#tax2 input").val() <=0 ) {
	hideTax2Form ();	
	hideTax2Table();
	
}


//Remove Tax Link (Tax 1)
$("#removeTax1").click(function(){
	event.preventDefault();
	hideTax1Table();
	$("div#tax1 input").val(0);
});

// Add Tax Link
$("a#addTax").click(function(){
	event.preventDefault();
	showTax2Form();
	$(".tax1_links").hide();
});

// Remove Tax Link (2)
$("#removeTax2").click(function(){
	event.preventDefault();
	hideTax2Form();
	hideTax2Table();
	$(".tax1_links").show();
});

function hideTax1Table() {
	$("th.tax1").hide();
	$("td.tax1").hide();
	$("input.tax1").prop("checked", false);
}

function showTax1Table() {
	$("th.tax1").show();
	$("td.tax1").show();
}

function showTax2Form (){
	$("div#tax2").show();	
}

function showTax2Table (){
	$("th.tax2").show();
	$("td.tax2").show();
}

function hideTax2Form (){
	$("div#tax2").hide();
	$("div#tax2 input").val(null);
}

function hideTax2Table () {
	$("th.tax2").hide();
	$("td.tax2").hide();
	$("input.tax2").prop("checked", false);
}

//Google Map

$("#mapTab").click(function(){
	Gmaps.loadMaps();
	$(".map_container").show();
	google.maps.event.trigger(map, 'resize');
});





})