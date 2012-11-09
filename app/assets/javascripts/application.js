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
//= require_tree .

$(document).ready(function() {
  adjust();
  
  /* NOTIFICATIONS */
  if ($('#notice').html() == '')
    $('#notice').hide();
  else
    setTimeout(function() {
      $('#notice').slideUp();
    }, 2000);
    
  $('#actions-selection').click(function() {
    $('.actions-selection-choices').fadeIn();
  });
  
});

$(window).resize(function() {
  adjust();
})

function adjust() {
  var padding_top = $('body').css('padding-top').substring(0,2);
  $('body').height('100%');
  $('body').height($('body').height() - padding_top);
}
