// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var notepadLink = document.querySelector('.user-notes')
  var notepad     = document.querySelector('.notepad')

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDiv(notepad, notepadLink, "slideInRight", "slideOutRight")
  })

  notepad.classList.add('animated')
  notepad.style.display = 'none';


  //// Toggle sort buttons for tasks in User Dashboard
  var priorityTasks = document.querySelector('.priority-task')
  var creationTasks = document.querySelector('.creation-task')
  var deadlineTasks = document.querySelector('.deadline-task')
  var sortButtonPriority = document.querySelector('.sort-button-priority')
  var sortButtonCreation = document.querySelector('.sort-button-creation')
  var sortButtonDeadline = document.querySelector('.sort-button-deadline')

  function toggleSortTasks(div){
      priorityTasks.style.display = 'none';
      creationTasks.style.display = 'none';
      deadlineTasks.style.display = 'none';
      sortButtonPriority.classList.remove("yellow-active");
      sortButtonCreation.classList.remove("yellow-active");
      sortButtonDeadline.classList.remove("yellow-active");
      div.style.display = "block";
  }

  sortButtonPriority.addEventListener('click', function(e){
    e.preventDefault();
    toggleSortTasks(priorityTasks);
    sortButtonPriority.classList.add("yellow-active")
  })

  sortButtonCreation.addEventListener('click', function(e){
    e.preventDefault();
    toggleSortTasks(creationTasks);
    sortButtonCreation.classList.add("yellow-active")
  })

  sortButtonDeadline.addEventListener('click', function(e){
    e.preventDefault();
    toggleSortTasks(deadlineTasks);
    sortButtonDeadline.classList.add("yellow-active")
  })

});
