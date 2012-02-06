$(document).ready(function() {
  // errors form:
  // $('.errorExplanation').hide();
  var errors = [];
  $('.errorExplanation ul li').each(function(index) {
    errors.push($(this).text());
  });
  if (errors.length > 0) {
    $.each(errors, function(index, val) {
      $('<span class="help-inline">'+val+'</span>').insertAfter('#city_name');
    });
  };
  
  
  //  cancel button
  $(".cancel-form").click(function(){
    javascript:history.go(-1);
  });
});
