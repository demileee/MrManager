document.addEventListener('DOMContentLoaded', function() {

var body      = document.querySelector('body');
var dataHex   = document.body.getAttribute('data-hex');
var hex       = dataHex.slice(1);
var allLinks = document.querySelectorAll('a')

var fontColour = function(hex){
  var r = parseInt(hex.substr(0,2),16);
  var g = parseInt(hex.substr(2,2),16);
  var b = parseInt(hex.substr(4,2),16);
  var yiq = ((r*299)+(g*587)+(b*114))/1000;
  return (yiq >= 160) ? 'black' : 'white';
}

body.style.color = fontColour(hex);

allLinks.forEach(function(link){
  link.style.color = fontColour(hex);
  link.style.textDecoration = 'none';
})

document.querySelector('.text-area-box').style.color = fontColour(hex);

})
