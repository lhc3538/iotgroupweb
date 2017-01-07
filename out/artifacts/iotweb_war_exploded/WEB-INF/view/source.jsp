<%--<%@ page import="cn.iotweb.model.Tag" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.util.Iterator" %>--%>
<%--<%@ page import="cn.iotweb.model.Source" %>&lt;%&ndash;--%>
<%--Created by IntelliJ IDEA.--%>
<%--User: WSL--%>
<%--Date: 2016/10/23--%>
<%--Time: 11:07--%>
<%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="ch">--%>

<%--<head>--%>
<%--<meta charset="utf-8">--%>
<%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--<title>资源下载</title>--%>

<%--<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css">--%>

<%--<!-- Preloader -->--%>
<%--<link rel="stylesheet" href="../../source/css/preloader.css" type="text/css" media="screen, print"/>--%>

<%--<!-- Icon Font-->--%>
<%--<link rel="stylesheet" href="../../source/css/style_icon_font.css">--%>
<%--<link rel="stylesheet" href="../../source/css/owl.carousel.css">--%>
<%--<link rel="stylesheet" href="../../source/css/owl.theme.default.css">--%>
<%--<!-- Animate CSS-->--%>
<%--<link rel="stylesheet" href="../../source/css/animate.css">--%>

<%--<!-- Style -->--%>
<%--<link href="../../source/css/style.css" rel="stylesheet">--%>

<%--<!-- Responsive CSS -->--%>
<%--<link href="../../source/css/responsive.css" rel="stylesheet">--%>
<%--<!-- Bootstrap -->--%>
<%--<link href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">--%>

<%--</head>--%>


<%--<body>--%>
<%--<!-- Preloader -->--%>
<%--<div id="preloader">--%>
<%--<div id="status">&nbsp;</div>--%>
<%--</div>--%>
<%--<!--top-->--%>
<%--<header id="HOME" style="background-position: 50% -125px;">--%>
<%--<div class="section_overlay">--%>
<%--<!--头部横栏-->--%>
<%--<%@ include file="header.jsp"%>--%>
<%--</div>--%>
<%--</header>--%>
<%--<!--top-->--%>

<%--<section class="services" id="SERVICE">--%>
<%--<section class="about_us_area" id="ABOUT">--%>
<%--<div class="container">--%>
<%--<div class="row clearfix">--%>
<%--<div class="col-md-3 column well well-lg">--%>
<%--<img width="200px" height="200px"--%>
<%--src="http://news.sciencenet.cn/upload/news/images/2016/3/20163143683780.jpg"--%>
<%--class="img-circle center-block"/>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<div class="list-group">--%>
<%--<a href="#" class="list-group-item active">--%>
<%--<h4 class="list-group-item-heading">--%>
<%--下载排行--%>
<%--</h4>--%>
<%--</a>--%>
<%--<div id="downloadorder">--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="list-group">--%>
<%--<a href="#" class="list-group-item active">--%>
<%--<h4 class="list-group-item-heading">--%>
<%--最近发布--%>
<%--</h4>--%>
<%--</a>--%>
<%--<div id="timeorder">--%>

