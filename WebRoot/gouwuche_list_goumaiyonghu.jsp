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
        where += " AND goumaiyonghu='" + request.getSession().getAttribute("username") + "' "; //  设置goumaiyonghu为当前登录用户


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


        if (request.getParameter("shangpinxinxiid") != null && !"".equals(request.getParameter("shangpinxinxiid"))) {
            where += " AND shangpinxinxiid='" + request.getParameter("shangpinxinxiid") + "' ";

        }
        if (request.getParameter("dianpubianhao") != null && !"".equals(request.getParameter("dianpubianhao"))) {
            where += " AND dianpubianhao LIKE '%" + request.getParameter("dianpubianhao") + "%'";
        }
        if (request.getParameter("dianpumingcheng") != null && !"".equals(request.getParameter("dianpumingcheng"))) {
            where += " AND dianpumingcheng LIKE '%" + request.getParameter("dianpumingcheng") + "%'";
        }
        if (request.getParameter("shangpinbianhao") != null && !"".equals(request.getParameter("shangpinbianhao"))) {
            where += " AND shangpinbianhao LIKE '%" + request.getParameter("shangpinbianhao") + "%'";
        }
        if (request.getParameter("shangpinmingcheng") != null && !"".equals(request.getParameter("shangpinmingcheng"))) {
            where += " AND shangpinmingcheng LIKE '%" + request.getParameter("shangpinmingcheng") + "%'";
        }
        if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
            where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
        }
        if (request.getParameter("goumaishuliang_start") != null && !"".equals(request.getParameter("goumaishuliang_start"))) {
            where += " AND goumaishuliang >='" + request.getParameter("goumaishuliang_start") + "' ";
        }
        if (request.getParameter("goumaishuliang_end") != null && !"".equals(request.getParameter("goumaishuliang_end"))) {
            where += " AND goumaishuliang <='" + request.getParameter("goumaishuliang_end") + "' ";
        }
        if (request.getParameter("xiaoji_start") != null && !"".equals(request.getParameter("xiaoji_start"))) {
            where += " AND xiaoji >='" + request.getParameter("xiaoji_start") + "' ";
        }
        if (request.getParameter("xiaoji_end") != null && !"".equals(request.getParameter("xiaoji_end"))) {
            where += " AND xiaoji <='" + request.getParameter("xiaoji_end") + "' ";
        }
        List<Map> shangjia = Query.make("gouwuche").field("distinct shangjia").where(where).select();
        List<Map> resultList = new ArrayList();
        //System.out.println(shangjia);
        for (Map map : shangjia) {
            //String shangjiaZhanghao = Query.make("huowuxinxi").where("id",map.get("huowuxinxiid")).value("faburen");
            HashMap sjMap = Query.make("shangjia").where("shangjiazhanghao", map.get("shangjia")).find();
            String wp = where.concat(" AND shangjia='" + map.get("shangjia") + "'");

            List<HashMap> list = Query.make("gouwuche").where(wp).order(orderby).select();//service.selectExample(example);
            sjMap.put("xiaoji", Query.make("gouwuche").where(wp).sum("xiaoji"));
            sjMap.put("list", list);
            resultList.add(sjMap);
        }
        HashMap total = Query.make("gouwuche").field("(sum(xiaoji)) sum_xiaoji").where(where).field("(sum(xiaoji)) sum_xiaoji").find();
    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            购物车        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>

                    <div class="form-group">
                        店铺名称

                        <input type="text" class="form-control" style="" name="dianpumingcheng"
                               value="<%= request.getParameter("dianpumingcheng") !=null ? request.getParameter("dianpumingcheng") : "" %>"/>
                    </div>

                    <div class="form-group">
                        商品名称

                        <input type="text" class="form-control" style="" name="shangpinmingcheng"
                               value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>"/>
                    </div>
                    <div class="form-group">
                        分类

                        <select class="form-control class_fenlei7"
                                data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"
                                id="fenlei" name="fenlei">
                            <option value="">请选择</option>
                            <%
                                List<HashMap> select = new CommDAO().select("SELECT * FROM shangpinfenlei ORDER BY id desc");
                            %>
                            <% for (HashMap m : select) { %>
                            <option value="<%= m.get("id") %>"><%= m.get("fenlei") %>
                            </option>
                            <% } %>

                        </select>
                        <script>
                            $(".class_fenlei7").val($(".class_fenlei7").attr("data-value"))</script>

                    </div>


                    <button type="submit" class="btn btn-default">
                        搜索
                    </button>


                    <!--form标签结束--></form>
            </div>

            <% for (Map sj : resultList) { %>
            <h3>
                商家: <%=sj.get("shangjiazhanghao")%>
            </h3>
            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 店铺编号</th>
                        <th> 店铺名称</th>
                        <th> 商品编号</th>
                        <th> 商品名称</th>
                        <th> 分类</th>
                        <th> 商品图片</th>
                        <th> 商品价格</th>
                        <th> 商家</th>
                        <th> 购买数量</th>
                        <th> 小计</th>
                        <th> 购买用户</th>

                        <th width="120" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : (List<HashMap>) sj.get("list")) {
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
                        <td><%= map.get("shangpinbianhao") %>
                        </td>
                        <td><%= map.get("shangpinmingcheng") %>
                        </td>
                        <td><%
                            HashMap mapshangpinfenlei11 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='" + map.get("fenlei") + "'");
                        %><%= mapshangpinfenlei11.get("fenlei") %>
                        </td>
                        <td><% if ("".equals(map.get("shangpintupian"))) { %>-<% } else { %><img width="100"
                                                                                                 src="<%= Info.images(map.get("shangpintupian")) %>"/><% } %>
                        </td>
                        <td><%= map.get("shangpinjiage") %>
                        </td>
                        <td><%= map.get("shangjia") %>
                        </td>
                        <td><%= map.get("goumaishuliang") %>
                        </td>
                        <td><%= map.get("xiaoji") %>
                        </td>
                        <td><%= map.get("goumaiyonghu") %>
                        </td>

                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">

                            <a href="gouwuche_updt.jsp?id=<%= map.get("id") %>">修改</a>
                            <a href="gouwuche.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            ${page.info}
            <p>
                小计总和: <%= sj.get("xiaoji") %> 　　
                <a href="shangpindingdan_add.jsp?xiaoji=<%= sj.get("xiaoji") %>&shangjia=<%=sj.get("shangjiazhanghao")%>">生成订单</a>
            </p>
            <% } %>


        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
