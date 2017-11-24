// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var getQuotes = document.querySelector(".get-quotes > a")
  var quoteDiv  = document.querySelector(".get-quotes")

  getQuotes.addEventListener('click', function(e){
    e.preventDefault();
    $.ajax({
      url: 'http://api.forismatic.com/api/1.0/?method=getQuote&format=json&key=4&lang=en',
      method: 'POST',
      // headers: {"Access-Control-Allow-Origin": 'http://localhost:3000'}
    }).done(function(data){
      console.log(data);
      var quote = data.quoteText
      var newpTag = document.createElement('p')
      newpTag.className = "quote"
      newpTag.innerText = quote
      quoteDiv.insertBefore(newpTag, getQuotes);
    });
  });

});
// THIS IS AN ALTERNATIVE API
// $.ajax({
//   url: 'http://quotes.rest/qod.json?category=inspire',
//   method: 'GET'
// }).done(function(data){
//   var quote = data.contents.quotes[0].quote
//   var newpTag = document.createElement('p')
//   newpTag.className = "quote"
//   newpTag.innerText = quote
//   quoteDiv.insertBefore(newpTag, getQuotes);
// });
