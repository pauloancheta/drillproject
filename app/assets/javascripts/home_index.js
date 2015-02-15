$(document).ready(function () {


$('.navlink').css('text-decoration', 'none')

// POSTER BUTTON ANIMATION
$('.poster').hover(function () {
  $(this).children('.button').animate({'bottom': '-=20px'}, 1);
},function () {
  $(this).children('.button').css('bottom', '0px');
});

// NAVBUTTON
$('.navbutton').hover(function () {
  $(this).css('background', '#4d496c');
  $(this).find('.navlink').css('color', 'white');
},function () {
  $(this).css('background', 'white');
  $(this).find('.navlink').css('color', '#4d496c');
});

// NAVLINK
$('.navlink').hover(function () {
  $(this).css('color', '#e56262');
},function () {
  $(this).css('color', 'white');
});


})