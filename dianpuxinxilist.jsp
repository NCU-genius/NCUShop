<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%
//------------------------------------------------
String orderby = util.Request.get("order" , "id");  // 获取搜索框中的排序字段、默认为发布时间
String sort  = util.Request.get("sort" , "desc");   // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误



// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中



             if(request.getParameter("dianpubianhao") != null && !"".equals( request.getParameter("dianpubianhao") )){ where+=" AND dianpubianhao LIKE '%"+request.getParameter("dianpubianhao")+"%'"; } 
                 if(request.getParameter("dianpumingcheng") != null && !"".equals( request.getParameter("dianpumingcheng") )){ where+=" AND dianpumingcheng LIKE '%"+request.getParameter("dianpumingcheng")+"%'"; } 
                        List<HashMap> list = Query.make("dianpuxinxi").where(where).order(orderby+" "+sort).page(15);

        %>

        <%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>


<div class="" style="" >

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>
    

<div class="swiper-container" id="banner16">
        <div class="swiper-wrapper">
            <%  for(HashMap bht:bhtList){  %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>" style="background-image: url('<%= bht.get("image") %>'); height: 400px"></a>
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
        var mySwiper = new Swiper ('#banner16', {
            loop: true, // 循环模式选项
            autoplay:{
                delay:3000,
                disableOnInteraction:false
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
<div class="" style="" >

    

<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">
    
                        <div class="col-sm-12 col-md-12">
    
                

    

<div class="title-sn-title">
        <div class="sn-title" :style="style">
            <div class="more">
                <a href="dianpuxinxilist.jsp">
                    More
                </a>
            </div>
            <span>
                店铺列表            </span>
        </div>
        <div class="sn-content">
            

    

<div class="module-products clearfix">
                <div class="products clearfix">
            <%  for(HashMap r:list){  %>
            <div class="products-col" style="width: 25%">
                <article>
                    <a href="dianpuxinxidetail.jsp?id=<%= r.get("id") %>" class="pro-btn pro-btn-add">
                        查看
                    </a>
                    <div class="figure-grid">
                        <div class="image">
                            <div class="img-box pb100 img-scale">
                                <a class="img" href="dianpuxinxidetail.jsp?id=<%= r.get("id") %>" style="background-image: url('<%= r.get("dianpulogo") %>')"></a>
                            </div>
                        </div>
                        <div class="text">
                            <h2 class="title h4">
                                <a href="dianpuxinxidetail.jsp?id=<%= r.get("id") %>">
                                    <%= r.get("dianpumingcheng") %>
                                </a>
                            </h2>
                                                                                    <span class="description clearfix">
                                <%= Info.subStr(r.get("dianpujieshao") , 12) %>
                            </span>
                                                    </div>
                    </div>
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