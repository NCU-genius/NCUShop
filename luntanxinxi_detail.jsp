<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">

<% HashMap map = Query.make("luntanxinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                编号            </td>
            <td><%= map.get("bianhao") %></td>
            
                                    <td width="180">
                标题            </td>
            <td><%= map.get("biaoti") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapluntanfenlei26 = new CommDAO().find("SELECT fenlei FROM luntanfenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapluntanfenlei26.get("fenlei") %></td>
            
                                    <td width="180">
                图片            </td>
            <td><img src="<%= map.get("tupian") %>" style="width: 350px"/></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                内容            </td>
            <td><%= map.get("neirong") %></td>
            
                                    <td width="180">
                发布人            </td>
            <td><%= map.get("faburen") %></td>
                    </tr>
        <tr>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>
</div>
<%@ include file="foot.jsp" %>
