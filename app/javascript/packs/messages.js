$(function() {
  $msg = $('.msg_card_body');
  $msg.scrollTop($msg.prop('scrollHeight'));
  
  function validate_msg(e) {
    let msg = $('.type_msg').val();
    if (msg === '') {
      alert('Type message, please !');
      e.preventDefault();
      return false;
    } else {
      $('.new_message').submit();
    }
  }
  
  $('.send_btn').click(function(e) {
    validate_msg(e);
  });
  
  $('.type_msg').on('keydown', function(e) {
    if (e.keyCode == 13) {
      validate_msg(e);
    }
  });
});



