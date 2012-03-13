$(document).ready(function() {  
  //  cancel button
  $(".cancel-form").click(function(){
    javascript:history.go(-1);
  });
});

$(document).ready(function() {
  // districts(subject form)
  $("#add_district")
    .attr("disabled", true)
    .hide();
  $("#add-district-button").click(function(event) {
    $("#subject_district_id").attr("disabled", true);
    $(".district-operations").slideUp('fast');
    $("#add_district")
      .attr("disabled", false)
      .show('fast');
    $("#back-district-select").show();
  });
  
  // back to list districts
  $("#back-district-select").click(function(event) {
    $("#add_district")
      .attr("disabled", true)
      .hide('fast');
    $("#subject_district_id").attr("disabled", false);  
    $(".district-operations").slideDown('fast');
    $("#back-district-select").hide();
  });
  
});

// districts load(subject form)
$(document).ready(function() {
  // functions :
  function disabled_district(){
    $("#subject_district_id")
      .attr("disabled", true)
      .html("<option>Нет района</option>");
  }
  
  function enable_district(){
    $("#subject_district_id")
      .attr("disabled", false)
  }
  
  // all districts :
  var districts = $("#subject_district_id").html();
  
  // first state
  var city_first = $("#subject_city_id :selected").text();
  var opt_fir = $(districts).filter("optgroup[label='"+city_first+"']").html();
  $("#subject_district_id").html(opt_fir);
  if (!opt_fir) {
    disabled_district();
  };
  
  // change city
  $("#subject_city_id").change(function(event) {
    var city = $("#subject_city_id :selected").text();
    var options = $(districts).filter("optgroup[label='"+city+"']").html();
    if (options) {
      enable_district();
      $("#subject_district_id").html(options);
    }
    else{
      disabled_district();
    };
  });
});

// last call customer
$(document).ready(function() {
  $("#man-called-but").click(function(event) {
    var customer_id = $(this).attr("data-customer-id");
    $.ajax({
      url: '/customers/lastcallcustomer',
      type: 'POST',
      dataType: 'json',
      data: {id: customer_id },
      success: function(data, textStatus, xhr) {
        $("#last-call-value")
          .html(data)
          .effect("highlight", {color: '#676767'}, 1000);
      }
    });
    
  });

  
});


// live search for customer
$(document).ready(function() {
  $('#customer th a').live("click", function() {
    $.getScript(this.href);
    return false;
  });
  
  $('#customers_search input').keyup(function(){
    $.get($("#customers_search").attr("action"), $("#customers_search").serialize(), null, "script");
    return false;
  });
});

// live search for tasks
$(document).ready(function() {
  $('#task th a').live("click", function() {
    $.getScript(this.href);
    return false;
  });
  
  $('#tasks_search input').keyup(function(){
    $.get($("#tasks_search").attr("action"), $("#tasks_search").serialize(), null, "script");
    return false;
  });
});

// live search for transactions
$(document).ready(function() {
  $('#transaction th a').live("click", function() {
    $.getScript(this.href);
    return false;
  })
  
  $('#transactions_search input').keyup(function(){
    $.get($("#transactions_search").attr("action"), $("#transactions_search").serialize(), null, "script");
    return false;
  })
})


//subjects-photo
$(document).ready(function() {
  $("#subject-photos-thumbs a").click(function(event) {
    var big_pic = $(this).attr('href');
    var thumb_pic = $(this).children().attr('src');
    $("#main-subject-photo a").attr('href', big_pic);
    $("#main-subject-photo a img").attr('src', thumb_pic)
    $("#subject-photos-thumbs").find("A.stActive").removeClass("stActive");
    $(this).addClass("stActive");
    return false;
  });

  // fancybox
  $("#main-subject-photo a").click(function(event) {
    var piclist = [];
    var curindex = 0;
    $("#subject-photos-thumbs a").each(function(idx) {
      piclist.push(this.href);
      if($(this).hasClass("stActive")) curindex=idx;
    });
    $.fancybox(piclist, {
        'padding'           : 0,
        'margin'            : 0,
        'centerOnScroll'    : true,
        'transitionIn'      : 'none',
        'transitionOut'     : 'none',
        'type'              : 'image',
        'changeFade'        : 0,
        'index'             : curindex
    });
    return false;
  });
});

