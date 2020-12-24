<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
%>
<% HashMap map = Query.make("luntanxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>


<div class="" style="">

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


    <div class="swiper-container" id="banner38">
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
        var mySwiper = new Swiper('#banner38', {
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
                论坛详情            </span>
                    </div>
                    <div class="sn-content">


                        <div class="detail-bbs">
                            <div class="read_t">
                                <table width="100%" class="floot">
                                    <tbody>
                                    <tr class="vt">
                                        <td rowspan="2" class="floot_left">
                                            <div class="readName b">
                                                <a href="javascript:;">
                                                    <% HashMap user = Query.make("huiyuan").where("yonghuming", map.get("faburen")).find(); %>
                                                    <%= user.get("xingming") %>
                                                </a>
                                            </div>
                                            <div class="floot_leftdiv">
                                                <a href="javascript:;" class="userCard face_img">
                                                    <% if (user.get("touxiang") == null || "".equals(user.get("touxiang"))) { %>
                                                    <img class="pic" src="images/default.gif" width="120" height="120"
                                                         border="0"/>
                                                    <% } else { %>
                                                    <img class="pic" src="<%= user.get("touxiang") %>" width="120"
                                                         height="120" border="0"/>
                                                    <% } %>
                                                </a>
                                                <div class="readUser_info cc mb10">
                                                    <div class="one" id="basic_info_2920754">
                                                        <dl class="cc">
                                                            <dt>用户名</dt>
                                                            <dd><%= user.get("yonghuming") %>
                                                            </dd>
                                                        </dl>
                                                        <dl class="cc">
                                                            <dt>性别</dt>
                                                            <dd><%= user.get("xingbie") %>
                                                            </dd>
                                                        </dl>
                                                        <dl class="cc">
                                                            <dt>邮箱</dt>
                                                            <dd><%= user.get("youxiang") %>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                                <div></div>
                                            </div>
                                        </td>
                                        <td class="floot_right">
                                            <a name="post_2920754"></a>
                                            <!--印戳-->
                                            <!--楼层信息及编辑-->
                                            <div class="tipTop s6">
                                                <a class="s2 b cp">楼主</a> <span
                                                    title="<%= map.get("addtime") %>">发表于: <%= map.get("addtime") %></span>
                                            </div>
                                            <div class="read_h1" style="margin-bottom:10px;" id="subject_2920754">
                                                <%= map.get("biaoti") %>
                                            </div>
                                            <div class="tpc_content">

                                                <div class="f14 mb10">
                                                    <%= map.get("neirong") %>
                                                </div>
                                            </div>
                                            <!--content_read-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="floot_bottom">
                                            <!--评分-->
                                            <div id="w_2920754" class="c"></div>
                                            <!--评分结束-->
                                            <div class="tipBottom cc" data-index="-1">
                                                <!--<div class="fl readbot">
                                                    <a class="r-reply" title="回复楼主" href="javascript:;" onclick="postreply('回 7楼(陈正奇) 的帖子');">回复</a>
                                                </div>-->
                                                <!--<div class="fr">
                                                    <a title="举报此帖" href="javascript:;" class="mr5">举报</a>
                                                </div>-->
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <table width="100%" class="flootbg">
                                <tbody>
                                <tr>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>

                            <script>
                                var page = '<%= request.getParameter("page") !=null ? request.getParameter("page") : "" %>';
                                if (page == '' || page == 'null') {
                                    page = 1;
                                }
                                var pagesize = 10;
                                page = Math.max(Math.floor(page), 1);
                                var index = (page - 1) * pagesize + 1;
                            </script>

                            <% Collect<HashMap> replyList = Query.make("luntanhuifu").where("luntanxinxiid", map.get("id")).order("addtime asc").page(10); %>
                            <%
                                int i = 0;
                                for (HashMap reply : replyList) {
                                    i++;
                            %>
                            <div class="">
                                <div class="read_t">
                                    <table width="100%" class="floot">
                                        <tbody>
                                        <tr class="vt">
                                            <td rowspan="2" class="floot_left">
                                                <div class="readName b">

                                                    <a href="javascript:;">
                                                        <%
                                                            user = Query.make("huiyuan").where("yonghuming", reply.get("huifuren")).find(); %>
                                                        <%= user.get("xingming") %>
                                                    </a>
                                                </div>
                                                <div class="floot_leftdiv">
                                                    <a href="javascript:;" class="userCard face_img">
                                                        <% if (user.get("touxiang") == null || "".equals(user.get("touxiang"))) { %>
                                                        <img class="pic" src="images/default.gif" width="120"
                                                             height="120" border="0"/>
                                                        <% } else { %>
                                                        <img class="pic" src="<%= user.get("touxiang") %>" width="120"
                                                             height="120" border="0"/>
                                                        <% } %>
                                                    </a>

                                                    <div class="readUser_info cc mb10">
                                                        <div class="one" id="basic_info_2920754">
                                                            <dl class="cc">
                                                                <dt>用户名</dt>
                                                                <dd><%= user.get("yonghuming") %>
                                                                </dd>
                                                            </dl>
                                                            <dl class="cc">
                                                                <dt>性别</dt>
                                                                <dd><%= user.get("xingbie") %>
                                                                </dd>
                                                            </dl>
                                                            <dl class="cc">
                                                                <dt>邮箱</dt>
                                                                <dd><%= user.get("youxiang") %>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>

                                                </div>
                                            </td>
                                            <td class="floot_right" id="td_2920754">
                                                <!--印戳-->
                                                <!--楼层信息及编辑-->
                                                <div class="tipTop s6">
                                                    <a class="s2 b cp">#
                                                        <script>document.write(index)</script>
                                                        楼</a> <span
                                                        title="<%= map.get("addtime") %>">发表于: <%= reply.get("addtime") %></span>
                                                </div>
                                                <div class="tpc_content">
                                                    <div class="f14 mb10">
                                                        <%= reply.get("huifuneirong") %>
                                                    </div>
                                                </div>
                                                <!--content_read-->
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="floot_bottom">
                                                <!--评分-->
                                                <div id="w_2920754" class="c"></div>
                                                <!--评分结束-->
                                                <div class="tipBottom cc">
                                                    <div class="fl readbot">
                                                        <a class="r-reply" title="回复此楼" href="javascript:;"
                                                           onclick="postreply(this);">回复</a>
                                                        <div style="display: none">
                                                            <p>回【
                                                                <script>document.write(index)</script>
                                                                楼】（<%= user.get("xingming") %>）的帖子
                                                            </p>
                                                            <%= reply.get("huifuneirong") %>
                                                        </div>
                                                    </div>
                                                    <!--<div class="fr">
                                                        <a title="举报此帖" href="javascript:;" class="mr5">举报</a>
                                                    </div>-->
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <table width="100%" class="flootbg">
                                    <tbody>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <script>index++</script>
                            <% } %>
                            <div class="">
                                ${page.info}
                            </div>
                            <div class="t" style="padding:0;margin-bottom:0;">
                                <form name="FORM" method="post" action="luntanhuifu.jsp?a=insert" id="anchor">
                                    <div class="b h" style="border-top:0;">快速回复</div>
                                    <table width="100%" class="floot" style="table-layout:inherit;">
                                        <tbody>
                                        <tr class="vt">
                                            <td class="floot_left">
                                                <div class="floot_leftdiv">
                                                    <div>
                                                        <p class="b"><%= request.getSession().getAttribute("name") != null ? request.getSession().getAttribute("name") : "" %>
                                                        </p>
                                                    </div>
                                                    <div class="cc">
                                                        <% if (request.getSession().getAttribute("touxiang") == null || "".equals(request.getSession().getAttribute("touxiang"))) { %>
                                                        <div class="face_img"><img class="pic" src="images/default.gif"
                                                                                   width="120" height="120" border="0"/>
                                                        </div>
                                                        <% } else { %>
                                                        <div class="face_img">
                                                            <img class="pic"
                                                                 src="<%= request.getSession().getAttribute("touxiang") !=null ? request.getSession().getAttribute("touxiang") : "" %>"
                                                                 width="120" height="120" border="0"/>
                                                        </div>
                                                        <% } %>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="padding:10px 0 10px 10px;">
                                                <div class="c mb10">
                                                    <div class="" style="display: none">

                                                        <% HashMap readMap = Query.make("luntanxinxi").where("id", request.getParameter("id")).find(); %>

                                                        <input type="hidden" id="bianhao" name="bianhao"
                                                               value="<%= Info.html(readMap.get("bianhao")) %>"/> <input
                                                            type="hidden" id="biaoti" name="biaoti"
                                                            value="<%= Info.html(readMap.get("biaoti")) %>"/> <input
                                                            type="hidden" id="fenlei" name="fenlei"
                                                            value="<%= Info.html(readMap.get("fenlei")) %>"/> <input
                                                            type="text" class="form-control" style="width:150px;"
                                                            readonly="readonly" id="huifuren" name="huifuren"
                                                            value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                                    </div>
                                                    <input type="hidden" name="luntanxinxiid"
                                                           value="<%= map.get("id") %>"/>
                                                    <input name="referer" id="referer" value="" type="hidden"/>
                                                    <script>
                                                        $('#referer').val(location.href);
                                                    </script>

                                                    <textarea id="huifuneirong" style="width: 100%;height: 120px;"
                                                              name="huifuneirong"></textarea>


                                                </div>
                                                <div>
                                    <span class="mr20">
                                        <span class="bt" style="margin:0;">
                                            <span>


                                                <% if ("会员".equals(request.getSession().getAttribute("cx"))) { %>
         <button type="submit" class="btn btn-primary" name="Submit">发 布</button>
            <% } %>

                                            </span>
                                        </span>
                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <script>
                                    function stripscript(s) {
                                        return s.replace(/<script.*?>.*?<\/script>/sig, '');
                                    }

                                    function postreply(obj) {
                                        var content = stripscript($(obj).next().html());
                                        content = content.replace(/【(.*?)([0-9]+)(.*?)】/sig, function ($0, $1, $2) {
                                            return '【' + $2 + '楼】'
                                        })
                                        content = '<blockquote>' + content + '</blockquote><p>&nbsp;</p>';
                                        var editor = UM.getEditor('huifuneirong');
                                        editor.setContent(content);
                                        $(window).scrollTop(99999);
                                        editor.focus();
                                    }

                                    UM.getEditor('huifuneirong');
                                </script>
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