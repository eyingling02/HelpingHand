$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  submitPostListener();
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


var submitPostListener = function() {
  $('#explanation-container').on('submit', '.new-post', function(event) {
    event.preventDefault();
    console.log("yay")

    var postData = $('form').serialize();
    $.ajax({
      url: $('.new-post').attr('action'),
      type: $('.new-post').attr('method'),
      data: postData
    })
    .done(function(responseData){
      $('form').hide();
      $('#explanation-container').prepend(responseData);
    })
    .fail(function(responseData){
      alert("Something went wrong here");
    });
  });
};
