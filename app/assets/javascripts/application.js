// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .

document.addEventListener('DOMContentLoaded', function() {
// var getQuotes = document.querySelector(".get-quotes > a");
var quoteDiv  = document.getElementById("get-quotes");
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
    newpTag.classList.add('quote', 'animated', 'fadeInUp')
    newpTag.innerText = quote
    body.insertBefore(newpTag, main);
  });
});
});
