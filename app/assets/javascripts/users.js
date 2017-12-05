// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var notepadLink = document.querySelector('.user-notes')
  var notepad     = document.querySelector('.notepad')

  function toggleDivLeft(div, link){
    if (div.style.display === 'none'){
      div.classList.remove('slideOutLeft');
      link.classList.remove('slideOutLeft');
      div.classList.add('slideInLeft');
      link.classList.add('slide-from-left', 'slideInLeft');
      div.style.display = "block";
    } else {
      div.classList.remove('slideInLeft')
      link.classList.remove('slide-from-left', 'slideInLeft')
      div.classList.add('slideOutLeft')
      link.classList.add('slideOutLeft')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleUserRight(notepad);
  })

  function toggleUserRight(div){
    if (div.style.display === 'none'){
      div.classList.remove('slideOutRight')
      div.classList.add('slideInRight')
      div.style.display = "block";
    } else {
      div.classList.remove('slideInRight')
      div.classList.add('slideOutRight')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  notepad.classList.add('animated')
  notepad.style.display = 'none';

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
