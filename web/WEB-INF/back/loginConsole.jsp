<%--
  Created by IntelliJ IDEA.
  User: WSL
  Date: 2016/10/28
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>控制台登录</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

</head>
<body>
<!--top-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand"> IOT WEB</div>
        </div>
    </div>
</nav>
<!--top-->
<!--body-->
<br/>
<br/>
<br/>
<br/>
<div class="container">
    <h2>控制台登录.</h2>
    <hr/>
    <div class="row clearfix">
        <div class="col-md-6 column">
            <div class="form-group">
                <label for="inputUID">UID</label>
                <h6 class="text-warning" style="display:inline"></h6>
                <input type="email" class="form-control" id="inputUID"/>
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <h6 class="text-warning" style="display:inline"></h6>
                <input type="password" class="form-control" id="inputPassword"/>
            </div>
            <button class="btn btn-default" id="bt_login">登录</button>
        </div>
        <div class="col-md-6 column">
        </div>
    </div>
    <hr/>
    <footer style="float:right">
        <p>@SDUST IOT TEAM</p>
    </footer>
</div>
<!--body-->
</body>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/js/md5.js"></script>
<script>
    $("#bt_login").click(function () {
        var uid = $("#inputUID").val();
        var passwd = hex_md5($("#inputPassword").val());
        if ("" == uid || "" == passwd) {
            alert("信息不完整");
            return;
        }
        $.ajax({
            type : "POST",
            url: "/back/checkloginconsole",
            data: {
                uid: uid,
                passwd: passwd
            },
            dataType: "text",
            success: function (data) {
                if ("true" == data) {
                    window.location.href = '/back/uploadfile';
                } else {
                    alert("用户名或密码错误");
                }
            }
        });
    });

</script>
</html>
