// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var getQuotes = document.querySelector(".get-quotes > a");
  var quoteDiv  = document.querySelector(".get-quotes");
  var body      = document.querySelector('body');
  var dataHex   = document.body.getAttribute('data-hex');
  var hex       = dataHex.slice(1);
  var tasksPane = document.getElementById("tasks-pane")
  var taskLink = document.querySelector('.user-tasks')
  var taskLinkTwo = document.getElementById('user-task-link')
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

  getQuotes.addEventListener('click', function(e){
    e.preventDefault();
    if (document.contains(document.querySelector('.quote'))){
      document.querySelector('.quote').remove();
    }
    $.ajax({
      url: 'http://quotes.rest/qod.json?category=inspire',
      method: 'GET'
    }).done(function(data){
      var quote = data.contents.quotes[0].quote
      var newpTag = document.createElement('p')
      newpTag.classList.add('quote', 'animated', 'fadeInUp')
      newpTag.innerText = quote
      quoteDiv.appendChild(newpTag, getQuotes);
    });
  });

  function toggleDivLeft(div, link, linkTwo){
    if (div.style.display === 'none'){
      // Remove slide outs
      div.classList.remove('slideOutLeft');
      link.classList.remove('slideOutLeft');
      linkTwo.classList.remove('slideOutLeft');
      // Add slide ins
      div.classList.add('slideInLeft');
      link.classList.add('slide-from-left', 'slideInLeft');
      linkTwo.classList.add('slide-from-left', 'slideInLeft');
      div.style.display = "block";
    } else {
      // Remove slide ins
      div.classList.remove('slideInLeft')
      link.classList.remove('slide-from-left', 'slideInLeft')
      linkTwo.classList.remove('slide-from-left', 'slideInLeft')
      // Add slide outs
      div.classList.add('slideOutLeft')
      link.classList.add('slideOutLeft')
      linkTwo.classList.add('slideOutLeft')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

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
    toggleDivLeft(tasksPane, taskLink, editSelf);
  })

  taskLinkTwo.addEventListener('click', function(e){
    e.preventDefault();
    toggleDivLeft(tasksPane, taskLink, editSelf);
  })

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleUserRight(notepad);
  })
});
