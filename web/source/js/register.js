/**
 * Created by wsx on 2016/10/21.
 */
$(function () {
    var uidflag = true;
    var uemailflag = true;
    var unameflag = true;
    var uclassflag = true;
    var uphoneflag = true;
    var upasswdflag = true;
    var upasswd_conflag = true;
    $('#uid').blur(function () {
        if ($(this).val() == "") {
            uidflag = false;
            $('#dis_uid').text("请填写账号！！！");
        } else {
            $.ajax({
                type: "POST",
                url: "checkUIDAvailable",
                data: { uid: $("#uid").val()},
                success: function (data) {
                    if("true" == data){
                        $('#dis_uid').text("用户名可用");
                        uidflag = true;
                    } else {
                        $('#dis_uid').text(data);
                        uidflag = false;
                    }
                }
            });
        }
    });
    $('#uemail').blur(function () {
        if ($(this).val() == "") {
            uemailflag = false;
            $('#dis_email').text("请填写邮箱！！！");
        } else {
            var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if (reg.test($(this).val())) {
                $('#dis_email').text("邮箱可用");
                uemailflag = true;
            } else {
                uemailflag = false;
                $('#dis_email').text("邮箱格式不正确！！！");
            }
        }
    });
    $('#uname').blur(function () {
        if ($(this).val() == "") {
            $('#dis_name').text("请填写用户名！！！");
            unameflag = false;
        } else {
            $('#dis_name').text("");
            unameflag = true;
        }
    });
    $('#uclass').blur(function () {
        if ($(this).val() == "") {
            $('#dis_class').text("请填写班级！！！");
            uclassflag = false;
        } else {
            $('#dis_class').text("");
            uclassflag = true;
        }
    });
    $('#uphone').blur(function () {
        if ($(this).val() == "") {
            $('#dis_phone').text("请填写手机号码！！！");
            uphoneflag = false;
        } else {
            if (!$("#uphone").val().match(/^[1][3578][0-9]{9}$/)) {
                $('#dis_phone').text("手机号码格式不正确！！！");
                uphoneflag = false;
            } else {
                $('#dis_phone').text("");
                uphoneflag = true;
            }
        }
    });
    $('#passwd').blur(function () {
        if ($(this).val() == "") {
            $('#dis_passwd').text("请填写密码！！！");
            upasswdflag = false;
        } else {
            if ($(this).val().length < 6 || $(this).val().length > 20) {
                $('#dis_passwd').text("密码应为6到20位！！！");
                upasswdflag = false;
            } else {
                var pass_con = $('#passwd_con').val();
                if (pass_con == "") {
                    $('#dis_passwd').text("");
                    upasswdflag = true;
                } else {
                    if (pass_con == $(this).val()) {
                        $('#dis_passwd').text("");
                        upasswdflag = true;
                    } else {
                        $('#dis_passwd').text("密码与确认密码不一致！！");
                        upasswdflag = false;
                    }
                }
            }
        }
    });
    $('#passwd_con').blur(function () {
        if ($(this).val() == "") {
            $('#dis_passwd_con').text("请填写确认密码！！！");
            upasswd_conflag = false;
        } else {
            var pass = $('#passwd').val();
            var pass_con = $('#passwd_con').val();
            if (pass == pass_con) {
                upasswd_conflag = true;
                $('#dis_passwd_con').text("");
            } else {
                upasswd_conflag = false;
                $('#dis_passwd_con').text("两次密码填写不一致！！");
            }
        }
    });
    $('#register_bt').click(function () {
        if (uidflag && uemailflag && unameflag && uclassflag && uphoneflag && upasswdflag && upasswd_conflag) {
            $.ajax({
                type: "POST",
                url: "userRegister",
                data: { uid: $("#uid").val(),
                        uemail: $("#uemail").val(),
                        passwd: hex_md5($("#passwd").val()),
                        uname : $('#uname').val(),
                        uphone: $('#uphone').val(),
                        uclass: $('#uclass').val()
                },
                success: function (data) {
                    alert(data);
                }
            });
        }else{
            alert("信息不完整，请完善信息");
            return;
        }
    });

    $("#id_reset").click(function () {
        $("#id_email").val('');
        $("#id_password").val('');
    });
});