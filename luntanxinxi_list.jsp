<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>

<div style="padding: 10px">
    <%
        //------------------------------------------------
        String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


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


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            论坛信息        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>
                    <div class="form-group">
                        编号

                        <input type="text" class="form-control" style="" name="bianhao"
                               value="<%= request.getParameter("bianhao") !=null ? request.getParameter("bianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        标题

                        <input type="text" class="form-control" style="" name="biaoti"
                               value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>"/>
                    </div>
                    <div class="form-group">
                        分类

                        <select class="form-control class_fenlei22"
                                data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"
                                data-rule-required="true" data-msg-required="请填写分类" id="fenlei" name="fenlei">
                            <option value="">请选择</option>
                            <%
                                List<HashMap> select = new CommDAO().select("SELECT * FROM luntanfenlei ORDER BY id desc");
                            %>
                            <% for (HashMap m : select) { %>
                            <option value="<%= m.get("id") %>"><%= m.get("fenlei") %>
                            </option>
                            <% } %>

                        </select>
                        <script>
                            $(".class_fenlei22").val($(".class_fenlei22").attr("data-value"))</script>

                    </div>

                    <button type="submit" class="btn btn-default">
                        搜索
                    </button>


                    <!--form标签结束--></form>
            </div>


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 编号</th>
                        <th> 标题</th>
                        <th> 分类</th>
                        <th> 图片</th>
                        <th> 发布人</th>
                        <th width="80" data-field="issh">审核状态</th>
                        <th width="120" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                <%= i %>
                            </label>
                        </td>
                        <td><%= map.get("bianhao") %>
                        </td>
                        <td><%= map.get("biaoti") %>
                        </td>
                        <td><%
                            HashMap mapluntanfenlei23 = new CommDAO().find("SELECT fenlei FROM luntanfenlei where id='" + map.get("fenlei") + "'");
                        %><%= mapluntanfenlei23.get("fenlei") %>
                        </td>
                        <td><% if ("".equals(map.get("tupian"))) { %>-<% } else { %><img width="100"
                                                                                         src="<%= map.get("tupian") %>"/><% } %>
                        </td>
                        <td><%= map.get("faburen") %>
                        </td>
                        <td>
                            <%= map.get("issh") %>
                            <a href="sh.jsp?id=<%= map.get("id") %>&yuan=<%= map.get("issh") %>&tablename=luntanxinxi">
                                <% if (map.get("issh").equals("是")) { %>
                                取消审核
                                <% } else { %>
                                审核
                                <% } %>
                            </a>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">


                            <a href="luntanxinxi_detail.jsp?id=<%= map.get("id") %>">
                                详细
                            </a>
                            <a href="luntanxinxi_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="luntanxinxi.jsp?a=delete&id=<%= map.get("id") %>"
                               onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            ${page.info}


        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
