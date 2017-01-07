<%@ page import="cn.iotweb.model.User" %><%--
  Created by IntelliJ IDEA.
  User: WSL
  Date: 2016/11/9
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="navbar-brand" style="float:right"><span class="glyphicon glyphicon-user"></span> ${uname} </div>
        </div>
    </div>
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <ul class="nav menu">
        <li class="parent" class="active">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 页面 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a class="" href="#">
                        <span class="glyphicon glyphicon-th-large"></span> 主页信息
                    </a>
                </li>
                <li>
                    <a class="" href="/back/addsubpage">
                        <span class="glyphicon glyphicon-th-large"></span> 自由页面添加
                    </a>
                </li>
                <li>
                    <a class="" href="/back/managesubpage?pageid=1">
                        <span class="glyphicon glyphicon-th-large"></span> 自由页面管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent" class="active">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 新闻 <span data-toggle="collapse" href="#sub-item-2" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-2">
                <li>
                    <a class="" href="/back/addnews">
                        <span class="glyphicon glyphicon-th-large"></span> 新闻发布
                    </a>
                </li>
                <li>
                    <a class="" href="/back/managenews?pageid=1">
                        <span class="glyphicon glyphicon-th-large"></span> 新闻管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent" class="active">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 作品 <span data-toggle="collapse" href="#sub-item-3" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-3">
                <li>
                    <a class="" href="/back/addshowpro">
                        <span class="glyphicon glyphicon-th-large"></span> 作品发布
                    </a>
                </li>
                <li>
                    <a class="" href="#">
                        <span class="glyphicon glyphicon-th-large"></span> 作品管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="parent" class="active">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 资源 <span data-toggle="collapse" href="#sub-item-4" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-4">
                <li>
                    <a class="" href="/back/uploadfile">
                        <span class="glyphicon glyphicon-th-large"></span> 资源发布
                    </a>
                </li>
                <li>
                    <a class="" href="/back/managesource">
                        <span class="glyphicon glyphicon-th-large"></span> 资源管理
                    </a>
                </li>
            </ul>
        </li>
        </li>
        <li class="parent" class="active">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 用户 <span data-toggle="collapse" href="#sub-item-5" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-5">
                <li>
                    <a class="" href="/register">
                        <span class="glyphicon glyphicon-th-large"></span> 添加用户
                    </a>
                </li>
                <li>
                    <a class="" href="/back/manageuser">
                        <span class="glyphicon glyphicon-th-large"></span> 用户管理
                    </a>
                </li>
                <li>
                    <a class="" href="/back/showfeedback">
                        <span class="glyphicon glyphicon-th-large"></span> 用户反馈
                    </a>
                </li>
            </ul>
        </li>
        <li role="presentation" class="divider"></li>
        <li><a href="#"><span class="glyphicon glyphicon-remove-sign"></span> 退出登录</a></li>
    </ul>
</div>