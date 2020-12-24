<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">

<% HashMap map = Query.make("dianpuxinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                店铺编号            </td>
            <td><%= map.get("dianpubianhao") %></td>
            
                                    <td width="180">
                店铺名称            </td>
            <td><%= map.get("dianpumingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                店铺logo            </td>
            <td><img src="<%= map.get("dianpulogo") %>" style="width: 350px"/></td>
            
                                    <td width="180">
                联系电话            </td>
            <td><%= map.get("lianxidianhua") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                经营宗旨            </td>
            <td><%= map.get("jingyingzongzhi") %></td>
            
                                    <td width="180">
                店铺介绍            </td>
            <td><%= map.get("dianpujieshao") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                商家            </td>
            <td><%= map.get("shangjia") %></td>
            
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
