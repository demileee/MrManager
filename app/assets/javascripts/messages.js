// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var discussion = document.getElementById('discussion')
  var messageBoard = document.querySelector('.message-board')

  messageBoard.classList.add('animated');
  messageBoard.style.display = 'none';
  discussion.scrollTop = discussion.scrollHeight;

  function toggleMessages(div){
    if (div.style.display === 'none'){
      div.classList.remove('slideOutRight')
      div.classList.add('slideInRight')
      div.style.display = "flex";
    } else {
      div.classList.remove('slideInRight')
      div.classList.add('slideOutRight')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  discussion.addEventListener('click', function(e) {
    e.preventDefault();
    toggleMessages(messageBoard);
  });
})
