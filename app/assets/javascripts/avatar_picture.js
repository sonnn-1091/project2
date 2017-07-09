$(document).ready(function(){
  $('#user_avatar').change(function(){
    var input = $(this);
    var file = input[0].files[0];
    var reader = new FileReader();
    reader.onload = function(e){
      var image_base64 = e.target.result;
      $('.picture img').attr('src', image_base64);
    };
    reader.readAsDataURL(file);
  });
});
