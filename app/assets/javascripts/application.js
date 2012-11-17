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
//= require jquery.ui.datepicker
//= require jquery.nested-fields
//= require "bootstrap"
//= require_tree .
jQuery(function($) {


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
}		
);





$("tr[data-link]").click(function() {
  window.location = this.dataset.link
});

// jquery for hiding and displaying tax


if ( !$("div#tax2 input").val()) {
	$("div#tax2").hide();	
	$("th.tax2").hide();
	$("td.tax2").hide();
}
else {$("div#tax1_links").hide();}



$("a#addTax").click(function(){
	event.preventDefault();
	$("div#tax2").show();
	$("th.tax2").show();
	$("td.tax2").show();
	$("a.tax1_links").hide();
});
$("#removeTax2").click(function(){
	event.preventDefault();
	$("div#tax2").hide();
	$("th.tax2").hide();
	$("td.tax2").hide();
	$("input.tax2").prop("checked", false);
	$("div#tax2 input").val(null);
	$("a.tax1_links").show();
});
$("#removeTax1").click(function(){
	event.preventDefault();
	$("th.tax1").hide();
	$("td.tax1").hide();
	$("input.tax1").prop("checked", false);
	$("div#tax1 input").val(0);

});



})