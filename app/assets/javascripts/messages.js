// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var discussion = document.getElementById('discussion');
  var discussionLink = document.querySelector('.discussion-link');
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

  discussionLink.addEventListener('click', function(e) {
    e.preventDefault();
    toggleMessages(messageBoard, messageForm, discussion);
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
      if (data.error !== undefined) {
        newMessage.querySelector('.message_body').innerText = data.error;;
      } else {
        newMessage.querySelector('.message_body').innerText = data.message_body;
      }
      allMessages.scrollTop = allMessages.scrollHeight;
      allMessages.append(newMessage);
      newMessage.scrollIntoView();
      newMessage.classList.add("animated", "slideInUp");
    });
  });
});
