<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/11/8
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>音乐客栈</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/music.ico">
    <link rel="stylesheet" href="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../mplayer/css/mplayer.min.css">
    <link rel="stylesheet" href="../../css/foot.css">
    <script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <style>
	    .login-position{
			padding:40px;
			position:fixed;
			top:23%;
			left:25%;
		}
        .login-center{
            padding:28px;
            position:fixed;
            top:25%;
            width:50%;
            background-color:#0fc;
        }

    </style>
</head>
<body>
<div class="login-position">
<div class="container">
    <div class="login-center">
        <div class="container">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/frontDesk/login.do" method="post">
                <div class="form-group">
                    <label for="countName" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user" aria-hidden="true" style="background-color: #fff"></span></label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="countName" name="countName" placeholder="账号/邮箱/手机号" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="countPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock" aria-hidden="true" style="background-color: #fff"></span></label>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="countPassword" name="countPassword" placeholder="请输入密码"  >
                    </div>
                </div>
                <div class="form-group">
                    <label for="code" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="code" name="code" placeholder="请输入验证码" >
                    </div>
                    <div class="col-sm-1">
                    <img alt="验证码" id="imagecode" src="${pageContext.request.contextPath}/frontDesk/ImageServlet.do"/>
                    <a href="javascript: reloadCode();">看不清楚</a>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">登录</button>
                        <button type="reset" class="btn btn-default">重置</button>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10 ">
                        <a href="${pageContext.request.contextPath}/frontDesk/register.do">免费注册</a>
                        ${msg}
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    function reloadCode(){
        var time = new Date().getTime();
        document.getElementById("imagecode").src="${pageContext.request.contextPath}/frontDesk/ImageServlet.do?d="+time;
    }
</script>
</body>
</html>