//transactions-document
$(document).ready(function() {
  $("#transaction-documents a").click(function(event) {
    $("#main-transaction-document a").attr('href', 'file');
    $("#main-transaction-document a img").attr('src', 'file')
    $("#transaction-documents").find("A.stActive").removeClass("stActive");
    $(this).addClass("stActive");
    return false;
  });
});
  
// validation user new
$(document).ready(function() { 
  $('#user-new').validate({
    rules: {
      "user[email]": {
        required: true, 
        email: true,
      },
      "user[password]": {
        required: true, 
        minlength: 7,
      },
      "user[password_confirmation]": {
        required: true, 
        minlength: 7, 
        equalTo: '#password',
      },
      "user[lastname]" : {
        required: true
      },
      "user[firstname]" : {
        required: true
      },    
    },
    messages: {
      "user[email]": {
        email: "Введите почтовый адрес!",
        required: "Введите почтовый адрес!",
      },
      "user[password]": { 
        minlength: "Пароль не менее 7ми  символов!",
        required: "Введите пароль!",
      },
      "user[password_confirmation]": {
        equalTo: "Пароли не совпадают!",
        required: "Введите пароль!",
        minlength: "Пароль не менее 7ми символов!"
      },
      "user[lastname]": {
        required: "Введите фамилию!",
      },
      "user[firstname]": {
        required: "Введите имя!",
      }, 
    }
    
  });
});

// validation session new
$(document).ready(function() {
  $('#session-new').validate({
    rules: {
      "email": {
        required : true,
        email : true,
      },
      "password" : {
        required : true,
      }
    },
    messages : {
      "email" : {
        required : "Поле не должно быть пустым!",
        email : "Введите корректный почтовый адрес!",
      },
      "password" : "Поле не должно быть пустым!",
    }
  })
});
// validation send to email
$(document).ready(function(){
  $('#send-to-email').validate({
    rules : {
      "email" : {
        required : true,
        email : true,
      }
    },
    messages : {
      "email" : {
        required : "Введите почтовый адрес",
        email : "Введите корректный почтовый адрес!",
      }
    }  
  })
});


// customer -> mobile phone fields(autotab)
$(document).ready(function() {
  $('#area_code, #phonemobile1, #phonemobile2')
    .autotab_magic()
    .autotab_filter('numeric');
  $('#customer_phonehome').autotab_filter('numeric');
  
  $('#ad-house, #ad-flat')
    .autotab_magic()
    .autotab_filter('numeric');
  
});

// subject -> floor
$(document).ready(function() {
  if ($("form").find("#exist-floor-subject").length != 0) {
    $("#floor-subject-block :input").attr("disabled", true);
  };
  
  $("#subject_typesubject_id").change(function(event) {
    var typesubject_id = $(this).attr("value");
    $.ajax({
      url: '/subjects/findtypesubject',
      type: 'POST',
      dataType: 'json',
      data: {id: typesubject_id},
      success: function(data, textStatus, xhr) {
        if((data['floor'] == true) && ($("form").find("#exist-floor-subject").length == 0)){
          $("#floor-subject-block :input").removeAttr('disabled');
          $("#floor-subject-block").slideDown('fast');
        }
        else if((data['floor'] == false) && ($("form").find("#exist-floor-subject").length != 0)){
          
          $("#exist-floor-subject")
            .slideUp('fast')
            .remove();
          
          $("#floor-subject-block :input").attr('disabled', true);
          $("#floor-subject-block").slideUp('fast');
        }
        else if(data['floor'] == false){
          $("#floor-subject-block :input").attr('disabled', true);
          $("#floor-subject-block").slideUp('fast');
        }
      }
    });
    
  });
});


