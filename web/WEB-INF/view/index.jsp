<%@ page import="cn.iotweb.model.News" %>
<%@ page import="cn.iotweb.model.Home" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="cn.iotweb.model.ShowPro" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ch">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>物联网兴趣小组</title>

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

            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="home_text wow fadeInUp animated">
                            <h2>物联网兴趣小组</h2>
                            <p>今天的努力是你明天成功的基石<br>交流群：460153163</p>
                            <img src="../../source/images/shape.png" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="scroll_down">
                            <a href="#SERVICE"><img src="../../source/images/scroll.png" alt=""></a>
                            <h4>Scroll Down</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</header>

<section class="services" id="SERVICE">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="single_service wow fadeInUp" data-wow-delay="1s">
                    <h2><i class="fa fa-newspaper-o"></i>  业界新闻 </h2>
                    <%
                        Iterator<News> itNews = ((Home)request.getAttribute("home")).getArrayListNews().iterator();
                        do {
                            News news = itNews.next();
                            if (news!=null) {
                                out.println("<p><a href=\"/shownews?id="+news.getId()+"\"> "+news.getTitle()+" </a><a href=\"/shownews?id=" + news.getId() + "\" class=\"pull-right\">"+news.getDatetime()+"</a></p>");
                            }
                        }while (itNews.hasNext());
                    %>
                    <a class="pull-right" href="shownewslist?pageid=1&module=业界新闻">more...</a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="single_service wow fadeInUp" data-wow-delay="2s">
                    <h2><i class="fa fa-calendar-o"></i>  动态公告</h2>
                    <%
                        Iterator<News> itBoard = ((Home)request.getAttribute("home")).getArrayListBoard().iterator();
                        do {
                            News news = itBoard.next();
                            if (news!=null) {
                                out.println("<p><a href=\"/shownews?id="+news.getId()+"\"> "+news.getTitle()+" </a><a href=\"/shownews?id=" + news.getId() + "\" class=\"pull-right\">"+news.getDatetime()+"</a></p>");
                            }
                        }while (itBoard.hasNext());
                    %>
                    <a class="pull-right" href="shownewslist?pageid=1&module=动态公告">more...</a>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="about_us_area" id="DIRECTION">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="about_title">
                    <h2>学习方向</h2>
                    <img src="../../source/images/shape.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="thumbnail content-thumbnail mv_float">
                    <img alt="" src="../../source/images/imac.png">

                    <div class="caption">
                        <h4>网站开发运维</h4>

                        <p>网站开发是制作一些专业性强的网站，比如说动态网页。ASP、PHP、JSP网页。而且网站开发一般是原创，网站制作可以用别人的模板。</p>
                        <a class="btn btn-danger" href="showsubpage?id=5">学习路线</a> <!--a class="btn btn-info" href="source">相关资源</a-->
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="thumbnail content-thumbnail mv_float">
                    <img alt="" src="../../source/images/imac.png">

                    <div class="caption">
                        <h4>Android方向</h4>

                        <p>“从这里开始”，教你Android应用开发的最基本的知识。如果你是一个Android应用开发的新手，你可以按照学习路线完成下面的课程。</p>
                        <a class="btn btn-danger" href="showsubpage?id=3">学习路线</a> <!--a class="btn btn-info" href="source">相关资源</a-->
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="thumbnail content-thumbnail mv_float">
                    <img alt="" src="../../source/images/imac.png">

                    <div class="caption">
                        <h4>linux嵌入式Qt编程方向</h4>

                        <p>Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。</p>
                        <a class="btn btn-danger" href="showsubpage?id=2">学习路线</a> <!--a class="btn btn-info" href="source">相关资源</a-->
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="thumbnail content-thumbnail mv_float">
                    <img alt="" src="../../source/images/imac.png">

                    <div class="caption">
                        <h4>单片机及其试验箱方向</h4>

                        <p>单片机又称单片微控制器,它不是完成某一个逻辑功能的芯片,而是把一个计算机系统集成到一个芯片上，相当于一个微型的计算机。</p>
                        <a class="btn btn-danger" href="showsubpage?id=4">学习路线</a> <!--a class="btn btn-info" href="source">相关资源</a-->
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="thumbnail content-thumbnail mv_float">
                    <img alt="" src="../../source/images/imac.png">

                    <div class="caption">
                        <h4>程序算法方向</h4>

                        <p>  算法（Algorithm）是指解题方案的准确而完整的描述，是一系列解决问题的清晰指令，算法代表着用系统的方法描述解决问题的策略机制。</p>
                        <a class="btn btn-danger" href="showsubpage?id=6">学习路线</a> <!--a class="btn btn-info" href="source">相关资源</a-->
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="thumbnail content-thumbnail mv_float">
                    <img alt="" src="../../source/images/imac.png">

                    <div class="caption">
                        <h4>网络安全方向</h4>
                        <p>欢迎加入山东科技大学网络安全小组交流群：545114264</p>
                        <a class="btn btn-danger">学习路线</a> <!--a class="btn btn-info" href="source">相关资源</a-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<section class="testimonial text-center wow fadeInUp animated" id="TESTIMONIAL">
    <%--<div class="container">--%>
        <%--<div class="icon">--%>
            <%--<i class="icon-quote"></i>--%>
        <%--</div>--%>
        <%--<div class="owl-carousel">--%>
            <%--<div class="single_testimonial text-center wow fadeInUp animated">--%>
                <%--<p>小组介绍一<br/> 介绍内容</p>--%>
                <%--<h4>-批注</h4>--%>
            <%--</div>--%>
            <%--<div class="single_testimonial text-center">--%>
                <%--<p>小组介绍一<br/> 介绍内容</p>--%>
                <%--<h4>-批注</h4>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</section>


