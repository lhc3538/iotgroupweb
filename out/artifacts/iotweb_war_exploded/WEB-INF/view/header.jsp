<%--
  Created by IntelliJ IDEA.
  User: lhc35
  Date: 2016/11/13
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="../../source/images/logo.png" alt=""></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/#HOME">主页</a></li>
                <li><a href="/#SERVICE">新闻资讯</a></li>
                <li><a href="/#DIRECTION">学习方向</a></li>
                <li><a href="/#WORK">作品展示</a></li>
                <li><a href="source">资料下载</a></li>
                <li><a href="register">注册</a></li>
                <li><a data-toggle="modal" data-target="<%out.print(request.getAttribute("info"));%>">
                    <%out.print(request.getAttribute("uname"));%></a></li>
                <li></li>
                <%
                    //未登录
                    if (!"登录".equals(request.getAttribute("uname"))) {
                        out.print("<li><a href=\"logout\">退出</a></li>");
                    }
                %>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container -->
</nav>


<!-- 登录表单 -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="login" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">登录</h4>
            </div>
            <div accept-charset="utf-8" class="form-horizontal">
                <div class="modal-body">

                    <div class="form-group">
                        <label for="id_uid" class="col-sm-4 control-label">用户名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="id_uid" placeholder="" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="id_password" class="col-sm-4 control-label">密码:</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="id_password" placeholder="" minlength="6"
                                   maxlength="20" required="">
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <input type="button" class="btn btn-warning" id="id_reset" value="重置"/>
                    <button class="btn btn-primary" id="id_login">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 登录表单 -->
