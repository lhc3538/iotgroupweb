<%@ page import="cn.iotweb.model.ShowPro" %><%--
  Created by IntelliJ IDEA.
  User: wsx
  Date: 2016/10/31
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
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

    <link rel="stylesheet" href="../../source/markdown/css/style.css" />
    <link rel="stylesheet" href="../../source/markdown/css/editormd.preview.css" />
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
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
                        <%
                            ShowPro sp =(ShowPro) request.getAttribute("pro");
                            out.print("<h2>"+sp.getPname()+"</h2>");
                        %>
                        <img src="../../source/images/shape.png" alt="">
                    </div>
                    <%
                        out.print("<p>"+sp.getPhonor()+"</p>");
                    %>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div style="text-align: center;">
                <%
                    out.print("<img src=\""+sp.getPimg()+"\">");
                %>
                </div>
            </div>
        </div>
        <div id="layout">
            <div id="test-editormd-view">
                <textarea id="append-test" style="display:none;"><%out.print(sp.getPinfo());%></textarea>
            </div>
        </div>

        <%--<div class="container">--%>
            <%--<div class="row">--%>
                <%--<div class="col-md-12 text-center">--%>
                    <%--<div class="work-with   wow fadeInUp animated animated" style="visibility: visible; animation-name: fadeInUp;">--%>

                        <%--<%--%>
                            <%--out.print("<h2 style=\"text-align:left;text-indent: 2em;\">"+sp.getPinfo()+"</h2>");--%>
                        <%--%>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </section>
</section>

<!--底部栏-->
<%@ include file="footer.jsp"%>

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="../../source/markdown/lib/marked.min.js"></script>
<script src="../../source/markdown/lib/prettify.min.js"></script>

<script src="../../source/markdown/lib/raphael.min.js"></script>
<script src="../../source/markdown/lib/underscore.min.js"></script>
<script src="../../source/markdown/lib/sequence-diagram.min.js"></script>
<script src="../../source/markdown/lib/flowchart.min.js"></script>
<script src="../../source/markdown/lib/jquery.flowchart.min.js"></script>

<script src="../../source/markdown/editormd.js"></script>
<script type="text/javascript">
    $(function() {
        var testEditormdView;
        testEditormdView2 = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            tocm            : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
            tocDropdown          : true,
        });
    });
    //alert(<%sp.getPinfo();%>);
    //$('#append-test').text(str);
</script>


<script src="http://cdn.bootcss.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="../../source/js/jquery.nicescroll.js"></script>
<script src="../../source/js/owl.carousel.js"></script>
<script src="../../source/js/wow.js"></script>
<script src="../../source/js/script.js"></script>
<script src="../../source/js/regcheck.js"></script>
<script src="../../source/js/logcheck.js"></script>
<script src="../../source/js/md5.js"></script>

</body>
</html>
