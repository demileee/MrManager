document.addEventListener('DOMContentLoaded', function() {
  var body = document.querySelector('body');
  var whiteLogo = document.querySelector('.logo-white');
  var blackLogo = document.querySelector('.logo-black');
  var loginButton = document.querySelector('.login');
  var signupButton = document.querySelector('.sign-up');

  if (body.style.color === 'white'){
    whiteLogo.style.display = 'block';
  } else {
    blackLogo.style.display = 'block';
    loginButton.style.borderColor = 'black';
    loginButton.style.color = 'black';
    signupButton.style.borderColor = 'black';
    signupButton.style.color = 'black';
  }
});
