<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
    //------------------------------------------------
    String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

    String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


    where += " AND issh='是' "; // 设置必须审核才可以显示


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


    if (request.getParameter("bianhao") != null && !"".equals(request.getParameter("bianhao"))) {
        where += " AND bianhao LIKE '%" + request.getParameter("bianhao") + "%'";
    }
    if (request.getParameter("biaoti") != null && !"".equals(request.getParameter("biaoti"))) {
        where += " AND biaoti LIKE '%" + request.getParameter("biaoti") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }
    List<HashMap> list = Query.make("luntanxinxi").where(where).order(orderby + " " + sort).page(15);

%>

<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet">
<script src="js/owl/owl.carousel.min.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner32">
        <div class="swiper-wrapper">
            <% for (HashMap bht : bhtList) { %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>"
                       style="background-image: url('<%= bht.get("image") %>'); height: 400px"></a>
                </div>
            </div>
            <% } %>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>


    <script>
        var mySwiper = new Swiper('#banner32', {
            loop: true, // 循环模式选项
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            },
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
            // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        })
    </script>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="luntanxinxilist.jsp">
                                More
                            </a>
                        </div>
                        <span>
                论坛列表            </span>
                    </div>
                    <div class="sn-content">


                        <div class="blog_carousel clearfix">
                            <div class="clearfix">
                                <% for (HashMap r : list) { %>
                                <div class="article-col" style="width: 25%">
                                    <article class="single_blog">
                                        <figure>
                                            <div class="blog_thumb">
                                                <a href="luntanxinxidetail.jsp?id=<%= r.get("id") %>"
                                                   class="img-box pb80 img-scale">
                                                    <div class="img"
                                                         style="background-image: url('<%= r.get("tupian") %>')">
                                                    </div>
                                                </a>
                                            </div>
                                            <figcaption class="blog_content">
                                                <h4 class="post_title">
                                                    <a href="luntanxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= Info.subStr(r.get("biaoti"), 20) %>
                                                    </a>
                                                </h4>
                                                <div class="articles_date">
                                                    <span><i class="fa fa-calendar"
                                                             aria-hidden="true"></i> <%= r.get("addtime") %></span>
                                                    <span v-if="vo.senduser"><i class="fa fa-user"
                                                                                aria-hidden="true"></i><%= r.get("faburen") %> </span>
                                                </div>
                                                <p class="post_desc">
                                                    <%= Info.subStr(r.get("neirong"), 45) %>
                                                </p>
                                                <a href="luntanxinxidetail.jsp?id=<%= r.get("id") %>" class="btn-see"> +
                                                    查看详情</a>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </div>
                                <% } %>
                            </div>

                            ${page.info}
                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>