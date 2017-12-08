// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var notepadLink = document.querySelector('.notepad-link')
  var notepad     = document.querySelector('.notepad')
  var form        = document.querySelector('.edit_user')
  var submit      = form.querySelector('.submit')

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    submit.style.display = 'none';

    toggleDiv(notepad, notepadLink, "slideInRight", "slideOutRight");

    $.ajax({
      url: form.getAttribute('action'),
      method: form.getAttribute('method'),
      dataType: 'json',
      data: $(form).serialize()
    });
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


});
