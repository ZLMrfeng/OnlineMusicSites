<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/11/19
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>音乐客栈后台</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>

<div class="layui-card">
    <div class="layui-card-header">
  <span class="layui-breadcrumb" lay-separator="|">
   <a href="">设置</a>
   <a><cite>基本资料</cite></a>
     </span>
    </div>
    <div class="layui-card-body" style="padding:40px">
        <form class="layui-form"  action="${pageContext.request.contextPath}/frontDesk/editDetailPersonal.do" method="post"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-iteam ">
                <div class="layui-input-block">
                    <input type="hidden" name="userId" id="userId" value="${user.userId}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam  ">
                <label for="userName" class="layui-form-label">用户名</label>
                <div class="layui-input-block">

                    <input type="text" name="userName" id="userName" value="${user.userName}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam  ">
                <label for="countName" class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="countName" id="countName" value="${user.countName}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam ">
                <label for="userSex" class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="text" name="userSex" id="userSex" value="${user.userSex}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam ">
                <label for="userImage" class="layui-form-label">头像</label>
                <div class="layui-input-block">

                    <input type="text" name="userImage" id="userImage" value="${user.userImage}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam ">
                <label for="userTypeId" class="layui-form-label">用户类型</label>
                <div class="layui-input-block">
                    <input type="text" name="userTypeId" id="userTypeId" value="${user.userTypeId}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam ">
                <div class="layui-input-block">
                    <input type="submit" value="修改" autocomplete="off" size="23px"/>
                    <input type="reset" value="重置" autocomplete="off" size="23px"/>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layer.element;
    })
</script>
</body>
</html>
