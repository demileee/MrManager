App.useractivity = App.cable.subscriptions.create("UseractivityChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(notification) {
    // Called when there's incoming data on the websocket for this channel
       $('#notifications').prepend("<div class='notification'>"+ notification.message + "</div>")
  }
});
