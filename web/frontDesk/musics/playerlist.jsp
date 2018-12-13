<%@ page import="com.zl.bean.GeneralWorks" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %><%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/10/28
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="../../dist/APlayer.min.css">
    <link rel="stylesheet" href="../../css/playList.css">
    <link rel="stylesheet" href="../../css/sign.css">
    <script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <style>
        body {
            overflow: hidden;
        }
    </style>

</head>
<body>
<!-- 头部-->

<nav class="navbar navbar-default" role="navigation">
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
                <li><a href="${pageContext.request.contextPath}/index.jsp">首页<span class="sr-only">(current)</span></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/frontDesk/singerCollection.do?page=1&limit=8">歌手</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/frontDesk/musics/song_list.jsp">歌单</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">排行榜 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/frontDesk/rankingList/classicallist.jsp">经典老歌榜</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/Networklist.jsp">网络红歌榜</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/KTVlist.jsp">KTV热门榜</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/DJHotlist.jsp">动听DJ排行榜</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/balladlist.jsp">民谣排行榜</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left"
                  action="${pageContext.request.contextPath}/musicPlayer/searchSongList.do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="searchContext" placeholder="搜索音乐">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/backstage/userCenter.do?id=${user.userId}">个人中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" onclick="start(${user.userId})">
                        <img id="myImage" alt="Brand"
                             src="<c:choose><c:when test="${user.userImage != null}">${user.userImage}</c:when><c:otherwise>/image/2.gif</c:otherwise></c:choose>"
                             class="img-circle" style="height:23px;width:34px;"/>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu" id="login-menu" style="display: none">
                        <li></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/backstage/userDetail.do?id=${user.userId}">修改信息</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/backstage/userDetails.do?id=${user.userId}">安全管理</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/exitSystem.do">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="box-center">
    <div class="box-one">
        <ul>
            <li class="active"><a href="#">
                <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span>&nbsp;&nbsp;正在播放</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>&nbsp;&nbsp;播放历史</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;&nbsp;我收藏的单曲</a>
            </li>
        </ul>
        <hr>
    </div>
    <div class="box-two">
        <div class="box-two-one text-center">
            <div class="item-one"></div>
            <div class="item-two"></div>
            <div class="item-three">歌曲</div>
            <div class="item-four">演唱者</div>
            <div class="item-five">专辑</div>
            <div class="item-six"></div>
        </div>
        <div class="box-two-two table-responsive">
            <table class="table table-hover">
                <c:forEach items="${generalWorksList}" var="generalWorks">
                    <tr>
                        <td class="text-center"><input type="checkbox" name="one"></td>
                        <td class="text-center">
                            <span class="glyphicon glyphicon-stats" style="color: #dd7e0d"></span>
                            <input type="hidden" id="songById" value="<c:out value="${generalWorks.songId}"/>"
                                   />
                            <input type="hidden" id="songLrc" value="<c:out value="${generalWorks.songLrc}"/>"
                                   />
                        </td>
                        <td colspan="4" class="text-center"><c:out value="${generalWorks.songName}"/></td>
                        <td colspan="4" class="text-center"><c:out value="${generalWorks.singernameChinese}"/></td>
                        <td colspan="4" class="text-center"><c:out value="${generalWorks.songLongTime}"/></td>
                        <td colspan="4" class="text-center">
                            <span class="glyphicon glyphicon-heart-empty"></span>
                            &nbsp;&nbsp;
                            <span class="glyphicon glyphicon-option-horizontal"></span>
                            &nbsp;&nbsp;
                            <span class="glyphicon glyphicon-remove-circle"></span>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <hr>
        <div class="two-footer ">
            <div class="two-footer-one ">
                <ul>
                    <li><input type="checkbox" name="one"></li>
                    <li><a href="#" class="btn btn-xs btn-default" role="button">删除</a></li>
                    <li><a href="#" class="btn btn-xs btn-default" role="button">收藏</a></li>
                    <li><a href="#" class="btn btn-xs btn-default" role="button">添加到歌单</a></li>
                    <li><a href="#" class="btn btn-xs btn-default" role="button">更多</a></li>
                </ul>
            </div>
            <div class="two-footer-two pull-right text-center">
                <a href="#" class="btn btn-xs btn-default" role="button">手机继续听</a>
            </div>
        </div>
    </div>
    <div class="box-three">
        <div class="row">
            <div class="col-md-12 text-center">
                <c:forEach items="${generalWorksList}" var="generalWorks">
                    <img src="<c:out value="${generalWorks.singerImage}"/>" class="img-circle">
                </c:forEach>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 text-center"><a href="#">
                <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
            </a></div>
            <div class="col-md-4 text-center"><a href="#">
                <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
            </a></div>
            <div class="col-md-4 text-center"><a href="#">
                <span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>
            </a></div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center" id="songLrcShow" style="overflow: auto;width:280px;height:257px;">

            </div>
        </div>
    </div>
</div>
<%@ include file="../../iframe/loginHide.jsp" %>
<div id="aplayer" class="foot-player"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src="../../dist/APlayer.min.js">
</script>
<script src="../../dist/js/songListCollection.js"></script>
<script>
    $(document).ready(
               $("#songLrcShow").load($("#songLrc").val())
    );
</script>
<script>

    const ap = new APlayer({
        container: document.getElementById('aplayer'),
        mini: false,
        autoplay: true,
        theme: '#FADFA3',
        loop: 'all',
        order: 'random',
        preload: 'auto',
        volume: 0.7,
        mutex: true,
        listFolded: true,
        listMaxHeight: 90,
        lrcType: 3,
        audio: song_List
    });
</script>


</body>
</html>
