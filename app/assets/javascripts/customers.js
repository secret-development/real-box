$(document).ready(function() {
  //сортировка таблицы
  $('.customer-sort')
    .tablesorter({sortList: [[1,0]]})
    //постраничное разбиение
    .tablesorterPager({container: $("#pager")});
  
  // Сортировка при помощи ссылок
  //сортировка по фамилии
  $('#lastname-link').click(function() {
    var sorting = [[1,0]];
    $('.customer-sort').trigger("sorton", [sorting]);
    return false;
  });
  //сортировка по типам клиентов
  $('#type-link').click(function() {
    var sorting = [[3,0]];
    $('.customer-sort').trigger("sorton", [sorting]);
    return false;
  });  
});
