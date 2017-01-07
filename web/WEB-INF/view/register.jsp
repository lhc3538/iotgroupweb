<%--
  Created by IntelliJ IDEA.
  User: WSL
  Date: 2016/10/21
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ch">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <!-- Preloader -->
    <link rel="stylesheet" href="../../source/css/preloader.css" type="text/css" media="screen, print"/>

    <!-- Icon Font-->
    <link rel="stylesheet" href="../../source/css/style_icon_font.css">
    <link rel="stylesheet" href="../../source/css/owl.carousel.css">
    <link rel="stylesheet" href="../../source/css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="../../source/css/animate.css">

    <!-- Bootstrap -->
    <link href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- Style -->
    <link href="../../source/css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="../../source/css/responsive.css" rel="stylesheet">
</head>


<body>
<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>
<!--top-->
<header id="HOME" style="background-position: 50% -125px;">
    <div class="section_overlay">
        <!--头部横栏-->
        <%@ include file="header.jsp"%>
    </div>
</header>
<!--top-->

<section class="services" id="SERVICE">
    <section class="about_us_area" id="ABOUT">
        <div class="container">
            <h2>注册账号</h2>
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <div class="form-group">
                        <label for="uid">学号(10位)</label>
                        <h6 class="text-warning" style="display:inline" id="dis_uid"></h6>
                        <input type="text" class="form-control" id="uid"/>
                    </div>
                    <div class="form-group">
                        <label for="uemail">邮箱</label>
                        <h6 class="text-warning" style="display:inline" id="dis_email"></h6>
                        <input type="email" class="form-control" id="uemail"/>
                    </div>
                    <div class="form-group">
                        <label for="uname">真实姓名</label>
                        <h6 class="text-warning" style="display:inline" id="dis_name"></h6>
                        <input type="text" class="form-control" id="uname"/>
                    </div>
                    <div class="form-group">
                        <label for="uclass">班级</label>
                        <h6 class="text-warning" style="display:inline" id="dis_class"></h6>
                        <input type="text" class="form-control" id="uclass"/>
                    </div>
                    <div class="form-group">
                        <label for="uphone">电话号码</label>
                        <h6 class="text-warning" style="display:inline" id="dis_phone"></h6>
                        <input type="tel" class="form-control" id="uphone"/>
                    </div>
                    <div class="form-group">
                        <label for="passwd">密码</label>
                        <h6 class="text-warning" style="display:inline" id="dis_passwd"></h6>
                        <input type="password" class="form-control" id="passwd"/>
                    </div>
                    <div class="form-group">
                        <label for="passwd_con">确认密码</label>
                        <h6 class="text-warning" style="display:inline" id="dis_passwd_con">password error</h6>
                        <input type="password" class="form-control" id="passwd_con"/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-default" id="register_bt">注册</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>


<!--底部栏-->
<%@ include file="footer.jsp"%>

<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="../../source/js/jquery.nicescroll.js"></script>
<script src="../../source/js/owl.carousel.js"></script>
<script src="../../source/js/wow.js"></script>
<script src="../../source/js/script.js"></script>
<script src="../../source/js/register.js"></script>
<script src="../../source/js/md5.js"></script>
<script src="../../source/js/logcheck.js"></script>
</body>
</html>
