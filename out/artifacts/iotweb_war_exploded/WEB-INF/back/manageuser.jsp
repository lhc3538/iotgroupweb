<%--
  Created by IntelliJ IDEA.
  User: WSL
  Date: 2016/11/13
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link href="../../source/plugins/editor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../../source/plugins/slider/css/add-ons.min.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/styles.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/ion.rangeSlider.skinNice.css" rel="stylesheet">
    <link href="../../source/css/bootstrap-table.css" rel="stylesheet">
</head>
<body>
<!--头部导航栏及侧边栏-->
<%@ include file="slidebar.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">用户管理</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">管理列表</div>
                <div class="panel-body">
                    <div>
                        <table id="TABLES" data-toggle="table" data-show-refresh="true" data-url="/back/getalluser"
                               data-show-toggle="true" data-show-columns="true" data-select-item-name="toolbar1"
                               data-pagination="true" data-sort-name="name" data-sort-order="desc">
                            <thead>
                            <tr>
                                <th data-field="uid" data-sortable="true">账号</th>
                                <th data-field="uemail" data-sortable="true">邮箱</th>
                                <th data-field="uname" data-sortable="true">姓名</th>
                                <th data-field="uclass" data-sortable="true">班级</th>
                                <th data-field="uphone" data-sortable="true">手机号</th>
                                <th data-field="urole" data-sortable="true">权限</th>
                                <th data-field="regtime" data-sortable="true">注册时间</th>
                                <th data-field="passwd" data-sortable="true">管理</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div>

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/js/bootstrap-table.js"></script>
<script type="text/javascript" src="../../source/plugins/editor/js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
<script type="text/javascript" src="../../source/plugins/editor/js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
<script src="../../source/plugins/editor/js/script.js"></script>
<script>
    function editUser(uid) {
        $.ajax({
            type: "POST",
            url: "/back/updateuser",
            data: {
                uid: uid
            },
            dataType: "text",
            success: function (data) {
                alert(data);
                if(data == "更新成功")
                    window.location.href='/back/manageuser';
            }
        });
    }
    function deleteUser(uid) {
        $.ajax({
            type: "POST",
            url: "/back/deleteuser",
            data: {
                uid: uid
            },
            dataType: "text",
            success: function (data) {
                alert(data);
                if(data == "删除成功")
                    window.location.href='/back/manageuser';
            }
        });
    }
</script>
</body>
</html>

