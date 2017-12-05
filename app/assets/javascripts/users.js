// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var body      = document.querySelector('body');
  var dataHex   = document.body.getAttribute('data-hex');
  var hex       = dataHex.slice(1);
  var tasksPane = document.getElementById("tasks-pane")
  var taskLink = document.querySelector('#user-task-link')
  var notepadLink = document.querySelector('.user-notes')
  var notepad     = document.querySelector('.notepad')
  var allLinks = document.querySelectorAll('a')
  var editSelf = document.querySelector('.edit-link')

  var fontColour = function(hex){
    var r = parseInt(hex.substr(0,2),16);
    var g = parseInt(hex.substr(2,2),16);
    var b = parseInt(hex.substr(4,2),16);
    var yiq = ((r*299)+(g*587)+(b*114))/1000;
    return (yiq >= 160) ? 'black' : 'white';
  }

  body.style.color = fontColour(hex);

  allLinks.forEach(function(link){
    link.style.color = fontColour(hex);
    link.style.textDecoration = 'none';
  })

  document.querySelector('.text-area-box').style.color = fontColour(hex);

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

  tasksPane.classList.add('animated')
  notepad.classList.add('animated')
  tasksPane.style.display = 'none';
  notepad.style.display = 'none';


  taskLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDivLeft(tasksPane, editSelf);
  })

});
