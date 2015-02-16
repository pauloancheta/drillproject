$(document).ready(function () {

var WelcomeMsg = ["Hey", "Welcome", "Hello", "Whats Up", "Good day", "Whats Kicking", "Ahoy", "G'day", "Salutations", "Hej", "Bonjour", "Guten Tag", "Aloha", "¡Hola!"];
  
var MotivationMsg = [
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      {txt: "It does not matter how slowly you go as long as you do not stop.", person: "Confucius"},
                      {txt: "If you can dream it, you can do it.", person: "Walt Disney"},
                      {txt: "In order to succeed, we must first believe that we can.", person: "Nikos Kazantzakis"},
                      {txt: "Either I will find a way, or I will make one.", person: "Philip Sidney"},
                      {txt: "Don't watch the clock; do what it does. Keep going.", person: "Sam Levenson"},
                      {txt: "You're doing alright guy. You're doing alright.", person: "Cooper Dean"},
                      {txt: "Don't watch the clock; do what it does. Keep going.", person: "Sam Levenson"},
                      {txt: "Dude sucking at something is the first step to becoming sorta good at something", person: "Jake"},
                      ];


 
  var msgselect = Math.floor((Math.random() * WelcomeMsg.length));
 $('#greeting').prepend(WelcomeMsg[msgselect] + "  ");

 var quoteselect = Math.floor((Math.random() * MotivationMsg.length));
 $('#quote').prepend(MotivationMsg[quoteselect].txt +  " - " + MotivationMsg[quoteselect].person);


});
