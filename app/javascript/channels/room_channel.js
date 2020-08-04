import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    var msg = '';
    if (data.sender_id != $('#message_sender_id').val()) {
      msg = `<div class="d-flex justify-content-start mb-4">`;
      msg += `<div class="img_cont_msg">`;
      msg += `<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">`;
      msg += `</div><div class="msg_cotainer">${data.message}`;
      msg += `</div></div>`;
    } else {
      msg = `<div class="d-flex justify-content-end mb-4">`;
      msg += `<div class="msg_cotainer_send">${data.message}</div>`;
      msg += `<div class="img_cont_msg">`;
      msg += `<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">`;
      msg += `</div></div>`;
    }
    $msg = $('.msg_card_body');
    $msg.append(msg);
    $msg.scrollTop($msg.prop('scrollHeight'));
    $('.type_msg').val('');
  }
});
