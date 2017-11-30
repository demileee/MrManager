// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function() {
  var input = document.getElementById('ajax');
  var datalist = document.getElementById('ajax-email');

  input.addEventListener('keyup', function() {
    $.ajax({
      url: 'new.json',
      method: 'GET'
    }).done(function(data){
        datalist.textContent = '';
        data.forEach(function(user) {
          var option = document.createElement('option');
          option.value = user;
          datalist.appendChild(option);
        });
    });
  });
});
