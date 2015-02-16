$(document).ready(function () {
  $('#attempt_submit').on('click', function() {
    var i = 0;
    for(i = 0; i < 100; i++){
      if($('#attempt_text').val() == $('#' + i).text()) {
        $('.correctdiv').fadeIn();
        $('.incorrectdiv').hide();
        // window.location.replace("/drill_groups/#{}/drills");
        break;
      };
      if(i == 99){
        $('.incorrectdiv').fadeIn();
        $('.correctdiv').fadeOut();

      };
    };
  });






});