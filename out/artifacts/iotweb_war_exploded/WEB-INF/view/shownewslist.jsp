<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.iotweb.model.News" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ch">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新闻列表</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <!-- Preloader -->
    <link rel="stylesheet" href="../../source/css/preloader.css" type="text/css" media="screen, print"/>

    <!-- Icon Font-->
    <link rel="stylesheet" href="../../source/css/style_icon_font.css">
    <link rel="stylesheet" href="../../source/css/owl.carousel.css">
    <link rel="stylesheet" href="../../source/css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="../../source/css/animate.css">

    <!-- Bootstrap -->
    <link href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">



    <!-- Style -->
    <link href="../../source/css/style.css" rel="stylesheet">
    <link href="../../source/css/bootstrap-table.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="../../source/css/responsive.css" rel="stylesheet">
</head>

<body>
<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>

<header id="HOME" style="background-position: 50% -125px;">
    <div class="section_overlay">
        <!--头部横栏-->
        <%@ include file="header.jsp"%>
    </div>
</header>

<section class="services" id="SERVICE">
    <section class="about_us_area" id="ABOUT">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">${module}列表</div>
                        <div class="panel-body">
                            <table data-toggle="table" data-url="/getallnewslist"  data-show-refresh="true"  data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                                <thead>
                                </thead>
                                <tbody>
                                <%
                                    ArrayList<News> arrayNews = (ArrayList<News>)request.getAttribute("list");
                                    if (arrayNews.size() > 0) {
                                        Iterator<News> itNews = (arrayNews.iterator());
                                        do {
                                            News news = itNews.next();
                                            if (news!=null) {
                                                out.println("<tr onclick=\"showDetail("+news.getId()+")\"><td>"+news.getTitle()+"</td><td align=\"right\">"+news.getDatetime()+"</td></tr>");
                                            }
                                        }while (itNews.hasNext());
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div><!--/.row-->
            <div class="fixed-table-pagination">
                <div class="col-md-12 text-center">
                    <ul class="pagination">
                        <li class="page-pre">
                            <a href="?pageid=${pageid-1}&module=${module}">&lt;</a>
                        </li>
                        <li class="page-number active disabled">
                            <a id="page-id">${pageid}</a>
                        </li>
                        <li class="page-next">
                            <a href="?pageid=${pageid+1}&module=${module}">&gt;</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</section>

<!--底部栏-->
<%@ include file="footer.jsp"%>

<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="../../source/js/jquery.nicescroll.js"></script>
<script src="../../source/js/owl.carousel.js"></script>
<script src="../../source/js/wow.js"></script>
<script src="../../source/js/script.js"></script>
<script src="../../source/js/regcheck.js"></script>
<script src="../../source/js/bootstrap-table.js"></script>
<script src="../../source/js/logcheck.js"></script>
<script src="../../source/js/md5.js"></script>
<script>
    function showDetail(index) {
        window.open("/shownews?id="+index);
    }
</script>

</body>
</html>