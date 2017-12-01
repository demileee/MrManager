// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var addToCalTimezone = document.querySelector(".timezone");

  if (addToCalTimezone) {
    addToCalTimezone.innerText = Intl.DateTimeFormat().resolvedOptions().timeZone;
  }

  var tasksPane = document.getElementById("tasks-pane");
  var detailsPane = document.getElementById("details-pane");
  var taskLink = document.querySelector('.tasks-link');
  var detailsLink = document.querySelector('.details-link');
  var addTaskButton = document.querySelector('.add-task-button');
  var taskForm = document.querySelector('.task-form-cont');
  var submitButton = document.querySelector('.submit-button');
  var createTaskMessage = document.querySelector('.create_task_button');

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

  function toggleFadeIn(div){
    if (div.style.display === 'none'){
      div.classList.remove('fadeOut')
      div.classList.add('fadeIn')
      div.style.display = "block";
    } else {
      div.classList.remove('fadeIn')
      div.classList.add('fadeOut')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  tasksPane.classList.add('animated');
  tasksPane.style.display = 'none';
  detailsPane.classList.add('animated');
  detailsPane.style.display = 'none';
  taskForm.classList.add('animated');
  taskForm.style.display = 'none';

  taskLink.addEventListener('click', function(e) {
    console.log('clicked');
    e.preventDefault();
    toggleDivLeft(tasksPane, taskLink, detailsLink);
  })

  detailsLink.addEventListener('click', function(e) {
    console.log('clicked');
    e.preventDefault();
    toggleDivLeft(detailsPane, taskLink, detailsLink);
  })

  addTaskButton.addEventListener('click', function(e) {
    console.log('clicked');
    e.preventDefault();
    toggleFadeIn(taskForm);
  })

  createTaskMessage.addEventListener('click', function(e) {
    console.log('clicked');
    e.preventDefault();
    toggleFadeIn(taskForm);
  })


})
