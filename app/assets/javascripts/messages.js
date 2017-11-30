// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var discussion = document.getElementById('discussion');
  var messageBoard = document.querySelector('.message-board');
  var messageForm = document.getElementById('new_message');
  console.log(messageForm.action);
  var submitMessage = messageForm.querySelector('input[type="submit"]');
  var allMessages = document.querySelector('.all-messages');
  allMessages.scrollTop = allMessages.scrollHeight;

  var ownerMessage = document.querySelector('.message-owner')

  var send = document.createElement('i')
  send.classList.add('material-icons');
  send.innerText = 'send';
  messageForm.appendChild(send)

  messageBoard.classList.add('animated');
  messageBoard.style.display = 'none';
  messageForm.classList.add('animated');
  messageForm.style.display = 'none';
  document.querySelector('div.submit').style.display = 'none'

  function toggleMessages(div){
    if (div.style.display === 'none'){
      div.classList.remove('slideOutRight');
      div.classList.add('slideInRight');
      div.style.display = "flex";
    } else {
      div.classList.remove('slideInRight');
      div.classList.add('slideOutRight');
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

    function toggleNewMessage(div) {
      if (div.style.display === 'none'){
        div.classList.remove('slideOutDown');
        div.classList.add('slideInUp');
        div.style.display = 'block'
      } else {
        div.classList.remove('slideInUp');
        div.classList.add('slideOutDown');
        setTimeout(function() {div.style.display = 'none'}, 200)
      }

    }

  discussion.addEventListener('click', function(e) {
    e.preventDefault();
    toggleMessages(messageBoard);
    toggleNewMessage(messageForm);
  });

  send.addEventListener('click', function(e) {
    console.log(messageForm.action);

    send.action = 'submit'
    send.style.color = '#696464';
    setTimeout(function() {send.style.color = '#dedede'}, 350);
    $.ajax({
      url: messageForm.action,
      method:messageForm.method,
      dataType: 'json',
      data: $(messageForm).serialize()
    }).done(function(data) {
      console.log(data);
      var newMessage = ownerMessage.cloneNode(true);
      newMessage.querySelector('.message_body').innerText = data.message_body;

      allMessages.append(newMessage);
      allMessages.scrollTop = allMessages.scrollHeight;
    }).fail(function(data, a, b) {
      console.log('in fail');
      console.log(data);
      console.log(a);
      console.log(b);

    })
  })
})