<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-9 column">--%>
<%--<!--show-->--%>
<%--<div class="well well-sm">--%>
<%--<ul class="nav nav-pills" id="id_tags">--%>
<%--<%--%>
<%--Iterator<Tag> it = ((List<Tag>) request.getAttribute("tags")).iterator();--%>
<%--Tag first = it.next();--%>
<%--if (null != first) {--%>
<%--out.print("<li style='margin:5px' class='active' name='lan' value='" + first.getTagid() + "'><a>" + first.getTagname() + "</a></li>");--%>
<%--while (it.hasNext()) {--%>
<%--Tag tag = it.next();--%>
<%--out.print("<li style='margin:5px' name='lan' value='" + tag.getTagid() + "'><a>" + tag.getTagname() + "</a></li>");--%>
<%--}--%>
<%--}--%>
<%--%>--%>
<%--</ul>--%>
<%--<br/>--%>
<%--<h3 style="display:inline;">您的选择：</h3>--%>
<%--<%--%>
<%--String content = first.getTagname();--%>
<%--String firststr = "<h3 id=\"showtag\" style=\"display:inline;margin:5px;\"><span class=\"label label-default\">" + content + "</span></h3>";--%>
<%--out.print(firststr);--%>
<%--%>--%>
<%--</div><!--well-->--%>
<%--<div class="input-group" style="margin-top:8px;width:30%;float:right;">--%>
<%--<input id="searchSourceInput" type="text" class="form-control"/>--%>
<%--<span class="input-group-btn">--%>
<%--<button class="btn btn-default" id="bt_searchSource">搜索</button>--%>
<%--</span>--%>
<%--</div>--%>
<%--<div class="tabbable" id="tabs-807325">--%>
<%--<ul class="nav nav-tabs">--%>
<%--<li name="mysourcetype" value="all" class="active">--%>
<%--<a href="#alltab" data-toggle="tab">综合</a>--%>
<%--</li>--%>
<%--<li name="mysourcetype" value="doc">--%>
<%--<a href="#doctab" data-toggle="tab">文档</a>--%>
<%--</li>--%>
<%--<li name="mysourcetype" value="video">--%>
<%--<a href="#videotab" data-toggle="tab">视频</a>--%>
<%--</li>--%>
<%--<li name="mysourcetype" value="code">--%>
<%--<a href="#codetab" data-toggle="tab">工程源码</a>--%>
<%--</li>--%>
<%--</ul>--%>
<%--<div class="tab-content">--%>
<%--<%--%>
<%--List<Source> list = (List<Source>) request.getAttribute("sources");--%>
<%--if (null != list) {--%>
<%--out.print("<div class=\"tab-pane active\" id=\"alltab\">");--%>
<%--out.print("<div class=\"well\">");--%>
<%--if (list.size() == 0) {--%>
<%--out.print("未找到相关记录");--%>
<%--} else {--%>
<%--String space = "&nbsp;&nbsp;&nbsp;&nbsp;";--%>
<%--for (Source source : list) {--%>
<%--out.print("<ul class=\"list-group\">");--%>
<%--out.print("<li class=\"list-group-item\">标题：" + source.getSourcename() + "</li>");--%>
<%--out.print("<li class=\"list-group-item\">语言: " + source.getTagstext() + space +--%>
<%--"上传者: " + source.getAuthor() + space + "上传时间: " + source.getUploadtime() + space + "下载等级： " + source.getSrole() + "</li>");--%>
<%--out.print("<li class=\"list-group-item\">简介：" + source.getSdescribe() + "</li>");--%>
<%--out.print("<li class=\"list-group-item\">下载链接：<a href=\"/download?sourceid=" + source.getSourceid() + "\">" + source.getSourcename() + "</a></li>");--%>
<%--out.print("</ul>");--%>
<%--}--%>
<%--}--%>
<%--out.print("</div>");--%>
<%--out.print("</div>");--%>
<%--}--%>
<%--%>--%>
<%--<div class="tab-pane" id="doctab">--%>
<%--</div>--%>
<%--<div class="tab-pane" id="videotab">--%>
<%--</div>--%>
<%--<div class="tab-pane" id="codetab">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</section>--%>
<%--</section>--%>

<%--<!--底部栏-->--%>
<%--<%@ include file="footer.jsp"%>--%>

<%--<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>--%>
<%--<script src="http://cdn.bootcss.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>--%>
<%--<script src="../../source/js/source.js"></script>--%>
<%--<script src="../../source/js/md5.js"></script>--%>
<%--<script src="../../source/js/logcheck.js"></script>--%>
<%--<script src="../../source/js/jquery.nicescroll.js"></script>--%>
<%--<script src="../../source/js/owl.carousel.js"></script>--%>
<%--<script src="../../source/js/wow.js"></script>--%>
<%--<script src="../../source/js/script.js"></script>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page import="cn.iotweb.model.Tag" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="cn.iotweb.model.Source" %><%--
  Created by IntelliJ IDEA.
  User: WSL
  Date: 2016/10/23
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta tagname="viewport" content="width=device-width, initial-scale=1">
    <title>资料</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <style>
        li {
            overflow: auto;
            word-break: break-all;
        }
    </style>

