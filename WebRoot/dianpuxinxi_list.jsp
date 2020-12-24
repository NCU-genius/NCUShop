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


        if (request.getParameter("dianpubianhao") != null && !"".equals(request.getParameter("dianpubianhao"))) {
            where += " AND dianpubianhao LIKE '%" + request.getParameter("dianpubianhao") + "%'";
        }
        if (request.getParameter("dianpumingcheng") != null && !"".equals(request.getParameter("dianpumingcheng"))) {
            where += " AND dianpumingcheng LIKE '%" + request.getParameter("dianpumingcheng") + "%'";
        }
        List<HashMap> list = Query.make("dianpuxinxi").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            店铺信息        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>
                    <div class="form-group">
                        店铺编号

                        <input type="text" class="form-control" style="" name="dianpubianhao"
                               value="<%= request.getParameter("dianpubianhao") !=null ? request.getParameter("dianpubianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        店铺名称

                        <input type="text" class="form-control" style="" name="dianpumingcheng"
                               value="<%= request.getParameter("dianpumingcheng") !=null ? request.getParameter("dianpumingcheng") : "" %>"/>
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
                        <th> 店铺编号</th>
                        <th> 店铺名称</th>
                        <th> 店铺logo</th>
                        <th> 联系电话</th>
                        <th> 经营宗旨</th>
                        <th> 商家</th>
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
                        <td><%= map.get("dianpubianhao") %>
                        </td>
                        <td><%= map.get("dianpumingcheng") %>
                        </td>
                        <td><% if ("".equals(map.get("dianpulogo"))) { %>-<% } else { %><img width="100"
                                                                                             src="<%= map.get("dianpulogo") %>"/><% } %>
                        </td>
                        <td><%= map.get("lianxidianhua") %>
                        </td>
                        <td><%= map.get("jingyingzongzhi") %>
                        </td>
                        <td><%= map.get("shangjia") %>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">


                            <a href="dianpuxinxi_detail.jsp?id=<%= map.get("id") %>">
                                详细
                            </a>
                            <a href="dianpuxinxi_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="dianpuxinxi.jsp?a=delete&id=<%= map.get("id") %>"
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
