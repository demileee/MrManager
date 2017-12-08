document.addEventListener('DOMContentLoaded', function() {

  var navButton = document.querySelector(".nav-button")
  var navMenu = document.querySelector(".nav-menu")
  var header = document.querySelector(".mobile")

  navMenu.classList.add('animated')
  header.classList.add('animated')
  header.classList.add('slideInDown')

  navButton.addEventListener("click", function(e){
    e.preventDefault();
    console.log(e.target)
    toggleDiv(navMenu, "", "slideInDown", "slideOutUp")
  })


}
