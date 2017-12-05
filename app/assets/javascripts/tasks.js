// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {

  var tasksPane = document.getElementById("tasks-pane")   // from users.js
  var taskLink = document.querySelector('#user-task-link')   // from users.js
  var editSelf = document.querySelector('.edit-link')   // from users.js

  var completePinnedTask = document.getElementById('completed');
  var completeTasks = document.querySelectorAll('.complete_task');
  var completeLinks = document.querySelectorAll('.complete_link');
  var checkBox = document.createElement('i');

  tasksPane.classList.add('animated')   // from users.js
  tasksPane.style.display = 'none';   // from users.js


  taskLink.addEventListener('click', function(e){   // from users.js
    e.preventDefault();
    toggleDivLeft(tasksPane, editSelf);
  })

  completeTasks.forEach(function(task) {
    task.lastChild.innerText = 'check_box_outline_blank';
    task.addEventListener('mouseover', function(e){
      task.lastChild.innerText = 'check_box';
    });
    task.addEventListener('mouseout', function() {
      task.lastChild.innerText = 'check_box_outline_blank';
    });
  });

  function toggleDivLeft(div, link){    // from users.js
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

  checkBox.classList.add('material-icons');
  checkBox.innerText = 'check_box_outline_blank'
  completePinnedTask.appendChild(checkBox);

});
