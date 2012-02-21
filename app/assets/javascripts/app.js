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
  var districts = $("#subject_district_id").html();
  // first state
  var city_first = $("#subject_city_id :selected").text();
  var opt_fir = $(districts).filter("optgroup[label='"+city_first+"']").html();
  $("#subject_district_id").html(opt_fir);
  
  $("#subject_city_id").change(function(event) {
    var city = $("#subject_city_id :selected").text();
    var options = $(districts).filter("optgroup[label='"+city+"']").html();
    if (options) {
      $("#subject_district_id").html(options);
    }
    else{
      $("#subject_district_id")
        .attr("disabled", true)
        .html("<option>Нет района</option>");
    };
  });
});