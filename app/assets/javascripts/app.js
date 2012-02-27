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
    console.log(curindex);
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

// subject -> floor
