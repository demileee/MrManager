// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var addToCalTimezone = document.querySelector(".timezone");

  if (addToCalTimezone) {
    addToCalTimezone.innerText = Intl.DateTimeFormat().resolvedOptions().timeZone;
  }

  // Setting up elements
  var tasksPane = document.getElementById("tasks-pane");
  var detailsPane = document.getElementById("details-pane");
  var taskLink = document.querySelector('.tasks-link');
  var detailLink = document.querySelector('.detail-link');
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


  // Hiding add task modal when clicking outside the modal
  var addTask = document.querySelector('.add-task');
  var taskField = document.querySelectorAll('.field');
  var newTaskForm = document.querySelectorAll('.new_task');
  addTask.classList.add('task-field');

  var addTaskChildren = addTask.children
  for (var i = 0; i < addTaskChildren.length; i++) {
    var tableChild = addTaskChildren[i];
    tableChild.classList.add("task-field")
  }

  taskField.forEach(function(field){
    var fieldChildren = field.children
    for (var i = 0; i < fieldChildren.length; i++) {
      var tableChild = fieldChildren[i];
      tableChild.classList.add("task-field")
    }
  })

  newTaskForm.forEach(function(field){
    var fieldChildren = field.children
    for (var i = 0; i < fieldChildren.length; i++) {
      var tableChild = fieldChildren[i];
      tableChild.classList.add("task-field")
    }
  })

  document.querySelector("main").addEventListener("click", function(e) {
    if (taskForm.style.display === "block" &&
    !e.target.classList.contains("addtask") &&
    !e.target.classList.contains("task-field") ) {
      e.preventDefault();
      console.log(e.target)
      toggleDiv(taskForm, undefined, "fadeIn", "fadeOut")
    }
  })

  // ESCAPE key pressed = Add task modal disappears
  $(document).keydown(function(e) {
    if (e.keyCode == 27 && taskForm.style.display === "block") {
      e.preventDefault();
      console.log("hi")
      toggleDiv(taskForm, undefined, "fadeIn", "fadeOut")
    }
  });

  // Panes sliding in from clicking link
  taskLink.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(tasksPane, detailsLink, "slideInLeft", "slideOutLeft", "slide-from-left", detailsPane)
  })

  detailLink.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(detailsPane, detailsLink, "slideInLeft", "slideOutLeft", "slide-from-left", tasksPane)
  })

  addTaskButton.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(taskForm, undefined, "fadeIn", "fadeOut")
  })

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
