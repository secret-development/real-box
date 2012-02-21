$(function() {
  $('#task th a, #task .pagination a').live("click", function() {
    $.getScript(this.href);
    return false;
  });
  
  $('#tasks_search input').keyup(function(){
    $.get($("#tasks_search").attr("action"), $("#tasks_search").serialize(), null, "script");
    return false;
  });

});
