<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/10/29
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>音乐客栈后台</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">音乐客栈后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="http://localhost:8080/index.jsp">前台</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${user.userImage}" class="layui-nav-img">
                    ${user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" onclick="getMenuType(7)">基本资料</a></dd>
                    <dd><a href="javascript:;" onclick="getMenuType(8)">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/backstage/exitBackstageSystem.do">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed ">
                    <a class="layui-icon layui-icon-home " id="home-first" href="javascript:;" onload="getMenuType(13)">&nbsp;&nbsp;首页</a></li>
                <li class="layui-nav-item">
                    <a class="layui-icon layui-icon-user" href="javascript:;">&nbsp;&nbsp;用户</a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="javascript:;" onclick="getMenuType(12)">管理</a></dd>
                        <dd><a href="javascript:;" onclick="getMenuType(11)">类型</a></dd>

                    </dl></li>
                <li class="layui-nav-item">
                    <a class="layui-icon layui-icon-headset" href="javascript:;">&nbsp;&nbsp;音乐</a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="javascript:;" onclick="getMenuType(0)">歌曲管理</a></dd>
                        <dd><a href="javascript:;" onclick="getMenuType(1)">歌手管理</a></dd>
                        <dd><a href="javascript:;" onclick="getMenuType(2)">专辑管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="layui-icon layui-icon-template-1"href="javascript:;">&nbsp;&nbsp;资讯</a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                        <dd><a href="javascript:;" onclick="getMenuType(4)">资讯管理</a></dd>
                    </dl></li>
                <li class="layui-nav-item">
                    <a class="layui-icon layui-icon-set-sm" href="javascript:;">&nbsp;&nbsp;设置</a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                                <dd><a href="javascript:;" onclick="getMenuType(7)">基本资料</a></dd>
                                <dd><a href="javascript:;" onclick="getMenuType(8)">修改密码</a></dd>
                    </dl></li>
                <li class="layui-nav-item"><a class="layui-icon layui-icon-help" href="javascript:;" onclick="getMenuType(10)">&nbsp;&nbsp;帮助</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe id="menuName" name="menu-name" src="home.jsp" style="overflow: visible;border: 0" scrolling="yes" width="100%" height="100%" ></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 都市猎人
    </div>
</div>
<script src="../layui/layui.js"></script>
<script src="../js/menuType.js"></script>
<script>
    layui.config({
        version: '1535898708509' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块

    });
   /* function loadXMLDoc()
    {
        var xmlhttp;
        var txt,x,i;
        if (window.XMLHttpRequest)
        {
            // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp=new XMLHttpRequest();
        }
        else
        {
            // IE6, IE5 浏览器执行代码
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                xmlDoc=xmlhttp.responseXML;
                txt="";
                x=xmlDoc.getElementsByTagName("ARTIST");
                for (i=0;i<x.length;i++)
                {
                    txt=txt + x[i].childNodes[0].nodeValue + "<br>";
                }
                document.getElementById("myDiv").innerHTML=txt;
            }
        }
        xmlhttp.open("GET","cd_catalog.xml",true);
        xmlhttp.send();
    }*/


</script>
</body>
</html>