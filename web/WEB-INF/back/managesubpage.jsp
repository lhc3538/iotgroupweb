<%@ page import="cn.iotweb.model.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="cn.iotweb.model.SubPage" %><%--
  Created by IntelliJ IDEA.
  User: lhc35
  Date: 2016/10/19
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Title</title>


    <!--<link href="../../source/plugins/editor/css/cloud-admin.css" rel="stylesheet" type="text/css" >
   -->
    <link href="../../source/plugins/editor/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../../source/plugins/slider/css/add-ons.min.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/styles.css" rel="stylesheet">
    <link href="../../source/plugins/slider/css/ion.rangeSlider.css" rel="stylesheet" >
    <link href="../../source/plugins/slider/css/ion.rangeSlider.skinNice.css" rel="stylesheet" >
    <link href="../../source/css/bootstrap-table.css" rel="stylesheet">
</head>
<body>
<!--头部导航栏及侧边栏-->
<%@ include file="slidebar.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">自由页面管理</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">自由页面列表</div>
                <div class="panel-body">
                    <table data-toggle="table" >
                        <thead>
                        <tr>
                            <th>
                                <div class="th-inner sortable">ID</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th>
                                <div class="th-inner sortable">标题</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th>
                                <div class="th-inner sortable">日期</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th>
                                <div class="th-inner sortable">操作</div>
                                <div class="fht-cell"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<SubPage> arraySubPage = (ArrayList<SubPage>)request.getAttribute("list");
                            if (arraySubPage.size() > 0) {
                                Iterator<SubPage> itSubPage = (arraySubPage.iterator());
                                do {
                                    SubPage subPage = itSubPage.next();
                                    if (subPage!=null) {
                                        out.println("<tr>" +
                                                "<td>"+subPage.getId()+"</td>" +
                                                "<td>"+subPage.getTitle()+"</td>" +
                                                "<td>"+subPage.getDatetime()+"</td>" +
                                                "<td>" +
                                                "<button class=\"btn btn-default\" onclick=\"editNews("+subPage.getId()+")\"><i class=\"glyphicon glyphicon-pencil\"></i></button>" +
                                                "<button class=\"btn btn-default\" onclick=\"deleteNews(" + subPage.getId() +")\"><i class=\"glyphicon glyphicon-trash\"></i>" +
                                                "</button>" +
                                                "</td>" +
                                                "</tr>");
                                    }
                                }while (itSubPage.hasNext());
                            }
                        %>
                        </tbody>
                    </table>
                    <div class="fixed-table-pagination">
                        <div class="col-md-12 text-center">
                            <ul class="pagination">
                                <li class="page-pre">
                                    <a href="?pageid=${pageid-1}">&lt;</a>
                                </li>
                                <li class="page-number active disabled">
                                    <a id="page-id">${pageid}</a>
                                </li>
                                <li class="page-next">
                                    <a href="?pageid=${pageid+1}">&gt;</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
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
<script src="../../source/js/bootstrap-table.js"></script>
<!-- SLIDER
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>-->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="../../source/plugins/slider/js/ion.rangeSlider.min.js"></script>
<script src="../../source/plugins/slider/js/bootstrap-slider.js"></script>
<script>
    function editNews(id) {
        window.open("/back/editsubpage?id="+id);
    }
    function deleteNews(id) {
        $.post("/back/deletesubpage",{
            "id" : id
        },function (data) {
            if (data == "success")
                window.location.reload();
            else
                alert(data);
        })

    }
</script>
<!-- /JAVASCRIPTS -->

</body>
</html>
