$(document).ready(function () {
var WelcomeMsg = ["Hey", "Welcome", "Hello", "Whats Up", "Good day", "Whats Kicking", "Ahoy", "G'day", "Salutations", "Hej", "Bonjour", "Guten Tag", "Aloha", "¡Hola!"];
  
  var msgselect = Math.floor((Math.random() * WelcomeMsg.length));
 $('#greeting').prepend(WelcomeMsg[msgselect] + "  ");


 var MotivationMsg = [
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      {txt: "You Can Do It!", person: "Rob Schneider"},
                      ]

})


