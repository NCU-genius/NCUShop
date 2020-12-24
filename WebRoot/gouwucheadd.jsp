<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%
if((String)request.getSession().getAttribute("username")==null || "".equals( request.getSession().getAttribute("username") ))
{
	out.print("<script>javascript:alert('对不起，您已超时或未登陆！');window.history.go(-1);</script>");
	return;
}
%><%@ include file="head.jsp" %><%@ include file="header.jsp" %><script src="js/jquery.validate.js"></script>







    
    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("shangpinxinxi").where("id", request.getParameter("id")).find(); %>





<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加购物车:
        </div>
        <div class="panel-body">
            <form action="gouwuche.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">店铺编号</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("dianpubianhao") %><input type="hidden" id="dianpubianhao" name="dianpubianhao" value="<%= Info.html(readMap.get("dianpubianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">店铺名称</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("dianpumingcheng") %><input type="hidden" id="dianpumingcheng" name="dianpumingcheng" value="<%= Info.html(readMap.get("dianpumingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品编号</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("shangpinbianhao") %><input type="hidden" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.html(readMap.get("shangpinbianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品名称</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("shangpinmingcheng") %><input type="hidden" id="shangpinmingcheng" name="shangpinmingcheng" value="<%= Info.html(readMap.get("shangpinmingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">分类</label>
        <div class="col-sm-8">
            
                                                    <% 
 HashMap mapshangpinfenlei14 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+readMap.get("fenlei")+"'"); 
 %><%= mapshangpinfenlei14.get("fenlei") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(readMap.get("fenlei")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品图片</label>
        <div class="col-sm-8">
            
                                                    <% if( "".equals( readMap.get("shangpintupian") ) ){ %>-<% } else { %><img width="100" src="<%= Info.images(readMap.get("shangpintupian")) %>"/><% } %><input type="hidden" id="shangpintupian" name="shangpintupian" value="<%= Info.html(readMap.get("shangpintupian")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商品价格</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("shangpinjiage") %><input type="hidden" id="shangpinjiage" name="shangpinjiage" value="<%= Info.html(readMap.get("shangpinjiage")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">商家</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("shangjia") %><input type="hidden" id="shangjia" name="shangjia" value="<%= Info.html(readMap.get("shangjia")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购买数量<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写购买数量" number="true" data-msg-number="输入一个有效数字" id="goumaishuliang" name="goumaishuliang" value=""/>                                            
        </div>
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购买用户</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="goumaiyonghu" name="goumaiyonghu" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                                                <input type="hidden" name="shangpinxinxiid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                    
                                                                                                <input type="hidden" name="issh" value="否"/>
                                                                    
                    <button type="submit" class="btn btn-primary" name="Submit">
    提交
</button>
                    <button type="reset" class="btn btn-default" name="Submit2">
    重置
</button>

                
        </div>
    </div>
</div>
            
<!--form标签结束--></form>
        </div>
    </div>

<!-- container定宽，并剧中结束 --></div>





<script>
    $(function () {
        $('#form1').validate();
    });
</script>




<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>