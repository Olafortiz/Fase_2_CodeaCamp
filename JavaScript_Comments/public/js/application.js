$(function(){

  hideComment();
  $('#new_comment_button').click(function(){
    hideButton();
    showComment();
  });

  $('#submit_comment').click(function(event){
    x = "";
    event.preventDefault();
    var new_comment = $("textarea#comment_area").val();
    var author = $('#author').val();
    console.log(new_comment);
    console.log(author);
    if ((new_comment.length > 0) && (author.length > 0)){
      addComment(new_comment, author);
    }else{
      alert("Comment and Author cannot be empty.");
    }
    hideComment();
    $('#new_comment_button').show();
    $("form#new_comment").trigger("reset");


  });



});

//new_comment_button methods
var hideComment = function() {
  $('#comments').hide();
}

var hideButton = function() {
  $('#new_comment_button').hide();
}

//submit_comment methods
var showComment = function() {
  $('#comments').show();
}


var addComment = function(newComment, newAuthor) {
  $('ul').append('<li>' + newComment + '<span class="author">' + newAuthor + '</span>' + '</li>');
}

//submit_comment validation methods

var validateComment = function(){

}


