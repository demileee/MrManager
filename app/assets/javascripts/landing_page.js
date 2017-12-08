document.addEventListener('DOMContentLoaded', function() {
  var body = document.querySelector('body');
  var whiteLogo = document.querySelector('.logo-white');
  var blackLogo = document.querySelector('.logo-black');


  if (body.style.color === 'white'){
    whiteLogo.style.display = 'block';
  } else {
    blackLogo.style.display = 'block';
  }
});
