$(document).ready(function () {
var WelcomeMsg = ["Hey", "Welcome", "Hello", "Whats Up", "Good day", "Whats Kicking"];
  
  var msgselect = Math.floor((Math.random() * WelcomeMsg.length));
 $('#greeting').prepend(WelcomeMsg[msgselect] + "  ");

})


