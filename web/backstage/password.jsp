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
<body onload="userDetail(${user.userId})">
<div class="layui-card">
    <div class="layui-card-header">
  <span class="layui-breadcrumb" lay-separator="|">
   <a href="">设置</a>
  <a><cite>基本资料</cite></a>
</span>
    </div>
    <div class="layui-card-body" style="padding:40px">
        <form class="layui-form" layui-filter="test" action="${pageContext.request.contextPath}/frontDesk/editPersonalSet.do" method="post"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-iteam ">
                <div class="layui-input-block">
                    <input type="hidden" name="userId" id="userId" value="${user.userId}" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam  ">
                <label for="countTurePassword" class="layui-form-label">新密码</label>
                <div class="layui-input-block ">
                    <input type="text" name="countTurePassword" id="countTurePassword" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam  ">
                <label for="countNewPassword" class="layui-form-label">确认密码</label>
                <div class="layui-input-block ">
                    <input type="text" name="countNewPassword" id="countNewPassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-iteam ">
                <div class="layui-input-block" style="align:center;">
                    <input type="submit" value="修改" autocomplete="off" size="23px"/>
                    <input type="reset" value="重置" autocomplete="off" size="23px"/>
                </div>
            </div>
        </form>
    </div>
</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../layui/layui.js"></script>
    <script>
        layui.use(['element', 'form'], function () {
            var element = layer.element,
                form = layer.form;
        });

        function userDetail(data) {
            var userId = data;
            if (userId == null) {
                alert(userId);
            }
            else {
                $.ajax({
                    url: "${pageContext.request.contextPath}/backstage/userByIdSystem.do",
                    type: "POST",
                    data: {"userId": data},
                    dataType: "json",
                    success:function(data){
                          $('#countPassword').value=data.data[0].userId;
                    }
                });
            }
        }
    </script>
</body>
</html>