</head>
<!--body-->
<body>
<%@ include file="header.jsp" %>
<br><br><br>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-3 column well well-lg">
            <img width="200px" height="200px"
                 src="http://news.sciencenet.cn/upload/news/images/2016/3/20163143683780.jpg"
                 class="img-circle center-block"/>
            <br/>
            <br/>
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    <h4 class="list-group-item-heading">
                        下载排行
                    </h4>
                </a>
                <div id="downloadorder">
                </div>
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    <h4 class="list-group-item-heading">
                        最近发布
                    </h4>
                </a>
                <div id="timeorder">

                </div>
            </div>
        </div>
        <div class="col-md-9 column">
            <!--show-->
            <div class="well well-sm">
                <ul class="nav nav-pills" id="id_tags">
                    <%
                        Iterator<Tag> it = ((List<Tag>) request.getAttribute("tags")).iterator();
                        Tag first = it.next();
                        if (null != first) {
                            out.print("<li style='margin:5px' class='active' name='lan' value='" + first.getTagid() + "'><a>" + first.getTagname() + "</a></li>");
                            while (it.hasNext()) {
                                Tag tag = it.next();
                                out.print("<li style='margin:5px' name='lan' value='" + tag.getTagid() + "'><a>" + tag.getTagname() + "</a></li>");
                            }
                        }
                    %>
                </ul>
                <br/>
                <h3 style="overflow:auto;word-break:break-all;display:inline;">您的选择：</h3>
                <%
                    String content = first.getTagname();
                    String firststr = "<h3 id=\"showtag\" style=\"overflow:auto;word-break:break-all;display:inline;margin:5px;\"><span class=\"label label-default\">" + content + "</span></h3>";
                    out.print(firststr);
                %>
            </div><!--well-->
            <div class="input-group" style="margin-top:8px;width:30%;float:right;">
                <input id="searchSourceInput" type="text" class="form-control"/>
                <span class="input-group-btn">
                     <button class="btn btn-default" id="bt_searchSource">搜索</button>
                </span>
            </div>
            <div class="tabbable" id="tabs-807325">
                <ul class="nav nav-tabs">
                    <li name="sourcetype" value="all" class="active">
                        <a href="#alltab" data-toggle="tab">综合</a>
                    </li>
                    <li name="sourcetype" value="doc">
                        <a href="#doctab" data-toggle="tab">文档</a>
                    </li>
                    <li name="sourcetype" value="video">
                        <a href="#videotab" data-toggle="tab">视频</a>
                    </li>
                    <li name="sourcetype" value="code">
                        <a href="#codetab" data-toggle="tab">工程源码</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <%
                        List<Source> list = (List<Source>) request.getAttribute("sources");
                        if (null != list) {
                            out.print("<div class=\"tab-pane active\" id=\"alltab\">");
                            out.print("<div class=\"well\">");
                            if (list.size() == 0) {
                                out.print("未找到相关记录");
                            } else {
                                String space = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                                for (Source source : list) {
                                    out.print("<ul class=\"list-group\">");
                                    out.print("<li class=\"list-group-item\">标题：" + source.getSourcename() + "</li>");
                                    out.print("<li class=\"list-group-item\">语言: " + source.getTagstext() + space +
                                            "上传者: " + source.getAuthor() + space + "上传时间: " + source.getUploadtime() + space + "下载等级： " + source.getSrole() + "</li>");
                                    out.print("<li class=\"list-group-item\">简介：" + source.getSdescribe() + "</li>");
                                    out.print("<li class=\"list-group-item\">下载链接：<a href=\"/download?sourceid=" + source.getSourceid() + "\">" + source.getSourcename() + "</a></li>");
                                    out.print("</ul>");
                                }
                            }
                            out.print("</div>");
                            out.print("</div>");
                        }
                    %>
                    <div class="tab-pane" id="doctab">
                    </div>
                    <div class="tab-pane" id="videotab">
                    </div>
                    <div class="tab-pane" id="codetab">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr/>
    <footer style="float:right">
        <p>@SDUST IOT TEAM</p>
    </footer>
</div>
</body>
<!--body-->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/js/source.js"></script>
<script src="../../source/js/md5.js"></script>
<script src="../../source/js/logcheck.js"></script>
</html>
