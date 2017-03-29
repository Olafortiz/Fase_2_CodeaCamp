$(document).ready(function() {

  $('#tab1').show();

  $('ul.tabs li').click(function() {
    
    $('li').removeClass('active');
    
    $(this).addClass('active');

    $('.tab').hide();

    // console.log($('#tab'+this.id.split('')[1])).show();
    var tab_id = $(this).children("a").attr("href");
    
    $(tab_id).show()

  });


// $('ul.tabs li').click(function() {


// });

});