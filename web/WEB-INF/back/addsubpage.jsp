<%@ page import="org.springframework.http.HttpRequest" %>
<%--
  Created by IntelliJ IDEA.
  User: lhc35
  Date: 2016/10/19
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>自由页面编辑</title>


    <!--<link href="../../source/plugins/editor/css/cloud-admin.css" rel="stylesheet" type="text/css" >
   -->
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
            <li class="active">自由页面</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">自由页面编辑区</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>标题</label>
                        <input class="form-control" id="news_title" value="${subPage.title}">
                    </div>
                    <div class="form-group">
                        <label>改动时间</label>
                        <input class="form-control" type="datetime-local" id="news_datetime" value="${subPage.datetime}">
                    </div>
                    <div class="form-group">
                        <label>主体内容</label>
                        <!-- BOX -->
                        <div class="box border green">
                            <div class="box-body">
                                <div id="alerts"></div>
                                <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
                                    <div class="btn-group">
                                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                        </ul>
                                    </div>
                                    <div class="btn-group">
                                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                                            <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                                            <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                                        </ul>
                                    </div>
                                    <div class="btn-group">
                                        <a class="btn btn-default" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                                        <a class="btn btn-default" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                                        <a class="btn btn-default" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                                        <a class="btn btn-default" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                                    </div>
                                    <div class="btn-group">
                                        <a class="btn btn-default" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                                        <a class="btn btn-default" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                                        <a class="btn btn-default" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-outdent"></i></a>
                                        <a class="btn btn-default" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                                    </div>
                                    <div class="btn-group">
                                        <a class="btn btn-default" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                                        <a class="btn btn-default" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                                        <a class="btn btn-default" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                                        <a class="btn btn-default" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                                    </div>
                                    <div class="btn-group">
                                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                                        <div class="dropdown-menu input-append">
                                            <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                                            <button class="btn btn-default" type="button">Add</button>
                                        </div>
                                        <a class="btn btn-default" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-scissors"></i></a>

                                    </div>

                                    <div class="btn-group">
                                        <a class="btn btn-default" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                                        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                                    </div>
                                    <div class="btn-group">
                                        <a class="btn btn-default" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                                        <a class="btn btn-default" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                                    </div>
                                    <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
                                </div>

                                <div id="editor" class="info-box" >
                                    ${subPage.content}
                                </div>

                            </div>
                        </div>
                        <!-- /BOX -->
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="dealSubmit()">提交</button>
                    <button type="reset" class="btn btn-default">重置</button>
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
<!-- SLIDER
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/plugins/slider/js/ion.rangeSlider.min.js"></script>
<script src="../../source/plugins/slider/js/bootstrap-slider.js"></script>-->

<script>
    jQuery(document).ready(function() {
        App.setPage("rich_text_editors");  //Set current page
        App.init(); //Initialise plugins and elements
    });
</script>
<script>
    function dealSubmit() {
        var id = ${subPage.id};
        var title = document.getElementById("news_title").value;
        var datetime = document.getElementById("news_datetime").value;
        var content = document.getElementById("editor").innerHTML;
        var user = "${uname}";
        $.post("/back/addsubpage", {
                    "id" : id,
                    "title": title,
                    "datetime": datetime,
                    "content": content,
                    "user": user
                }, function (data) {
                    alert(data);
                }
        );
    }
</script>
<!-- /JAVASCRIPTS -->

</body>
</html>
