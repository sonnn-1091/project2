$(document).ready(function(){
  $('.status-change').click(function() {
    var id = $(this).attr('id');
    var status = $(this).attr('status');
    if(status === 'true'){
      status = 'false';
      update_status(id, status);
      $('#' + id).html(I18n.t('admin.users.user.deactive'));
    }
    else{
      status = 'true';
      update_status(id, status);
      $('#' + id).html(I18n.t('admin.users.user.active'));
    }
  });
});

function update_status(id, status){
  $.ajax({
    url: '/users/' + id,
    type: 'PUT',
    dataType: 'json',
    data: {
      user: {
       id: id,
       status: status,
      }
    },
  })
  .done(function(data) {
    $('#' + id).attr('status', data.status);
  });
}
