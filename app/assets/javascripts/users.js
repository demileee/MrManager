// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var notepadLink = document.querySelector('.user-notes')
  var notepad     = document.querySelector('.notepad')
  var form        = document.querySelector('.edit_user')

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDiv(notepad, notepadLink, "slideInRight", "slideOutRight");

    $.ajax({
      url: form.getAttribute('action'),
      method: form.getAttribute('method'),
      dataType: 'json',
      data: $(form).serialize()
    }).always(function(){
      console.log("finished");
    })
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
      div.style.display = "block";
  }

  sortButtonPriority.addEventListener('click', function(e){
    e.preventDefault();
    toggleSortTasks(priorityTasks);
  })

  sortButtonCreation.addEventListener('click', function(e){
    e.preventDefault();
    toggleSortTasks(creationTasks);
  })

  sortButtonDeadline.addEventListener('click', function(e){
    e.preventDefault();
    toggleSortTasks(deadlineTasks);
  })

});
