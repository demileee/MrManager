document.addEventListener('DOMContentLoaded', function() {

var quoteDiv  = document.querySelector(".get-quotes");
var body      = document.querySelector('body');
var main      = document.querySelector('main');


quoteDiv.addEventListener('click', function(){
  if (document.contains(document.querySelector('.quote'))){
    document.querySelector('.quote').remove();
  }
  $.ajax({
    url: 'https://quotes.rest/qod.json?category=inspire',
    method: 'GET'
  }).done(function(data){

    var quote = data.contents.quotes[0].quote
    var newpTag = document.createElement('p')
    newpTag.classList.add('quote', 'animated', 'fadeInUp', 'quote-style')
    newpTag.innerText = quote
    body.insertBefore(newpTag, main);
  });
});

});