// // subject -> change subject (load attr)
// $(document).ready(function() {
//   
//   // если в дальнейшем будет зависеть от subject
//   // var subject_id = $("#subject-id").attr("data-subject-id");
//   // console.log(subject_id);
//   
//   $("#subject_typesubject_id").change(function(event) {
//     // initialize
//     var typesubject_id = $(this).attr('value');
//     // end initialize
//     
//     // ajax
//     $.ajax({
//       url: '/subjects/load_attr',
//       type: 'POST',
//       dataType: 'json',
//       data: {id: typesubject_id},
//       success: function(data, textStatus, xhr) {
//         console.log(data);
//       },
//       error: function(xhr, textStatus, errorThrown) {
//         alert("Упс...что-то пошло не так.")
//       }
//     });
//     // end ajax
//     
//   });
//   
//   
// });

// users mobile phone autotab
$(document).ready(function(){
  $('#area_code, #phonemobile1, #phonemobile2')
    .autotab_magic()
    .autotab_filter('numeric');
    $('#user_phonemobile').autotab_filter('numeric');
});


// what type?(condition fields)
$(document).ready(function() {
  $("#what-type-input").fancybox();
});


// subject -> price formating function
$(document).ready(function() {
  $('#subject_price').priceFormat({
    prefix: '',
    centsLimit: 0,
    centsSeparator: '',
    thousandsSeparator: ' '
  });
});

// transaction -> price formating function
$(document).ready(function() {
  $("#transaction_price").priceFormat({
    prefix: '',
    centsLimit: 0,
    centsSeparator: '',
    thousandsSeparator: ' '
  });
});

//validation reset password
$(document).ready(function(){
  $('#password-reset').validate({
    rules: {
      "user[password]" : {
        required: true,
        minlength: 7, 
      },
      "user[password_confirmation]" : {
        required: true,
        minlength: 7,
        equalTo: '#confirm',
      },
    },
    messages: {
      "user[password]": { 
        minlength: "Пароль не менее 7ми  символов!",
        required: "Введите пароль!",
      },
      "user[password_confirmation]": {
        equalTo: "Пароли не совпадают!",
        required: "Введите пароль!",
        minlength: "Пароль не менее 7ми символов!"
      },  
    }
  })
});

// validates for customer:
$(document).ready(function() {
  $(".customer-form-validation").validate({
    rules: {
      "customer[lastname]" : {
        required: true
      },
      "customer[firstname]" : {
        required: true
      },
      "customer[phonehome]" : {
        digits: true
      },
      "customer[email]" : {
        email: true
      }
    },
    messages: {
      "customer[lastname]" : {
        required: "Введите фамилию"
      },
      "customer[firstname]" : {
        required: "Введите имя"
      },
      "customer[phonehome]" : {
        digits: "Только цифры"
      },
      "customer[email]" : {
        email: "Неправильный формат e-mail"
      }
    }
  });  
});

// validates for subject
$(document).ready(function() {
  $(".subject-form-validation").validate({
    rules: {
      "subject[districtname]" : {
        required: true
      },
      "subject[price]" : {
        required: true
      },
      "subject[area]" : {
        digits: true
      },
      "subject[floor]" : {
        required: true,
        digits: true
      }
    },
    messages: {
      "subject[districtname]" : {
        required: "Введите название района"
      },
      "subject[price]" : {
        required: "Введите цену "
      },
      "subject[area]" : {
        digits: "Только цифры"
      },
      "subject[floor]" : {
        required: "Введите этаж",
        digits: "Только цифры"
      }
    }
  });
});

