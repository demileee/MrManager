// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var discussion = document.getElementById('discussion')
  var messageBoard = document.querySelector('.message-board')

  messageBoard.classList.add('animated');
  messageBoard.style.display = 'none';

  discussion.addEventListener('click', function(e) {
    e.preventDefault();
    toggleDivRight(messageBoard);
  });
})
