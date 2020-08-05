import consumer from './consumer';

const chat = consumer.subscriptions.create('RoomChannel', {
  connected() {
  },
  
  disconnected() {
  },
  
  received(data) {
    console.log(data);
    if (data.status == 1) {
      $('.type_msg').val('Typing');
    }
    var msg = '';
    if (data.sender_id != $('#message_sender_id').val()) {
      msg = `<div class="d-flex justify-content-start mb-4">
               <div class="img_cont_msg">
                 <img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
               </div>
               <div class="msg_cotainer">${data.message}</div>
            </div>`;
    } else {
      msg = `<div class="d-flex justify-content-end mb-4">
               <div class="msg_cotainer_send">${data.message}</div>
               <div class="img_cont_msg">
                 <img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
               </div>
             </div>`;
    }
    $msg = $('.msg_card_body');
    $msg.append(msg);
    $msg.scrollTop($msg.prop('scrollHeight'));
    $('.type_msg').val('');
  },
  
  appear() {
    $('.type_msg').focusin(function() {
      this.perform('appear', {status: 1});
      console.log('123');
    })
  }
});
