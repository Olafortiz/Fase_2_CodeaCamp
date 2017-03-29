$(document).ready(function() {
 

  $("#submit").on("click", function(event){
    event.preventDefault();
    $("ul").empty();
    validateMail();
    validPassLenght();
    alphanumeric();
    uppercase();
  });

});


function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function validateMail() {

  var email = $("#email").val();
  if (validateEmail(email)) {
  } else {
    $("#result ul").append("<li>Debes de escribir una direccion de email valida</li>");
  }
  return false;
}

function validPassLenght() {
  var value_password = $('#password').val();
  var length_password = value_password.length;
  if ( length_password < 8 ) {
    $('ul').append("<li>El password tiene que tener al menos 8 caracteres</li>");
  }
}

function alphanumeric() {
  var value_password = $('#password').val();
  var value_alphanumeric =  /\d/.test(value_password); 
  if ( value_alphanumeric == false ) {
    $('ul').append("<li>El password tiene que tener al menos un valor numerico (0-9)</li>");
  }
}

function uppercase() {
  var value_password = $('#password').val();
  var value_oneupercase =  /[A-Z]/.test(value_password); 
   if ( value_oneupercase == false ) {
      $('ul').append("<li>El password tiene que tener al menos una mayuscula</li>");
    }
}
