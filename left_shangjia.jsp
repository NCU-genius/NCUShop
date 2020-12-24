<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>店铺信息</span>

    </a>
    <ul>
        <li>
            <a target="main" href="dianpuxinxi_add.jsp">
                店铺信息添加 </a>
        </li>
        <li>
            <a target="main" href="dianpuxinxi_list_shangjia.jsp">
                店铺信息查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>商品信息</span>

    </a>
    <ul>

        <li>
            <a target="main" href="shangpinxinxi_list_shangjia.jsp">
                商品信息查询 </a>
        </li>
        <li>
            <a target="main" href="shangpinruku_list_caozuoren.jsp">
                商品入库查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>订单信息</span>

    </a>
    <ul>
        <li>
            <a target="main" href="shangpindingdan_list_shangjia.jsp">
                商品订单查询 </a>
        </li>

        <li>
            <a target="main" href="fahuo_list_fahuoshangjia.jsp">
                订单发货查询 </a>
        </li>
        <li>
            <a target="main" href="qianshou_list_fahuoshangjia.jsp">
                订单签收查询 </a>
        </li>
    </ul>
</li>
<li>
    <a href="javascript:;" class="nav-top-item">
        <i class="icon ti-home"></i>
        <span>个人中心</span>

    </a>
    <ul>
        <li>
            <a target="main" href="shangjia_updtself.jsp">
                修改个人资料 </a>
        </li>
        <li>
            <a target="main" href="mod.jsp">
                修改密码 </a>
        </li>
    </ul>
</li>
