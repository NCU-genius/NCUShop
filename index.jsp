<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link href="js/owl/owl.carousel.min.css" rel="stylesheet">
<script src="js/owl/owl.carousel.min.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner44">
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
        var mySwiper = new Swiper('#banner44', {
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
                            <a href="dianpuxinxilist.jsp">
                                更多
                            </a>
                        </div>
                        <span>
                店铺信息            </span>
                    </div>
                    <div class="sn-content">


                        <div class="module-products clearfix">
                            <% ArrayList<HashMap> dianpuxinxilist48 = Query.make("dianpuxinxi").limit(4).order("id desc").select(); %>
                            <div class="products clearfix">
                                <% for (HashMap r : dianpuxinxilist48) { %>
                                <div class="products-col" style="width: 25%">
                                    <article>
                                        <a href="dianpuxinxidetail.jsp?id=<%= r.get("id") %>"
                                           class="pro-btn pro-btn-add">
                                            查看
                                        </a>
                                        <div class="figure-grid">
                                            <div class="image">
                                                <div class="img-box pb100 img-scale">
                                                    <a class="img" href="dianpuxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       style="background-image: url('<%= r.get("dianpulogo") %>')"></a>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h2 class="title h4">
                                                    <a href="dianpuxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("dianpumingcheng") %>
                                                    </a>
                                                </h2>
                                                <span class="description clearfix">
                                <%= Info.subStr(r.get("dianpujieshao"), 12) %>
                            </span>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">


            <div class="col-sm-4 col-md-4">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="shangpinxinxilist.jsp">
                                更多
                            </a>
                        </div>
                        <span>
                数码商品            </span>
                    </div>
                    <div class="sn-content">


                        <div class="module-products clearfix">
                            <% ArrayList<HashMap> shangpinxinxilist53 = Query.make("shangpinxinxi").where("fenlei" , "1").where("issh", "是").limit(4).order("id desc").select(); %>
                            <div class="products clearfix">
                                <% for (HashMap r : shangpinxinxilist53) { %>
                                <div class="products-col" style="width: 50%">
                                    <article>
                                        <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                           class="pro-btn pro-btn-add">
                                            查看
                                        </a>
                                        <div class="figure-grid">
                                            <div class="image">
                                                <div class="img-box pb100 img-scale">
                                                    <a class="img" href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       style="background-image: url('<%= Info.images(r.get("shangpintupian")) %>')"></a>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h2 class="title h4">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("dianpumingcheng") %>
                                                    </a>
                                                </h2>
                                                <sup>￥ <%= r.get("shangpinjiage") %>
                                                </sup>
                                                <span class="description clearfix">
                                <%= Info.subStr(r.get("shangpinxiaoliang"), 12) %>
                            </span>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                </div>


            </div>
            <div class="col-sm-4 col-md-4">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="shangpinxinxilist.jsp">
                                更多
                            </a>
                        </div>
                        <span>
                家具商品            </span>
                    </div>
                    <div class="sn-content">


                        <div class="module-products clearfix">
                            <% ArrayList<HashMap> shangpinxinxilist56 = Query.make("shangpinxinxi").where("fenlei" , "2").where("issh", "是").limit(4).order("id desc").select(); %>
                            <div class="products clearfix">
                                <% for (HashMap r : shangpinxinxilist56) { %>
                                <div class="products-col" style="width: 50%">
                                    <article>
                                        <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                           class="pro-btn pro-btn-add">
                                            查看
                                        </a>
                                        <div class="figure-grid">
                                            <div class="image">
                                                <div class="img-box pb100 img-scale">
                                                    <a class="img" href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       style="background-image: url('<%= Info.images(r.get("shangpintupian")) %>')"></a>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h2 class="title h4">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("shangpinmingcheng") %>
                                                    </a>
                                                </h2>
                                                <sup>￥ <%= r.get("shangpinjiage") %>
                                                </sup>
                                                <span class="description clearfix">
                                <%= Info.subStr(r.get("shangpinxiaoliang"), 12) %>
                            </span>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                </div>


            </div>
            <div class="col-sm-4 col-md-4">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="shangpinxinxilist.jsp">
                                更多
                            </a>
                        </div>
                        <span>
                零食/食品            </span>
                    </div>
                    <div class="sn-content">


                        <div class="module-products clearfix">
                            <% ArrayList<HashMap> shangpinxinxilist59 = Query.make("shangpinxinxi").where("fenlei" , "3").where("issh", "是").limit(4).order("id desc").select(); %>
                            <div class="products clearfix">
                                <% for (HashMap r : shangpinxinxilist59) { %>
                                <div class="products-col" style="width: 50%">
                                    <article>
                                        <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                           class="pro-btn pro-btn-add">
                                            查看
                                        </a>
                                        <div class="figure-grid">
                                            <div class="image">
                                                <div class="img-box pb100 img-scale">
                                                    <a class="img" href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>"
                                                       style="background-image: url('<%= Info.images(r.get("shangpintupian")) %>')"></a>
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h2 class="title h4">
                                                    <a href="shangpinxinxidetail.jsp?id=<%= r.get("id") %>">
                                                        <%= r.get("shangpinmingcheng") %>
                                                    </a>
                                                </h2>
                                                <sup>￥ <%= r.get("shangpinjiage") %>
                                                </sup>
                                                <span class="description clearfix">
                                <%= Info.subStr(r.get("shangpinxiaoliang"), 12) %>
                            </span>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <% } %>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="title-sn-title">
                    <div class="sn-title" :style="style">
                        <div class="more">
                            <a href="luntanxinxilist.jsp">
                                更多
                            </a>
                        </div>
                        <span>
                论坛信息            </span>
                    </div>
                    <div class="sn-content">


                        <div class="blog_carousel clearfix">
                            <% ArrayList<HashMap> luntanxinxilist64 = Query.make("luntanxinxi").where("issh", "是").limit(4).order("id desc").select(); %>
                            <div class="clearfix">
                                <% for (HashMap r : luntanxinxilist64) { %>
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

                        </div>



                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>