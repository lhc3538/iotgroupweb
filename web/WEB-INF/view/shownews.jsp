<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ch">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新闻</title>

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

<header id="HOME" style="background-position: 50% -125px;">
    <div class="section_overlay">
        <!--头部横栏-->
        <%@ include file="header.jsp"%>
    </div>
</header>

<section class="services" id="SERVICE">
    <section class="about_us_area" id="ABOUT">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="work-with   wow fadeInUp animated animated" style="visibility: visible; animation-name: fadeInUp;">
                        <h2>${news.title}</h2>
                        <img src="../../source/images/shape.png" alt="">
                    </div>
                    <p>分类:${news.module}  发布时间:${news.datetime}  发布者:${news.user}</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                ${news.content}
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="work-with   wow fadeInUp animated animated" style="visibility: visible; animation-name: fadeInUp;">
                        <h3>访问量：${news.pv}</h3>
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
<script src="../../source/js/logcheck.js"></script>
<script src="../../source/js/md5.js"></script>
</body>
</html>