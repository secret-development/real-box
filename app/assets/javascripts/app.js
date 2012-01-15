// tabs
$(function(){
  $("#menu-tabs ul li a").click(function(){
    $(".selected").removeClass('selected');
    $(this).addClass('selected');
  });
});