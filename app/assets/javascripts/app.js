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

// disabled input for slider
$(document).ready(function() {
  $(".input-slider").attr("readonly", true);
});

// select menu
$(document).ready(function() {
  $(".selectmenujs").selectmenu({style:'dropdown'});
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
      var startvalue = ui.values[0];
      startvalue = partion(startvalue);
      
      var stopvalue = ui.values[1];
      stopvalue = partion(stopvalue);
      
      $("#price-label").val("$"+startvalue+" - $"+stopvalue);
    }
  });
  
  // partiotion price:
  var firstvalue = $("#price").slider("values", 0);
  firstvalue = partion(firstvalue);
  
  var secondvalue = $("#price").slider("values", 1)
  secondvalue = partion(secondvalue);
  
  $("#price-label").val( "$" + firstvalue + " - $" + secondvalue );
});

// partition price function
function partion(obj){
  obj = obj.toString().replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, "$1 ");
  return obj
}

// number of rooms:
$(function(){
  $("#numrooms").slider({
    range: true,
    min: 1,
    max: 12,
    values: [2, 4],
    step: 1,
    slide: function(event, ui){
      $("#numrooms-label").val(ui.values[0] + " - " + ui.values[1]);
    }
  });
  $("#numrooms-label").val( $("#numrooms").slider( "values", 0 ) + " - " + $("#numrooms").slider("values",1));
});

// square:
$(function(){
  $("#square").slider({
    range: true,
    min: 10,
    max: 700,
    values: [50, 200],
    step: 1,
    slide: function(event, ui){
      $("#square-label").val(ui.values[0] + " - " + ui.values[1] + " кв.м")
    }
  });
  $("#square-label").val($("#square").slider("values",0) + " - " + $("#square").slider("values",1) + " кв.м");
});

// kitchen square:
$(function(){
  $("#kitchen-square").slider({
    range: true,
    min: 1,
    max: 100,
    values: [10,20],
    step:1,
    slide: function(event, ui){
      $("#kitchen-square-label").val(ui.values[0] + " - " + ui.values[1] + " кв.м")
    }
  });
  $("#kitchen-square-label").val($("#kitchen-square").slider("values",0) + " - " + $("#kitchen-square").slider("values",1) + " кв.м");
});

// living square:
$(function(){
  $("#living-square").slider({
    range: true,
    min: 1,
    max: 600,
    values: [50,200],
    step:1,
    slide: function(event, ui){
      $("#living-square-label").val(ui.values[0] + " - " + ui.values[1] + " кв.м")
    }
  });
  $("#living-square-label").val($("#living-square").slider("values",0) + " - " + $("#living-square").slider("values",1) + " кв.м");
});

// show option square form
$(document).ready(function() {
  $("#square-detail").click(function(){
    if($("#option-square-form").hasClass("hide")){
      $("#option-square-form").slideDown("slow");
      $("#option-square-form").removeClass("hide");  
    }
    else{
      $("#option-square-form").slideUp("slow");
      $("#option-square-form").addClass("hide");
    };
  });
});


// todo: посдвечивать блок со значением когда изменяется слайдером
// todo: кнопка подробнее уплыла