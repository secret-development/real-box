// tabs
$(function(){
  $("#menu-tabs ul li").click(function(){
    $(".selected").removeClass('selected');
    $(this).addClass('selected');
  });
});