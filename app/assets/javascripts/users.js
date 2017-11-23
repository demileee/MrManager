// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var getQuotes = document.querySelector(".get-quotes > a")
  var quoteDiv  = document.querySelector(".get-quotes")

  getQuotes.addEventListener('click', function(e){
    e.preventDefault();
    $.ajax({
      url: 'http://quotes.rest/qod.json?category=inspire',
      method: 'GET'
    }).done(function(data){
      var quote = data.contents.quotes[0].quote
      var newpTag = document.createElement('p')
      newpTag.className = "quote"
      newpTag.innerText = quote
      quoteDiv.insertBefore(newpTag, getQuotes);
    });
  });

});
