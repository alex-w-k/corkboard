var submit_message;

App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    if (data.message.blank == null) {
      return $('.chatbox').append('<div class="message">' + '<div class="message-user">' + data.user + ":" + '</div>' + '<div class="message-content">' + data.message + '</div>' + '</div>');
    }
  }
});

$(document).on('turbolinks:load', function() {
  return submit_message();
});

submit_message = function() {
  return $('#message_content').on('keydown', function(event) {
    if (event.keyCode === 13) {
      $('input').click();
      event.target.value = "";
      return event.preventDefault();
    }
  });
};
