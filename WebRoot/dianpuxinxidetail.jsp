<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
%>
<% HashMap map = Query.make("dianpuxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link href="js/h5upload/h5upload.css" rel="stylesheet">
<script src="js/h5upload/h5upload.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner22">
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
        var mySwiper = new Swiper('#banner22', {
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
                            <a href="">
                                More
                            </a>
                        </div>
                        <span>
                店铺详情            </span>
                    </div>
                    <div class="sn-content">


                        <div class="">
                            <div class="goods-info clearfix">
                                <div class="gallery-list">
                                    <div class="swiper-container gallery-top" id="shangpin-galler">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                    <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                </div>
                                <div class="goods-right-content">
                                    <h3 class="title"><%= map.get("dianpumingcheng") %>
                                    </h3>
                                    <div class="descount">
                                        <div>
                        <span class="name">
                            店铺编号：
                        </span>
                                            <span class="val">
                            <%= map.get("dianpubianhao") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            联系电话：
                        </span>
                                            <span class="val">
                            <%= map.get("lianxidianhua") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            经营宗旨：
                        </span>
                                            <span class="val">
                            <%= map.get("jingyingzongzhi") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            商家：
                        </span>
                                            <span class="val">
                            <%= map.get("shangjia") %>                        </span>
                                        </div>
                                    </div>

                                    <% HashMap readMap = Query.make("dianpuxinxi").where("id", request.getParameter("id")).find(); %>
                                    <form class="form-inline" action="shangpinxinxi.jsp?a=insert" id="form1"
                                          method="post"><!-- form 标签开始 -->


                                        <div style="display: none">
                                            <input type="hidden" name="issh" value="否"/>

                                            <input type="hidden" id="dianpubianhao" name="dianpubianhao"
                                                   value="<%= Info.html(map.get("dianpubianhao")) %>"/>
                                            <input type="hidden" id="dianpumingcheng" name="dianpumingcheng"
                                                   value="<%= Info.html(map.get("dianpumingcheng")) %>"/>
                                            <input type="text" class="form-control" style="width:150px;"
                                                   readonly="readonly" id="shangjia" name="shangjia"
                                                   value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                            <input type="hidden" name="dianpuxinxiid" value="<%= map.get("id") %>"/>
                                            <input name="referer" id="referer" value="" type="hidden"/>
                                            <script>
                                                $('#referer').val(location.href);
                                            </script>
                                        </div>

                                        <div class="mt10">
                                            <div class="spec-list">
                                            </div>



                                            <div class="mt10">
                                                <a  class="btn btn-primary" href="shangpinxinxilist.jsp?dianpubianhao=<%= map.get("dianpubianhao") %>">
                                                    进入店铺
                                                </a>

                                                <button type="button" class="btn btn-default"
                                                        onclick="location.href='jrsc.jsp?id=<%= map.get("id") %>&biao=dianpuxinxi&ziduan=dianpumingcheng'">
                                                    收藏店铺
                                                </button>
                                            </div>
                                        </div>

                                        <!--form标签结束--></form>
                                    <script>
                                        $(function () {
                                            $('#form1').validate();
                                        })
                                    </script>
                                </div>
                            </div>
                            <div class="goods-content">
                                <%= map.get("dianpujieshao") %>
                            </div>

                            <script>
                                (function () {
                                    var images = "<%= map.get("dianpulogo") %>".split(",");
                                    if (images.length > 0) {
                                        for (var i = 0; i < images.length; i++) {
                                            var path = images[i]
                                            var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                            $('#shangpin-galler .swiper-wrapper').append(src);
                                            $('#shangpin-thumb .swiper-wrapper').append(src);
                                        }

                                        var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                            spaceBetween: 10,
                                            slidesPerView: 4,
                                            watchSlidesVisibility: true,//防止不可点击
                                        })
                                        var gallerySwiper = new Swiper('#shangpin-galler', {
                                            spaceBetween: 10,
                                            thumbs: {
                                                swiper: thumbsSwiper,
                                            }
                                        })
                                    }

                                })();

                            </script>

                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<div class="" style="">


    <div class="" style="">


        <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

            <div class="row">

                <div class="col-sm-12 col-md-12">


                    <div class="title-sn-title">
                        <div class="sn-title" :style="style">
                            <div class="more">

                            </div>
                            <span>
                店铺评论区            </span>
                        </div>
                        <div class="sn-content">


                            <div class="gr-control-module-table">
                                <div class="">
                                    <form action="pinglun.jsp?a=insert" method="post"><!-- form 标签开始 -->


                                        <div class="form-group">


                                        <textarea style="width: 80%;height: 120px" class="form-control"
                                                  name="pinglunneirong" placeholder="请输入评论内容"></textarea>

                                        </div>
                                        <input type="hidden" name="biao" value="dianpuxinxi"/>
                                        <input name="biaoid" type="hidden" id="biaoid"
                                               value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                                        <input name="biaoti" type="hidden" id="biaoti"
                                               value="<%= map.get("dianpumingcheng") %>"/>
                                        <input name="pinglunren" type="hidden"
                                               value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                        <div style="text-align: left">

                                            <% if (request.getSession().getAttribute("username") != null ) { %>
                                            <button type="submit" class="btn btn-primary">
                                                发布评论
                                            </button>

                                            <% } else { %>
                                            <button type="button" onclick="alert('你尚未登录,请先登录在评论')" class="btn btn-primary">
                                                发布评论
                                            </button>
                                            <% } %>

                                        </div>

                                        <!--form标签结束--></form>
                                </div>

                                <% ArrayList<HashMap> pinglunList = Query.make("pinglun").where("biao", "dianpuxinxi").where("biaoid", request.getParameter("id")).order("id desc").select(); %>

                                <div class="mt10">
                                    <% for (HashMap pl : pinglunList) { %>
                                    <% HashMap user = Query.make("huiyuan").where("yonghuming", pl.get("pinglunren")).find(); %>

                                    <div class="comment clearfix">
                                        <div class="common-avatar J_User">
                                            <% if (user.get("touxiang").equals("")) { %>
                                            <img src="images/default.gif" width="100%" height="100%"/>
                                            <% } else { %>
                                            <img src="<%= user.get("touxiang") %>" width="100%" height="100%"/>
                                            <% } %>
                                        </div>
                                        <div class="comment-block">
                                            <p class="comment-user"><span
                                                    class="comment-username J_User"> <%= user.get("yonghuming") %> </span>
                                                <span class="comment-time"><%= pl.get("addtime") %></span></p>
                                            <div class="comment-content J_CommentContent"><%= pl.get("pinglunneirong") %>
                                            </div>
                                        </div>
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


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>