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
    max: 1000000,
    step: 1000,
    values: [20000, 300000],
    slide: function(event, ui){
      var startvalue = ui.values[0].toString();
      startvalue = partion(startvalue);
      
      var stopvalue = ui.values[1].toString();
      stopvalue = partion(stopvalue);
      
      $("#price-label").html("$"+startvalue+" - $"+stopvalue);
    }
  });
  // partiotion price:
  
  var firstvalue = $("#price").slider("values", 0).toString();
  firstvalue = partion(firstvalue)
  
  var secondvalue = $("#price").slider("values", 1).toString();
  secondvalue = partion(secondvalue)
  
  $( "#price-label" ).html( "$" + firstvalue + " - $" + secondvalue );
});

// partition price function
function partion(obj){
  obj = obj.replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, "$1&thinsp;");
  return obj
}