<%@ page import="org.springframework.http.HttpRequest" %><%--
  Created by IntelliJ IDEA.
  User: lhc35
  Date: 2016/10/19
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>新闻编辑</title>


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
            <li class="active">新闻</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">新闻发布</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>标题</label>
                        <input class="form-control" id="news_title" value="${news.title}">
                    </div>
                    <div class="form-group">
                        <label>分类</label>
                        <select class="form-control" id="news_module" value="${news.module}">
                            <option>业界新闻</option>
                            <option>动态公告</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>发布时间</label>
                        <input class="form-control" type="datetime-local" id="news_datetime" value="${news.datetime}">
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea class="form-control" rows="3" id="news_description" value="${news.description}"></textarea>
                    </div>
                    <div class="form-group">
                        <label>关键词</label>
                        <div class="input-group">
                            <input id="input_word" type="text" class="form-control input-md" placeholder="">
                            <span class="input-group-btn">
								<button class="btn btn-primary btn-md" onclick="addKeyword()">添加</button>
							</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="btn-group" id="div_key" >

                        </div>
                    </div>
                    <div class="form-group">
                        <label>内容</label>
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
                                    ${news.content}
                                </div>

                            </div>
                        </div>
                        <!-- /BOX -->
                    </div>
                    <div class="form-group">
                        <label>访问量</label>
                        <input class="form-control" type="number" value="${news.pv}" id="news_pv">
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

<script>
    jQuery(document).ready(function() {
        App.setPage("rich_text_editors");  //Set current page
        App.init(); //Initialise plugins and elements
    });
</script>
<!-- SLIDER
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/plugins/slider/js/ion.rangeSlider.min.js"></script>
<script src="../../source/plugins/slider/js/bootstrap-slider.js"></script>-->

<script>
    function dealSubmit() {
        var id = ${news.id};
        var title = document.getElementById("news_title").value;
        var module = document.getElementById("news_module").value;
        var datetime = document.getElementById("news_datetime").value;
        var description = document.getElementById("news_description").value;
        var keyword = allword.getAll();
        var content = document.getElementById("editor").innerHTML;
        var pv = document.getElementById("news_pv").value;
        var user = "${uname}";
        $.post("/back/addnews", {
                "id" : id,
                "title": title,
                "module": module,
                "datetime": datetime,
                "description": description,
                "keyword": keyword,
                "content": content,
                "pv": pv,
                "user": user
            }, function (data) {
                alert(data);
            }
        );
//        $.post("/back/addnews",{"name":"lala","color":"red"});
    }
</script>
<script>
    //给array增加获得所有内容的方法
    Array.prototype.getAll = function() {
        var all;
        for(var i=0; i<this.length; i++) {
            if (i == 0)
                all=this[i];
            else
                all+=(","+this[i]);
        }
        return all;
    }
    //给array增加删除指定值的方法
    Array.prototype.removeByValue = function(val) {
        for(var i=0; i<this.length; i++) {
            if(this[i] == val) {
                this.splice(i, 1);
                break;
            }
        }
    }
    //为array增加判断有无指定值的方法。
    Array.prototype.hasSame=function(str){
        var s = this.join("$%") ;//将数组中每个项用$%连接成字符串。注意$%可以自己定义，但是必须是数组数据中不包含的。否则出现问题。
        if(s.indexOf(str)!=-1)//判断字符串中是否包含此str如果包含则表示存在，否则表示不存在。
            return true;
        else
            return false;
    }
    var allword=new Array();
    //在页面上添加关键词
    function addKeyword() {
        var input_word = document.getElementById("input_word");
        var word = $.trim(input_word.value);
        if (word != "" && allword.hasSame(word) == false) {
            allword.push(word);
            input_word.value = "";
        }
        repaintKey();
    }
    //删除页面上的某个关键词
    function removeKeyword(ele) {
        allword.removeByValue(ele);
        repaintKey();
    }
    //重画页面上的关键词
    function repaintKey() {
        document.getElementById("div_key").innerHTML = "";
        allword.forEach(function (ele) {
            document.getElementById("div_key").innerHTML+=
                    "<a class=\"btn btn-default\">"+ele+" <i class=\"fa fa-times\" onclick=\"removeKeyword(\'"+ele+"\')\"></i></a>";
        });
    }
</script>
<!-- /JAVASCRIPTS -->

</body>
</html>
