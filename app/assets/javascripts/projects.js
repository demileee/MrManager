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


  tasksPane.classList.add('animated');
  tasksPane.style.display = 'none';
  detailsPane.classList.add('animated');
  detailsPane.style.display = 'none';
  taskForm.classList.add('animated');
  taskForm.style.display = 'none';


  taskLink.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(tasksPane, detailsLink, "slideInLeft", "slideOutLeft", "slide-from-left", detailsPane)
  })

  detailsLink.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(detailsPane, detailsLink, "slideInLeft", "slideOutLeft", "slide-from-left", tasksPane)
  })

  addTaskButton.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(taskForm, undefined, "fadeIn", "fadeOut")
  })

})
