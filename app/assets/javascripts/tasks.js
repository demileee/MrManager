// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {

  var completePinnedTask = document.getElementById('completed');
  var completeTasks = document.querySelectorAll('.complete_task')
  var checkBox = document.createElement('i');

  checkBox.classList.add('material-icons');
  checkBox.innerText = 'check_box_outline_blank'
  completePinnedTask.appendChild(checkBox);


  completeTasks.forEach(function(task) {
    task.lastChild.innerText = 'check_box_outline_blank';
    task.addEventListener('mouseover', function(e){
      task.lastChild.innerText = 'check_box';
    });
    task.addEventListener('mouseout', function() {
      task.lastChild.innerText = 'check_box_outline_blank';
    })
  })

});