// validates for task
$(document).ready(function() {
  $(".task-form-validation").validate({
    rules: {
      "task[title]" : {
        required: true,
        maxlength: 140
      },
      "task[description]" : {
        required: true,
        maxlength: 800
      },
      "task[user_id]" : {
        required: true
      },
      "task[deadline]" : {
        required: true
      }
    },
    messages: {
      "task[title]" : {
        required: "Введите название",
        maxlength: "Не более 140 символов"
      },
      "task[description]" : {
        required: "Введите описание",
        maxlength: "Не более 800 символов"
      },
      "task[user_id]" : {
        required: "Выберите ответственного"
      },
      "task[deadline]" : {
        required: "Выберите срок дедлйна"
      }
    }
  });
});

// validates for transaction
$(document).ready(function() {
  $(".transaction-form-validation").validate({
    rules: {
      "transaction[name]" : {
        required: true,
        maxlength: 140
      },
      "transaction[description]" : {
        required: true,
        maxlength: 800
      },
      "transaction[price]" : {
        required: true
      }
    },
    messages: {
      "transaction[name]" : {
        required: "Введите название",
        maxlength: "Не более 140 символов"
      },
      "transaction[description]" : {
        required: "Введите описание",
        maxlength: "Не более 800 символов"
      },
      "transaction[price]" : {
        required: "Введите цену"
      }
    }
  });
});

// validates for settings -> city
$(document).ready(function() {
  $(".city-form-validation").validate({
    rules: {
      "city[name]" : {
        required: true
      }
    },
    messages: {
      "city[name]" : {
        required: "Введите название"
      }
    }
  });
});


// validates for settings -> social statuses
$(document).ready(function() {
  $(".socialstatus-form-validation").validate({
    rules: {
      "social_status[title]" : {
        required: true
      }
    },
    messages: {
      "social_status[title]" : {
        required: "Введите наименование"
      }      
    }
  });
});

// validates for settings -> typesubjects
$(document).ready(function() {
  $(".typesubject-form-validation").validate({
    rules: {
      "typesubject[name]" : {
        required: true
      },
      "typesubject[permalink]" : {
        required: true
      }
    },
    messages: {
      "typesubject[name]" : {
        required: "Введите название"
      },
      "typesubject[permalink]" : {
        required: "Введите постоянную ссылку"
      }
    }
  });
});

// validates for settings -> condition fields
$(document).ready(function() {
  $(".condition-field-form-validation").validate({
    rules: {
      "condition_field[namefield]" : {
        required: true
      }
    },
    messages: {
      "condition_field[namefield]" : {
        required: "Введите название поля"
      }
    }
  });
});

// validates for settings -> value fields
$(document).ready(function() {
  $(".value-field-form-validation").validate({
    rules: {
      "value_field[valuefield]" : {
        required: true
      }
    },
    messages: {
      "value_field[valuefield]" : {
        required: "Введите значение"
      }
    }
  });
});

// search:
// change city - load districts
$(document).ready(function() {
  // functions :
  function disabled_district(){
    $("#search_district_id_eq")
      .attr("disabled", true)
      .html("<option>Нет района</option>");
  }
  
  function enable_district(){
    $("#search_district_id_eq")
      .attr("disabled", false)
  }
  
  // all districts :
  var districts = $("#search_district_id_eq").html();
  
  // first state
  var city_first = $("#search_city_id_eq :selected").text();
  var opt_fir = $(districts).filter("optgroup[label='"+city_first+"']")
    .prepend('<option value="">Все районы</option>')
    .html();
  $("#search_district_id_eq").html(opt_fir);
  if (!opt_fir) {
    disabled_district();
  };
  
  // change city
  $("#search_city_id_eq").change(function(event) {
    var city = $("#search_city_id_eq :selected").text();
    var options = $(districts).filter("optgroup[label='"+city+"']")
    .prepend('<option value="">Все районы</option>')
    .html();
    if (options) {
      enable_district();
      $("#search_district_id_eq").html(options);
    }
    else{
      disabled_district();
    };
  });
});