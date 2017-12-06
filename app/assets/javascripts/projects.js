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

  $(document).keydown(function(e) {
    // ESCAPE key pressed = Add task modal disappears
    if (e.keyCode == 27 && taskForm.style.display === "block") {
      e.preventDefault();
      console.log("hi")
      toggleDiv(taskForm, undefined, "fadeIn", "fadeOut")
    }
  });


  //// Toggle sort buttons for tasks in Project Page
  var projectPriorityTasks = document.querySelector('.project-priority-task')
  var projectUserTasks = document.querySelector('.project-user-task')
  var projectSortButtonPriority = document.querySelector('.project-sort-button-priority')
  var projectSortButtonUser = document.querySelector('.project-sort-button-user')

  function toggleProjectSortTasks(div){
      projectPriorityTasks.style.display = 'none';
      projectUserTasks.style.display = 'none';
      projectSortButtonPriority.classList.remove("yellow-active");
      projectSortButtonUser.classList.remove("yellow-active");
      div.style.display = "block";
  }

  projectSortButtonPriority.addEventListener('click', function(e){
    e.preventDefault();
    toggleProjectSortTasks(projectPriorityTasks);
    projectSortButtonPriority.classList.add("yellow-active")
  })

  projectSortButtonUser.addEventListener('click', function(e){
    e.preventDefault();
    toggleProjectSortTasks(projectUserTasks);
    projectSortButtonUser.classList.add("yellow-active")
  })

})
