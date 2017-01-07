<%--
  Created by IntelliJ IDEA.
  User: wsx
  Date: 2016/10/19
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="cn.iotweb.model.FeedBack" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Title</title>
    <link href="../../source/plugins/editor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../../source/plugins/slider/css/add-ons.min.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/styles.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/ion.rangeSlider.css" rel="stylesheet" >
    <link href="../../source/plugins/slider/css/ion.rangeSlider.skinNice.css" rel="stylesheet" >
    <style type="text/css">
        li {
            overflow: auto;
            word-break: break-all;
        }
    </style>
</head>
<body>
<!--头部导航栏及侧边栏-->
<%@ include file="slidebar.jsp"%>


<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">反馈</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">用户反馈</div>
                <div class="panel-body">
                    <%
                        Iterator<FeedBack> it = ((List<FeedBack>) request.getAttribute("feedbacklist")).iterator();
                        while(it.hasNext()){
                            FeedBack first = it.next();
                            out.print("<div value=\""+first.getId()+"\" class=\"form-group\">");
                            out.print("<ul class=\"list-group\">");
                            out.print("<li class=\"list-group-item\"><span style=\"font-weight: bold;font-size: 20px\">反馈者：</span>"+first.getName()+"<button type=\"button\" class=\"btn btn-default\" value=\"" + first.getId() + "\"name=\"delfb\" style=\"float:right\">删除</button>"+"</li>");
                            out.print("<li class=\"list-group-item\"><span style=\"font-weight: bold;font-size: 20px\">反馈者邮箱：</span>"+first.getEmail()+"</li>");
                            out.print("<li class=\"list-group-item\"><span style=\"font-weight: bold;font-size: 20px\">反馈主题：</span>"+first.getSubject()+"</li>");
                            out.print("<li class=\"list-group-item\"><span style=\"font-weight: bold;font-size: 20px\">反馈内容：</span>"+first.getContent()+"</li>");
                            out.print("</ul></div>");
                        }
                    %>
                </div>
            </div>
        </div><!-- /.col-->
    </div><!-- /.row -->

</div>
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- JQUERY-->
<script src="../../source/plugins/editor/js/jquery/jquery-2.0.3.min.js"></script>
<!-- BOOTSTRAP -->
<script src="../../source/plugins/editor/bootstrap-dist/js/bootstrap.min.js"></script>
<!-- BOOTSTRAP WYSIWYG-->
<script type="text/javascript" src="../../source/plugins/editor/js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
<script type="text/javascript" src="../../source/plugins/editor/js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
<!-- CUSTOM SCRIPT-->
<script src="../../source/plugins/editor/js/script.js"></script>
<script src="../../source/js/showfeedback.js"></script>
</body>
</html>
