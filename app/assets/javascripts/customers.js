$(document).ready(function() {
  //сортировка таблицы
  $('.customer-sort').tablesorter({sortList: [[1,0]]});
  
  //sort lastname
  $('#lastname-link').click(function() {
    var sorting = [[1,0]];
    $('.customer-sort').trigger("sorton", [sorting]);
    return false;
  });
  
  //sort typecustomer
  $('#type-link').click(function() {
    var sorting = [[3,0]];
    $('.customer-sort').trigger("sorton", [sorting]);
    return false;
  });  
});
