// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var discussion = document.getElementById('discussion')
  var messageBoard = document.querySelector('.message-board')

  discussion.classList.add('animated');
  discussion.style.display = 'none';

  function toggleDiscussion(div){
    if (div.style.display === 'none'){
      div.classList.remove('zoomOut')
      div.classList.add('zoomIn')
      div.style.display = "block";
    } else {
      div.classList.remove('zoomIn')
      div.classList.add('zoomOut')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  discussion.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDiscussion(discussion)
  })



})
