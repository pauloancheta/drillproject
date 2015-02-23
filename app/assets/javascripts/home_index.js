$(document).ready(function () {

  $('.navlink').css('text-decoration', 'none');

  $('a').css('text-decoration', 'none');

  // POSTER BUTTON ANIMATION
  $('.poster').hover(function() {
    $(this).children('.button').animate({'bottom': '-=20px'}, 1);
  }, function() {
    $(this).children('.button').css('bottom', '0px');
  });

  // NAVBUTTON
  $('.navbutton').hover(function() {
    $(this).css('background', '#4d496c');
    $(this).find('.navlink').css('color', 'white');
    $(this).find('a').css('color', 'white');
  }, function() {
    $(this).css('background', 'white');
    $(this).find('.navlink').css('color', '#4d496c');
    $(this).find('a').css('color', '#4d496c');
  });

  // NAVLINK
  $('.navlink').hover(function() {
    $(this).css('color', '#40daf4');
  },function() {
    $(this).css('color', 'white');
  });

});