$(document).ready(function () {


// POSTER BUTTON ANIMATION
$('.poster').hover(function () {
  $(this).children('.button').animate({'bottom': '-=20px'}, 1);
},function () {
  $(this).children('.button').css('bottom', '0px');
});



})