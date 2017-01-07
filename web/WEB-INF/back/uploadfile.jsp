<%@ page import="cn.iotweb.model.Tag" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: WSL
  Date: 2016/10/26
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../../source/plugins/slider/css/styles.css" rel="stylesheet">
</head>
<body>
<!--头部导航栏及侧边栏-->
<%@ include file="slidebar.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">文件上传</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">文件上传</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label>标题</label>
                        <input class="form-control" id="id_sourcename"/>
                    </div>
                    <div class="form-group">
                        <label>分类</label>
                        <select class="form-control" id="id_stype">
                            <option>all</option>
                            <option>doc</option>
                            <option>video</option>
                            <option>code</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>发布时间</label>
                        <input class="form-control" type="datetime-local" id="id_uploadtime"
                               value="${oriDatetime}">
                    </div>
                    <div class="form-group">
                        <label>下载权限</label>
                        <select class="form-control" id="id_srole">
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea class="form-control" rows="3" id="id_sdescribe"></textarea>
                    </div>
                    <div class="form-group">
                        <label>关键词</label>
                        <!--show-->
                        <div class="well well-sm">
                            <ul class="nav nav-pills" id="id_tags">
                                <%
                                    Iterator<Tag> it = ((List<Tag>) request.getAttribute("tags")).iterator();
                                    Tag first = it.next();
                                    if (null != first) {
                                        out.print("<li style='margin:2px' class='active' name='lan' value='" + first.getTagid() + "'><a>" + first.getTagname() + "</a></li>");
                                        while (it.hasNext()) {
                                            Tag tag = it.next();
                                            out.print("<li style='margin:3px' name='lan' value='" + tag.getTagid() + "'><a>" + tag.getTagname() + "</a></li>");
                                        }
                                    }
                                %>
                            </ul>
                            <br/>
                            <h3 style="display:inline;">您的选择：</h3>
                            <%
                                String content = first.getTagname();
                                String firststr = "<h3 id=\"showtag\" style=\"display:inline;margin:5px;\"><span class=\"label label-default\">" + content + "</span></h3>";
                                out.print(firststr);
                            %>
                        </div><!--well-->
                    </div>
                    <div class="form-group">
                        <label>选择文件</label>
                        <input class="btn btn-primary" type="file" name="fileToUpload" id="fileToUpload" multiple/>
                    </div>
                </div>
                <button class="btn btn-primary" id="submitInfo">提交</button>
                <button type="reset" class="btn btn-default">重置</button>
            </div>
        </div>
    </div>
</div>
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/js/ajaxupload.3.6.js/"></script>
<script>
    $("[name='lan']").click(function () {
        if ($(this).hasClass('active'))
            $(this).removeClass('active');
        else
            $(this).addClass('active');
        $("[id='showtag']").each(function () {
            $(this).remove();
        });
        var showhtml = "";
        $("[name='lan'][class='active']").each(function () {
            var tag = $(this).find('a').html();
            showhtml += '<h3 id="showtag" style="display:inline;margin:5px;"><span class="label label-default">' + tag + '</span></h3>';
        });
        $("h3:last").append(showhtml);
    });

    $("#submitInfo").click(function () {
        var filename = $('#fileToUpload').val();
        var sourcename = document.getElementById("id_sourcename").value;
        var uploadtime = document.getElementById("id_uploadtime").value;
        var srole = $("#id_srole option:selected").text();
        var sdescribe = document.getElementById("id_sdescribe").value;
        var stype = $("#id_stype option:selected").text();
        var tagstext = "";
        var tagids = "";
        $("[name='lan'][class='active']").each(function () {
            tagstext += $(this).find('a').html() + ";";
            tagids += $(this).val() + ";";
        });
        if ("" == filename || "" == sourcename || "" == uploadtime || "" == srole || "" == sdescribe || "" == stype || "" == tagstext) {
            alert("信息不完整，请完善信息");
            return;
        }
        if (document.getElementById("fileToUpload").files[0].size > 1073741824) {
            alert("文件过大，请限制在1G以内");
        }
        $.ajaxFileUpload({
            url: "uploadfiles",
            secureuri: false,
            fileElementId: 'fileToUpload',
            data: {
                sourcename: sourcename,
                uploadtime: uploadtime,
                srole: srole,
                sdescribe: sdescribe,
                stype: stype,
                tagstext: tagstext,
                tagids: tagids
            },
            dataType: "text",
            success: function (data) {
                alert(data);
            }
        });
    });
</script>
</body>
</html>

