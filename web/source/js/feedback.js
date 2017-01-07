/**
 * Created by wsx on 2016/10/25.
 */
$(function () {
   $('#button_fb').click(function () {
       var name=$('#name_fb').val();
       if(name == ""){
           alert("Name不能为空");
           return;
       }
       var email=$('#email_fb').val();
       if(email == ""){
           alert("email不能为空");
           return;
       }else{
           var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
           if(!reg.test($('#email_fb').val())){
               alert("email格式不正确");
               return;
           }
       }
       var subject=$('#subject_fb').val();
       if(subject == ""){
           alert("Subject不能为空");
           return;
       }
       var message=$('#message_fb').val();
       if(message == ""){
           alert("Message Text不能为空");
           return;
       }else{
           if($('#message_fb').val().length < 12) {
               alert("请输入多于12个字，谢谢合作");
               return;
           }
       }
       $.ajax({
           type: "POST",
           url: "feedback",
           data: {name: $("#name_fb").val(),
               email:$('#email_fb').val(),
               subject:$('#subject_fb').val(),
               content:$('#message_fb').val()
           },
           dataType:"text",
           success: function (data) {
               if (data == "success") {
                   alert("反馈成功，谢谢支持！！");
                   $('#name_fb').val("");
                   $('#email_fb').val("");
                   $('#subject_fb').val("");
                   $('#message_fb').val("");
               }
           }
       });
   });
});