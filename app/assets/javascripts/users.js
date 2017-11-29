// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var getQuotes = document.querySelector(".get-quotes > a");
  var quoteDiv  = document.querySelector(".get-quotes");
  var body      = document.querySelector('body');
  var dataHex   = document.body.getAttribute('data-hex');
  var hex       = dataHex.slice(1);
  var tasksPane = document.querySelector("#tasks-pane")
  var taskLink = document.querySelector('.task-link')
  var taskLinkTwo = document.querySelector('.user-task-link')
  var notepadLink = document.querySelector('.notepad-link')
  var notepad     = document.querySelector('.notepad')

  var fontColour = function(hex){
    var r = parseInt(hex.substr(0,2),16);
    var g = parseInt(hex.substr(2,2),16);
    var b = parseInt(hex.substr(4,2),16);
    var yiq = ((r*299)+(g*587)+(b*114))/1000;
    return (yiq >= 160) ? 'black' : 'white';
  }

  body.style.color = fontColour(hex);

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

  function toggleDiv(div){
    if (div.style.display === "none"){
      div.style.display = "block";
    } else {
      div.style.display = "none";
    }
  }

  taskLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDiv(tasksPane);
  })

  notepadLink.addEventListener('click', function(e){
    e.preventDefault();
    toggleDiv(notepad);
  })
});
