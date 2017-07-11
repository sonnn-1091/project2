$(document).ready(function(){
  $('body').on('click', '.delete-btn', function(){
    var id = $(this).attr('id');
    var post_id = $(this).attr('post_id');
    var confirm_delete = confirm(I18n.t('posts.comment.delete'));
    if (confirm_delete == true){
      $.ajax({
        type: 'DELETE',
        dateType: 'json',
        url: '/posts/'+ post_id +'/comments/' + id,
        data: {id: id, post_id: post_id},
        success: function(data){
          $('.list-cmt').html(data.comment);
          $('.cmt-count').text(parseInt($('.cmt-count').text()) - 1);
        }
      });
    }
  });

  $('body').on('click', '#submit-cmt', function(e){
    e.preventDefault();
    var post_id;
    var content;
    if($(this).attr('edit') == 'false'){
      post_id = $(this).attr('post_id');
      content = $('#cmt-content').val();
      $.ajax({
        type: 'POST',
        dateType: 'json',
        url: '/posts/' + post_id + '/comments',
        data: {post_id: post_id, content: content},
        success: function(data){
          $('.list-cmt').html(data.comment);
          $('#cmt-content').val('');
          $('html, .list-cmt').animate({scrollTop: $('.list-cmt')[0].scrollHeight}, 'slow');
          $('.cmt-count').text(parseInt($('.cmt-count').text()) + 1);
        }
      });
    }
    else{
      post_id = $(this).attr('post_id');
      var id = $(this).attr('id_cmt');
      content = $('#cmt-content').val();
      $.ajax({
        type: 'PUT',
        dateType: 'json',
        url: '/posts/' + post_id + '/comments/' + id,
        data: {id: id, content: content, post_id: post_id},
        success: function(data){
          $('.list-cmt').html(data.comment);
          $('#cmt-content').val('');
          $('#submit-cmt').attr('edit','false');
        }
      });
    }
  });

  $('body').on('click', '.edit-btn', function(){
    $('#cmt-content').val($(this).closest('.content-cmt').find('p').text());
    var id = $(this).closest('.edit-btn').attr('id_cmt');
    $('#submit-cmt').attr({'id_cmt': id, 'edit': 'true'});
    $('#cancel-cmt').show();
  });

  $('#cancel-cmt').click(function(event) {
    $('#cmt-content').val('');
    $('#submit-cmt').attr('edit', 'false');
    $(this).hide();
  });
});
