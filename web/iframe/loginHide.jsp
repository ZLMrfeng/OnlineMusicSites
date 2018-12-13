<div class="signform" id="signform" style="display: none">
    <div class="signclose">
        <span class="glyphicon glyphicon-remove" aria-hidden="true" width="35px" height="35px" onclick="signclose()"></span>
    </div>
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
            </form>
        </div>
    </div>
</div>
<div class="signform" id="registerform" style="display: none">
    <div class="signclose">
        <img src="image/signclose.ico" width="35px" height="35px" onclick="signclose()">
    </div>
    <div class="userdiv">
        <input  id="registeruser" class="signinput" onblur="loading()" type="text" placeholder="用户名" name="user">
    </div>
    <img src="image/signloading.gif" style="display: none" id="registerloading">
    <div class="pwddiv">
        <input  id="registerpwd" class="signinput" type="password" placeholder="密码" name="pwd">
    </div>
    <div class="pwddiv">
        <input  id="registerrepwd" class="signinput" type="password" placeholder="再次输入密码" name="pwd">
    </div>
    <div class="postdiv">
        <button>注册</button>
    </div>
    <br>
    <div class="change" style="color: #4d4d4d">
        <p>已有账号?立刻去<a href="#" style="text-decoration: none;color: #43A047">登录</a>吧</p>
    </div>
</div>
<script src="../../js/signformchange.js"></script>
<script>
    function reloadCode(){
        var time = new Date().getTime();
        document.getElementById("imagecode").src="${pageContext.request.contextPath}/frontDesk/ImageServlet.do?d="+time;
    }
</script>
