$(function(){
  console.log("linked!");

  $('#new-word-button').click(function(){
    $('#new-word-button').fadeOut(function(){
      $('#new-word').fadeIn();
    })
  });


  $('#new-definition-button').click(function(){
    $('#new-definition-button').fadeOut(function(){
      $('#new-definition').fadeIn();
    })
  });


});
