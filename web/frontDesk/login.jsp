<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/11/18
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<div class="layadmin-user-login-box layadmin-user-login-body layui-form">
    <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
        <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名"
               class="layui-input">
    </div>
    <div class="layui-form-item">
        <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
        <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码"
               class="layui-input">
    </div>
    <div class="layui-form-item">
        <div class="layui-row">
            <div class="layui-col-xs7">
                <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
                       for="LAY-user-login-vercode"></label>
                <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码"
                       class="layui-input">
            </div>
            <div class="layui-col-xs5">
                <div style="margin-left: 10px;">
                    <img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg"
                         id="LAY-user-get-vercode">
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="margin-bottom: 20px;">
        <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
        <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>记住密码</span><i
                class="layui-icon layui-icon-ok"></i></div>
        <a lay-href="/user/forget" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="LAY-user-login-submit">登 入</button>
    </div>
    <div class="layui-trans layui-form-item layadmin-user-login-other">
        <label>社交账号登入</label>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
        <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

        <a lay-href="/user/reg" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    layui.config({
        version: '1535898708509' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , carousel = layui.carousel //轮播
            , upload = layui.upload //上传
            , element = layui.element //元素操作
            , slider = layui.slider //滑块

    });
</script>
</body>
</html>