<div class="fun_facts">
    <section class="header parallax home-parallax page" id="fun_facts" style="background-position: 50% -150px;">
        <div class="section_overlay">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 wow fadeInLeft animated">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="single_count">
                                    <i class="fa fa-cubes"></i>
                                    <h3>30</h3>
                                    <p>作品数量</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="single_count">
                                    <i class="fa fa-group"></i>
                                    <h3>20+</h3>
                                    <p>团队人数</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="single_count">
                                    <i class="fa fa-star"></i>
                                    <h3>12</h3>
                                    <p>获奖数量</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-md-offset-1 wow fadeInRight animated">
                        <div class="imac">
                            <img src="../../source/images/imac.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<section class="work_area" id="WORK">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="work_title  wow fadeInUp animated">
                    <h1>作品展示</h1>
                    <img src="../../source/images/shape.png" alt="">
                    <p>这里将为大家展示和分享一些比赛优秀作品和精美的课程设计， <br> 大家可以在学习借鉴这些优秀成果的基础上丰富和完善自己的作品。 </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <%
                Iterator<ShowPro> it = ((List<ShowPro>) request.getAttribute("prolist")).iterator();
                int i=0;
                while (it.hasNext() && i<3){
                    ShowPro first = it.next();
                    out.print("<div class=\"col-md-4 no_padding\">\n" +
                            "                <div class=\"single_image last_padding\">");
                    out.print(" <img src=\""+first.getPimg()+"\" alt=\"\">");
                    out.print("<div class=\"image_overlay\">");
                    out.print("<a href=\"/showpro?prank="+first.getPrank()+"\">View Full Project</a>");
                    out.print("<h2>"+first.getPname()+"</h2>");
                    out.print("<h4>"+first.getPhonor()+"</h4>");
                    out.print("</div></div></div>");
                    i++;
                }
            %>
        </div>
        <div class="row pad_top">
            <%
                while (it.hasNext()){
                    ShowPro first = it.next();
                    out.print("<div class=\"col-md-4 no_padding\">\n" +
                            "                <div class=\"single_image last_padding\">");
                    out.print(" <img src=\""+first.getPimg()+"\" alt=\"\">");
                    out.print("<div class=\"image_overlay\">");
                    out.print("<a href=\"/showpro?prank="+first.getPrank()+"\">View Full Project</a>");
                    out.print("<h2>"+first.getPname()+"</h2>");
                    out.print("<h4>"+first.getPhonor()+"</h4>");
                    out.print("</div></div></div>");
                }
            %>
        </div>
    </div>
</section>
<section class="call_to_action">
    <div class="container">
        <div class="row">
            <div class="col-md-8 wow fadeInLeft animated">
                <div class="left">
                    <h2>对物联网感兴趣吗?</h2>
                    <p>如果你对物联网很感兴趣，爱折腾、求进取那就加入我们吧。</p>
                </div>
            </div>
            <div class="col-md-3 col-md-offset-1 wow fadeInRight animated">
                <div class="baton">
                    <a href="/register" target="_blank">
                        <button type="button" class="btn btn-primary cs-btn">加入我们</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="contact" id="CONTACT">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="contact_title  wow fadeInUp animated">
                    <h1>联系我们</h1>
                    <img src="../../source/images/shape.png" alt="">
                    <p>有什么关于小组不懂的地方可以在这里留言<br/>我们会通过邮箱给予回复</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12  wow fadeInRight animated">
                <form class="contact-form" action="">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="name_fb" placeholder="Name">
                            <input type="email" class="form-control" id="email_fb" placeholder="Email">
                            <input type="text" class="form-control" id="subject_fb" placeholder="Subject">
                        </div>
                        <div class="col-md-6">
                            <textarea class="form-control" id="message_fb" rows="25" cols="10"
                                      placeholder="  Message Texts..." style="height: 104px"></textarea>
                            <button type="button" class="btn btn-default submit-btn form_submit" id="button_fb">SEND MESSAGE</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="work-with   wow fadeInUp animated">
                    <h3>looking forward to hearing from you!</h3>
                </div>
            </div>
        </div>
    </div>
</section>

<!--底部栏-->
<%@ include file="footer.jsp"%>

<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="../../source/js/jquery.nicescroll.js"></script>
<script src="../../source/js/owl.carousel.js"></script>
<script src="../../source/js/wow.js"></script>
<script src="../../source/js/script.js"></script>
<script src="../../source/js/logcheck.js"></script>
<script src="../../source/js/md5.js"></script>
<script src="../../source/js/index.js"></script>
<script src="../../source/js/feedback.js"></script>
</body>
</html>