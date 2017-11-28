// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var input = document.getElementById('ajax')
  var datalist = document.getElementById('ajax-email')

  var request = new XMLHttpRequest();
  request.onreadystatechange = function() {
    var jsonOptions = JSON.parse(request.responseText);

    jsonOptions.forEach(function(user) {
      var option = document.createElement('option');
      option.value = user;
      dataList.appendChild(option);
    });
  }
  
});
