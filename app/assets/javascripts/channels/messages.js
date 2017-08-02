App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    if (data.message.blank == null) {
      $('#messages').append('<div class="message">' + '<div class="message-user row">' + '<span class="chat-name col-md-6">' + data.user + '</span>' + '<span class="chat-time col-md-6">' + data.created_at + '</span>' + '</div>' + '<div class="message-content row">' + '<div class="chat-content">' + data.message + '</div>' + '</div>' + '</div>'), scroll_bottom();
    }
  }
});

$(document).ready(function() {
  submit_message();
  scroll_bottom();
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

scroll_bottom = function() {
  $('.chatbox').scrollTop($('.chatbox')[0].scrollHeight);
}
