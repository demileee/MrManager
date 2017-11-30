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
  var notepadLink = document.querySelector('.notepad-link')
  var notepad     = document.querySelector('.notepad')
  var allLinks = document.querySelectorAll('a')

  var fontColour = function(hex){
    var r = parseInt(hex.substr(0,2),16);
    var g = parseInt(hex.substr(2,2),16);
    var b = parseInt(hex.substr(4,2),16);
    var yiq = ((r*299)+(g*587)+(b*114))/1000;
    return (yiq >= 160) ? 'black' : 'white';
  }

  body.style.color = fontColour(hex);
  allLinks.forEach(function(link){
    link.style.color = "#ffffff";
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
      newpTag.className = "quote"
      newpTag.innerText = quote
      quoteDiv.appendChild(newpTag, getQuotes);
    });
  });

  function toggleDivLeft(div){
    if (div.style.display === 'none'){
      div.classList.remove('slideOutLeft')
      div.classList.add('slideInLeft')
      div.style.display = "block";
    } else {
      div.classList.remove('slideInLeft')
      div.classList.add('slideOutLeft')
      setTimeout(function() {div.style.display = 'none'}, 200)
    }
  }

  function toggleDivRight(div){
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
    toggleDivLeft(tasksPane);
  })

  taskLinkTwo.addEventListener('click', function(e){
    e.preventDefault();
    toggleDivLeft(tasksPane);
  })

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDivRight(notepad);
  })
});
