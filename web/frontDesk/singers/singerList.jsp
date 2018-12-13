<%@ page import="com.zl.util.PageSystem" %>
<%@ page import="com.zl.bean.Singer" %><%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/10/28
  Time: 16:03
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
    <link rel="stylesheet" href="../../css/foot.css">
    <link rel="stylesheet" href="../../css/sign.css">
    <script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/image/con_bg.jpg");
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
                <li><a href="${pageContext.request.contextPath}/frontDesk/singerCollection.do?page=1&limit=8">歌手</a></li>
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
                <li><a href="${pageContext.request.contextPath}/frontDesk/register.do">免费注册</a></li>
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
<%@ include file="../../iframe/loginHide.jsp" %>
<!-- 居中开始-->
<div class="container">
    <div class="artist-sort">
        <!--类型分类-->
        <ul class="clearfix filter" id="sort-type">
            <li class="artist-all on"><a href="/v3/music/artist">全部</a></li>
            <li><a href="/v3/music/artist?tagId=1">华语男歌手</a></li>
            <li><a href="/v3/music/artist?tagId=3">华语组合</a></li>
            <li><a href="/v3/music/artist?tagId=2">华语女歌手</a></li>
            <li><a href="/v3/music/artist?tagId=4">欧美男歌手</a></li>
            <li><a href="/v3/music/artist?tagId=5">欧美女歌手</a></li>
            <li><a href="/v3/music/artist?tagId=6">欧美组合</a></li>
            <li><a href="/v3/music/artist?tagId=7">日韩男歌手</a></li>
            <li><a href="/v3/music/artist?tagId=8">日韩女歌手</a></li>
            <li><a href="/v3/music/artist?tagId=9">日韩组合</a></li>
        </ul>
    </div>
    <br/>
    <br/>
    <div class="row">
    <c:forEach items="${pageSystem.data}" var="singer">
        <div class="col-md-3 text-center">
            <img src="${pageContext.request.contextPath}${singer.singerImage}" class="img-thumbnail"
                 style="width:130px;height: 130px;"/>
            <a href="${pageContext.request.contextPath}/frontDesk/singerListById.do?id=${singer.singerId}">
                <c:out value="${singer.singernameChinese}"/></a></div>
    </c:forEach>
     </div>
    <br/>
    <br/>
    <div clas="row">
    <c:forEach items="${pageSystem.data}" var="singer">
        <div class="col-md-3 text-center" style="height:20px">
            <a href="${pageContext.request.contextPath}/frontDesk/singerListById.do?id=${singer.singerId}">
                <c:out value="${singer.singernameChinese}"/></a></div>
    </c:forEach>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageSystem.pages > 0}">
                        <%
                            PageSystem<Singer> pageSystem = (PageSystem<Singer>) session.getAttribute("pageSystem");
                            for (int i = 0; i < pageSystem.getPages(); i++) {
                        %>
                        <li id="page<%=i%>"><a
                                href="${pageContext.request.contextPath}/frontDesk/singerCollection.do?page=<%=(i+1)%>&limit=8"><%=(i + 1)%>
                        </a></li>
                        <%
                            }
                        %>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>

</div><!-- 居中结束-->


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>


<footer class="main-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">友情链接</h4>

                </div>
            </div>

            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">我们用到的技术</h4>

                </div>
            </div>

            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">赞助商</h4>
                    <div class="content friend-links">

                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <span>Copyright &copy; <a href="#">都市猎人</a></span> |
            </div>
        </div>
    </div>
</div>


</body>
</html>
