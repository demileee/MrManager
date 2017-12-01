// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var addToCalTimezone = document.querySelector(".timezone");

  if (addToCalTimezone) {
    addToCalTimezone.innerText = Intl.DateTimeFormat().resolvedOptions().timeZone;
  }

  function toggleDivLeft(div, link, linkTwo){
    if (div.style.display === 'none'){
      // Remove slide outs
      div.classList.remove('slideOutLeft');
      link.classList.remove('slideOutLeft');
      linkTwo.classList.remove('slideOutLeft');
      // Add slide ins
      div.classList.add('slideInLeft');
      link.classList.add('slide-from-left', 'slideInLeft');
      linkTwo.classList.add('slide-from-left', 'slideInLeft');
      div.style.display = "block";
    } else {
      // Remove slide ins
      div.classList.remove('slideInLeft')
      link.classList.remove('slide-from-left', 'slideInLeft')
      linkTwo.classList.remove('slide-from-left', 'slideInLeft')
      // Add slide outs
      div.classList.add('slideOutLeft')
      link.classList.add('slideOutLeft')
      linkTwo.classList.add('slideOutLeft')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  tasksPane.classList.add('animated');
  tasksPane.style.display = 'none';

  taskLink.addEventListener('click', function(e) {
    console.log('clicked');
    e.preventDefault();
    toggleDivLeft(tasksPane, taskLink, detailsLink);
  })
})
