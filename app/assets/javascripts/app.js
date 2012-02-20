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
    $("#subject_district").attr("disabled", true);
    $(".district-operations").slideUp('fast');
    $("#add_district")
      .attr("disabled", false)
      .show('fast');
  });
});
