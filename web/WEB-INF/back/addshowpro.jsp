<%--
  Created by IntelliJ IDEA.
  User: wsx
  Date: 2016/11/1
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>
<!--头部导航栏及侧边栏-->
<%@ include file="slidebar.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">新闻</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">添加要显示的工程</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>标题</label>
                        <input class="form-control" id="pname">
                    </div>
                    <div class="form-group">
                        <label>获得荣誉</label>
                        <input class="form-control" id="phonor">
                    </div>
                    <div class="form-group">
                        <label>显示在主界面位置（注意0表示不显示）</label>
                        <select class="form-control" id="prank">
                            <option selected></option>
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>上传图片（只可传一张）</label>
                        <input class="btn btn-info" type="file" name="pimg" id="pimg"/>
                    </div>
                    <div class="form-group">
                        <label>简介</label>
                        <textarea class="form-control" rows="6" id="pinfo"></textarea>
                    </div>
                    <button id="tijiao" class="btn btn-primary">提交</button>
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
<!-- CUSTOM SCRIPT-->
<script src="../../source/js/addshowpro.js"></script>
<script src="../../source/js/ajaxupload.3.6.js/"></script>


</body>
</html>

