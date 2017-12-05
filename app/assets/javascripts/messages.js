// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var discussion = document.getElementById('discussion');
  var messageBoard = document.querySelector('.message-board');
  var messageForm = document.getElementById('new_message');
  var messageField = document.querySelector(".message-field");
  var messageBody = document.getElementById('message_message_body');
  var submitMessage = messageForm.querySelector('input[type="submit"]');
  var allMessages = document.querySelector('.all-messages');
  allMessages.scrollTop = allMessages.scrollHeight;

  var ownerMessage = document.querySelector('.message-owner');

  var send = document.createElement('i')
  send.classList.add('material-icons');
  send.innerText = 'send';
  messageField.appendChild(send);

  messageBoard.classList.add('animated');
  messageBoard.style.display = 'none';
  messageForm.classList.add('animated');
  messageForm.style.display = 'none';
  document.querySelector('div.submit').style.display = 'none'

  function toggleMessages(div, div2){
    if (div.style.display === 'none'){
      div.classList.remove('slideOutRight');
      div.classList.add('slideInRight');
      div.style.display = "flex";
      div2.classList.remove('slideOutDown');
      div2.classList.add('slideInUp');
      div2.style.display = 'block'
    } else {
      div.classList.remove('slideInRight');
      div.classList.add('slideOutRight');
      div2.classList.remove('slideInUp');
      div2.classList.add('slideOutDown');
      setTimeout(function() {div2.style.display = 'none'}, 200)
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  discussion.addEventListener('click', function(e) {
    e.preventDefault();
    toggleMessages(messageBoard, messageForm);
  });

  send.addEventListener('click', function(e) {
    send.action = 'submit';
    send.style.color = '#696464';
    setTimeout(function() {send.style.color = ''}, 350);
    $.ajax({
      url: messageForm.action,
      method:messageForm.method,
      dataType: 'json',
      data: $(messageForm).serialize()
    }).done(function(data) {
      var newMessage = ownerMessage.cloneNode(true);
      newMessage.querySelector('.message_body').innerText = data.message_body;
      allMessages.scrollTop = allMessages.scrollHeight;
      allMessages.append(newMessage);
      newMessage.scrollIntoView();
      newMessage.classList.add("animated", "slideInUp");
    }).fail(function(data, a, b) {
      console.log('in fail');
      console.log(data);
      console.log(a);
      console.log(b);

    })
  })
})
