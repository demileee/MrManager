// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var getQuotes = document.querySelector(".get-quotes > a");
  var quoteDiv  = document.querySelector(".get-quotes");
  var body      = document.querySelector('body');

  getQuotes.addEventListener('click', function(e){
    e.preventDefault();
    $.ajax({
      url: 'http://quotes.rest/qod.json?category=inspire',
      method: 'GET'
    }).done(function(data){
      var quote = data.contents.quotes[0].quote
      var newpTag = document.createElement('p')
      newpTag.className = "quote"
      newpTag.innerText = quote
      quoteDiv.insertBefore(newpTag, getQuotes);
    });
  });

  var getBackground  = body.style.backgroundImage;
  var sourceImageUrl = getBackground.slice(5, -2);

  $.ajax({
    url: 'https://cors-anywhere.herokuapp.com/http://mkweb.bcgsc.ca/color-summarizer/',
    method: 'GET',
    data: {
      url: sourceImageUrl,
      num_clusters: 1,
      precision: 'vhigh',
      xml: 1
    }
  }).done(function(data){
    // var xmlText = getXMLString();
    // var XMl = new DOMParser().parseFromString(xml, 'text/xml');
    // var obj = parse(XML)

    // var dataReturn = data
    // parser = new DOMParser();
    // xmlDoc = parser.parseFromString(dataReturn, "text/xml");
    // hex = xmlDoc.getElementsByTagName("clusters")

  })

  function getContrastYIQ(hexcolor){
    var r = parseInt(hexcolor.substr(0,2),16);
    var g = parseInt(hexcolor.substr(2,2),16);
    var b = parseInt(hexcolor.substr(4,2),16);
    var yiq = ((r*299)+(g*587)+(b*114))/1000;
    return (yiq >= 128) ? 'black' : 'white';
  }

});
