// tabs
$(function(){
  $("#menu-tabs ul li a").click(function(){
    $(".selected").removeClass('selected');
    $(this).addClass('selected');
  });
});

// forms:
// type deal:
$(document).ready(function() {
  $('#type-deal').buttonset();
});
// price:
$(function(){
  $("#price").slider({
    range: true,
    min: 1000,
    max: 2000000,
    step: 1000,
    values: [5000, 500000],
    slide: function(event, ui){
      $( "#price-label" ).html( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    }
  });
  $( "#price-label" ).html( "$" + $( "#price" ).slider( "values", 0 ) +
  			" - $" + $( "#price" ).slider( "values", 1 ) );
});