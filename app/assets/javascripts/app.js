$(document).ready(function() {

  // errors form:

  $('.errorExplanation').hide();
  var errors = [];
  $('.errorExplanation ul li').each(function(index) {
    errors.push($(this).text());
  });

  if (errors.length > 0) {
    
    // name elements:
    var nameElementsWithErrors = []
    $.each(errors, function(index, val) {
      nameElementsWithErrors.push(val.split(/\b/)[0]);
    });

    // all form elements:
    var formElements = []
    $('form fieldset .control-group .controls :input').each(function(index) {
      formElements.push($(this).attr("id"));
    });

    // need elements, where insert errors:
    var needElements = []
    $.each(formElements, function(indexform, valform) {
      $.each(nameElementsWithErrors, function(indexname, valname) {
        var re = new RegExp(valname, 'gi')
        r1 = valform.match(re)
        if(r1 != null){
          needElements.push(valform);
        }
      });
    });
    
    
    // insert errors:
    for (var i=0; i < errors.length; i++) {
      $('<span class="help-inline">'+errors[i]+'</span>').
      insertAfter('#'+needElements[i]);
    };
    
    // add class error
    $.each(needElements, function(index, val) {
      $('#'+val).parent().parent().addClass('error');
    });
    
  };
  
  
  //  cancel button
  $(".cancel-form").click(function(){
    javascript:history.go(-1);
  });
});
