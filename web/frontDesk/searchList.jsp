<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>音乐客栈</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/music.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/APlayer.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sign.css">

    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/image/con_bg.jpg");
        }
    </style>
</head>
<body>
<!-- 头部-->
<div class="container">
    <nav class="navbar navbar-default " role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">音乐客栈</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">首页<span class="sr-only">(current)</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/frontDesk/singerCollection.do?page=1&limit=8">歌手</a></li>
                    <li><a href="${pageContext.request.contextPath}/frontDesk/musics/song_list.jsp">歌单</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">排行榜 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/classicallist.jsp">经典老歌榜</a></li>
                            <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/Networklist.jsp">网络红歌榜</a></li>
                            <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/KTVlist.jsp">KTV热门榜</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/DJHotlist.jsp">动听DJ排行榜</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}f/frontDesk/rankingList/balladlist.jsp">民谣排行榜</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left"
                      action="${pageContext.request.contextPath}/musicPlayer/searchSongList.do" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="searchContext" value="${searchContext}"
                               placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/frontDesk/register.do">免费注册</a></li>
                    <li><a href="${pageContext.request.contextPath}/backstage/userCenter.do?id=${user.userId}">个人中心</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false" onclick="start(${user.userId})">
                            <img id="myImage" alt="Brand"
                                 src="<c:choose><c:when test="${user.userImage != null}">${user.userImage}</c:when><c:otherwise>/image/2.gif</c:otherwise></c:choose>"
                                 class="img-circle" style="height:23px;width:34px;"/>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu" id="login-menu" style="display: none">
                            <li></li>
                            <li><a href="${pageContext.request.contextPath}/backstage/userDetail.do?id=${user.userId}">修改信息</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/backstage/userDetails.do?id=${user.userId}">安全管理</a>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/frontDesk/exitSystem.do">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div class="container">

    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#home" data-toggle="tab">
                单曲
            </a>
        </li>
        <li><a href="#singer" data-toggle="tab">歌手</a></li>
        <li class="dropdown">
            <a href="#" id="myTabDrop1" class="dropdown-toggle"
               data-toggle="dropdown">其他
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                <li><a href="#songList" tabindex="-1" data-toggle="tab">歌单</a></li>
                <li><a href="#special" tabindex="-1" data-toggle="tab">专辑</a></li>
            </ul>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="home">
            <div class="table-responsive">
                <table class="table table-hover table-condensed">
                    <thead style="border: 1px rgba(213,255,239,0.25) solid;">
                    <th></th>
                    <th>操作</th>
                    <th colspan="5">音乐标题</th>
                    <th colspan="3">歌手</th>
                    <th colspan="3">专辑</th>
                    <th colspan="2">时长</th>
                    <th colspan="3">热度</th>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${flag eq 0}">
                            <c:forEach items="${generalWorksList}" var="generalWorks">
                                <tr>
                                    <td></td>
                                    <td>
                                        <a href="#"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span></a>
                                        &nbsp;&nbsp;
                                        <a href="#"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></a>
                                    </td>
                                    <td colspan="5"><a href="${pageContext.request.contextPath}/musicPlayer/songById.do?id=${generalWorks.songId}">${generalWorks.songName}</a></td>
                                    <td colspan="3"><a href="${pageContext.request.contextPath}/musicPlayer/songById.do?id=${generalWorks.songId}">${generalWorks.singernameChinese}</a></td>
                                    <td colspan="3">${generalWorks.songName}</td>
                                    <td colspan="2">${generalWorks.songLongTime}</td>
                                    <td colspan="3">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                                                 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:10%">
                                                <span class="sr-only">40% Complete (success)</span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="18">${msg}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane fade" id="singer">
            <c:choose>
            <c:when test="${flag eq 0}">
            <c:forEach items="${generalWorksList}" var="generalWorks">
                <div class = "col-md-4">
                    <a href="${pageContext.request.contextPath}/frontDesk/singerListById.do?id=${generalWorks.singerId}">
                        <img src="${generalWorks.singerImage}" alt="..." class="img-thumbnail" style="width:130px;height: 130px">
                        <label style="position: relative;top:0px;">${generalWorks.singernameChinese}</label>
                    </a>
                </div>
            </c:forEach>
            </c:when>
                <c:otherwise>

                        ${msg}
                </c:otherwise>
            </c:choose>

        </div>
        <div class="tab-pane fade" id="songList">
            <div class="table-responsive">
                <table class="table table-hover table-condensed">
                    <thead style="border: 1px rgba(213,255,239,0.25) solid;">
                    <th></th>
                    <th>操作</th>
                    <th colspan="5">音乐标题</th>
                    <th colspan="3">歌手</th>
                    <th colspan="3">专辑</th>
                    <th colspan="2">时长</th>
                    <th colspan="3">热度</th>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${flag eq 0}">
                            <c:forEach items="${generalWorksList}" var="generalWorks">
                                <tr>
                                    <td></td>
                                    <td>
                                        <a href="#"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span></a>
                                        &nbsp;&nbsp;
                                        <a href="#"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></a>
                                    </td>
                                    <td colspan="5"><a href="${pageContext.request.contextPath}/musicPlayer/songById.do?id=${generalWorks.songId}">${generalWorks.songName}</a></td>
                                    <td colspan="3"><a href="${pageContext.request.contextPath}/musicPlayer/songById.do?id=${generalWorks.songId}">${generalWorks.singernameChinese}</a></td>
                                    <td colspan="3">${generalWorks.songName}</td>
                                    <td colspan="2">${generalWorks.songLongTime}</td>
                                    <td colspan="3">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                                                 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:10%">
                                                <span class="sr-only">40% Complete (success)</span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="18">${msg}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane fade" id="special">
                    <c:choose>
                        <c:when test="${flags eq 0}">
                            <c:forEach items="${specialWorksList}" var="specialWorks">
                                <div class = "col-md-4">
                                    <a href="${pageContext.request.contextPath}/frontDesk/singerListById.do?id=${specialWorks.singerId}">
                                        <img src="${specialWorks.specialImage}" alt="..." class="img-thumbnail" style="width:130px;height: 130px">
                                        <label style="position: relative;top:0px;">${specialWorks.specialName}</label>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                          ${msg}
                        </c:otherwise>
                    </c:choose>
        </div>
    </div>


</div>
<%@ include file="../iframe/loginHide.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/signformchange.js"></script>
</body>
</html>