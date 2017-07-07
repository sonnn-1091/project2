$(document).ready(function(){
  $('body').on('click', '.follow-btn', function(e){
    e.preventDefault();
    var user_id = $(this).attr('id');
    $.ajax({
      type: 'POST',
      dateType: 'json',
      url: '/relationships',
      data: {id: user_id},
      success: function(data){
        $('.follow-form-div').html(data.button_html);
        $('.followers').text(parseInt($('.followers').text()) + 1);
      }
    });
  });

  $('body').on('click', '.unfollow-button', function(e){
    e.preventDefault();
    var user_id = $(this).attr('id');
    $('.followers').text();
    $.ajax({
      type: 'DELETE',
      dateType: 'json',
      url: '/relationships/'+ user_id,
      data: {id: user_id},
      success: function(data){
        $('.follow-form-div').html(data.button_html);
        $('.followers').text(parseInt($('.followers').text()) - 1);
      }
    });
  });
});
