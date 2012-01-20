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
      // enable disabled inputs
      $("#option-square-form input").removeAttr("disabled");
      // other animation actions
      $("#option-square-form").slideDown("slow");
      $('html, body').animate({ 
            scrollTop: $('#square-detail').offset().top 
        }, 500);
      $("#option-square-form").removeClass("hide");  
    }
    else{
      // disabled enabled inputs
      $("#option-square-form input").attr("disabled", "disabled");
      $("#option-square-form").hide();
      $("#option-square-form").addClass("hide");
    };
  });
});

// floor:
$(function(){
  $("#floor").slider({
    range:true,
    min: 1,
    max: 40,
    values: [2,9],
    step: 1,
    slide: function(event, ui){
      $("#floor-label").val(ui.values[0] + " - " + ui.values[1])
    }
  });
  $("#floor-label").val($("#floor").slider("values",0) + " - " + $("#floor").slider("values",1));
});

// extended options:

// extended options call
$(document).ready(function(){
  $("#extended-search>span").click(function(){
    if($("#extended-options").hasClass("hide")){
      // enable disabled inputs
      $("#extended-options input").removeAttr("disabled");
      $("#extended-options label").removeAttr("aria-disabled");
      // other actions
      $("#extended-options").slideDown("fast");
      $('html, body').animate({
            scrollTop: $('#extended-options').offset().top
        }, 500);
      $("#extended-options").removeClass("hide");
      $("#extended-search>span").html("Краткий поиск");
    }
    else{
      // disabled enable inputs:
      $("#extended-options input").attr("disabled", "disabled");
      $("#extended-options label").attr("aria-disabled","true");
      // other actions
      $("#extended-options").hide();
      $("#extended-options").addClass("hide");
      $("#extended-search>span").html("Расширенный поиск");  
    };
  });
});

// year of construction
$(document).ready(function() {
  var d = new Date();
  var current_year = d.getFullYear();
  $("#year-of-constr").slider({
    range: true,
    min: 1900,
    max: current_year,
    values: [1950, current_year],
    slide: function(event, ui){
      $("#year-of-constr-label").val(ui.values[0] + " - " + ui.values[1] + " год");
    }
  });
  $("#year-of-constr-label").val($("#year-of-constr").slider("values", 0) + " - " + $("#year-of-constr").slider("values", 1) + " год");
});

// buttons set for extended checkboex and radio buttons:
$(document).ready(function() {
  $('#type-of-structure').buttonset();
  $('#telephone').buttonset();
  $("#furniture").buttonset();
  $("#internet").buttonset();
  $("#balcony").buttonset();
  $('#wc').buttonset();
  $("#layout").buttonset();  
  $("#state").buttonset();
});

// disabled inputs for extended-options
$(document).ready(function() {
  $("#extended-options input").attr("disabled", "disabled");
  $("#extended-options label").attr("aria-disabled", "true");
});

// disabled inputs for option-square-form
$(document).ready(function() {
  $("#option-square-form input").attr("disabled", "disabled");
});

// todo: фото

// todo: cookie при поиске скрытые поля остаются открытыми если они открыты