// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {

  var tasksPane = document.getElementById("tasks-pane");
  var taskLink = document.querySelector('#user-task-link');
  var editSelf = document.querySelector('.edit-link');
  var taskForm = document.querySelector('.task-form-cont');
  var addTask = document.querySelector('.add-task');
  var closeButtonTasks = document.querySelector("#close-button-tasks")

  var completePinnedTask = document.getElementById('completed');
  var completeTasks = document.querySelectorAll('.complete_task');
  var completeLinks = document.querySelectorAll('.complete_link');
  var checkBox = document.createElement('i');

  tasksPane.classList.add('animated');
  tasksPane.style.display = 'none';


  taskLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDiv(tasksPane, editSelf, "slideInLeft", "slideOutLeft", 'slide-from-left', undefined);
  })

  closeButtonTasks.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiv(tasksPane, editSelf, "slideInLeft", "slideOutLeft", "slide-from-left", undefined)
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

  checkBox.classList.add('material-icons');
  checkBox.innerText = 'check_box_outline_blank'
  completePinnedTask.appendChild(checkBox);


  completeLinks.forEach(function(link){
    link.preventDefault();

    link.addEventListener('click', function(e){
      console.log(link);
    });
    //   console.log('clicked!');
    //   $.ajax({
    //     type: link.dataset.method,
    //     url: link.href
    //   }).done(function(){
    //     console.log("done!");
    //   });
    // });
  });

});
