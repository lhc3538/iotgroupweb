/*
 @description登陆表单验证
 @author wsx
 @time 16/10/19
 */
$(document).ready(function () {

    $("#id_reset").click(function () {
        $("#id_uid").val('');
        $("#id_password").val('');
    });

    $('#id_login').click(function () {
        var uid = document.getElementById("id_uid").value;
        var passwd = document.getElementById("id_password").value;
        if (uid == "" || passwd == "") {
            alert("信息输入有误");
            return;
        }
        $.ajax({
            type: "POST",
            url: "login",
            data: {uid: uid, passwd: hex_md5(passwd)},
            success: function (data) {
                if (data == "true") {
                    alert("登录成功");
                    window.location.href = '/';
                } else {
                    alert("用户名或密码错误");
                }
            }
        });
    });
});