<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/11/8
  Time: 13:52
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
    <title>${singer.singernameChinese}详细介绍</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/music.ico">
    <link rel="stylesheet" href="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../mplayer/css/mplayer.min.css">
    <link rel="stylesheet" href="../../css/foot.css">
    <link rel="stylesheet" href="../../css/sign.css">
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/image/con_bg.jpg");
        }
        .head-top {
            width: 100%;
            margin: 0px;
            padding: 0px;
            height: 200px;
            border-bottom: 1px #c2dd1a solid;
        }

        .head-top .col-md-3 {
            padding: 30px;
            width: 30%;
            height: 200px;
            float: left;
        }

        .head-top .col-md-9 {
            width: 70%;
            height: 200px;
        }

        .head-top .col-md-9 .up-top {
            border-bottom: 1px #c2dd1a solid;
            position: relative;
            width: 100%;
            height: 10px;
            top:10px;
            left:0px;
        }
        .head-top .col-md-9 .up-down {
            border-bottom: 1px #c2dd1a solid;
            position: relative;
            width: 100%;
            height: 20px;
            top:100px;
            left:0px;
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
                <li><a href="${pageContext.request.contextPath}/index.jsp">首页<span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/frontDesk/singerCollection.do?page=1&limit=8">歌手</a></li>
                <li><a href="${pageContext.request.contextPath}/frontDesk/musics/song_list.jsp">歌单</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">排行榜 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/classicallist.jsp">经典老歌榜</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/Networklist.jsp">网络红歌榜</a></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/KTVlist.jsp">KTV热门榜</a></li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/DJHotlist.jsp">动听DJ排行榜</a></li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/frontDesk/rankingList/balladlist.jsp">民谣排行榜</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/musicPlayer/searchSongList.do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="searchContext" placeholder="搜索音乐" >
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/frontDesk/register.do">免费注册</a></li>
                <li><a href="${pageContext.request.contextPath}/backstage/userCenter.do?id=${user.userId}">个人中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" onclick="start(${user.userId})">
                        <img id="myImage"  alt="Brand" src="<c:choose><c:when test="${user.userImage != null}">${user.userImage}</c:when><c:otherwise>/image/2.gif</c:otherwise></c:choose>" class="img-circle" style="height:23px;width:34px;"/>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu" id="login-menu"  style="display: none">
                        <li></li>
                        <li><a href="${pageContext.request.contextPath}/backstage/userDetail.do?id=${user.userId}">修改信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/backstage/userDetails.do?id=${user.userId}">安全管理</a></li>
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
    <div class="raw head-top">
        <div class="col-md-3 text-center">
            <img src="../../${singer.singerImage}" class="img-thumbnail"/>
        </div>
        <div class="col-md-9">
            <span class="up-top">
                <span style="float:left"><strong>${singer.singernameChinese}</strong></span>
                <a href="${pageContext.request.contextPath}/frontDesk/collectSongList.do?id=${singer.singerId}&name=${user.userId}"><button type="button" class="btn btn-default" style="float:right">
            <span class="glyphicon glyphicon-plus" aria-hidden="true">收藏</span></button></a>
           <span class="up-down">
               <ul style="list-style: none">
                <li><span class="glyphicon glyphicon-music" aria-hidden="true">单曲：&nbsp;${count}</span></li>
                <li><span class="glyphicon glyphicon-cd" aria-hidden="true">专辑：&nbsp;${count}</span></li>
                <li><span class="glyphicon glyphicon-facetime-video" aria-hidden="true">MV：&nbsp;${count}</span></li>
            </ul>
           </span>
        </div>
    </div>
    <script>

    </script>
    <div class="raw">
        <div class="col-md-12">
            <table class="table table-hover songListTable">
                <thead>
                 <tr class="text-center">
                     <th></th>
                     <th colspan="8" >歌曲</th>
                     <th colspan="8">专辑</th>
                     <th colspan="3">操作</th>
                 </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div id="pagpaginationOneSinger">
        </div>
    </div>

</div><!-- 居中结束-->


<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script>

    //总记录数
    var totalNum = 0;

    //总页数
    var totalPage = 0;

    //默认每页显示数
    var avageNum = 10;

    //默认显示第一页
    var currentPage = 1;

    var singerById ='${singer.singerId}';
    getSongList(currentPage, avageNum,singerById);
    initPagination(totalPage, totalNum,singerById);

    //与后台交互获取数据，异步加载到页面上
    function getSongList(pageNum, pageSize,singerId) {
        currentPage = pageNum;
        $.ajax({
            url: "/frontDesk/personalPage.do",
            method: "get",
            data: {"page": pageNum, "limit": pageSize,"singerId":singerId},
            async: false,
            success: function (data) {
                var length = data.data.length;
                totalNum = data.total;
                totalPage = data.pages;
                for (var i = 0; i < length; i++) {
                    var songId = data.data[i].songId;
                    var singerId= data.data[i].singerId;
                    var songName=data.data[i].songName;
                    var singernameArt=data.data[i].singernameArt;
                    $(".songListTable tbody").append(
                        '<tr>'+
                        '<td><a href="${pageContext.request.contextPath}/frontDesk/collectSong1List.do?id='+songId+'&name=${user.userId}">'+
                        '<span class="glyphicon glyphicon-heart-empty" ></span></a></td>'+
                        '<td colspan="8"><a href="/musicPlayer/songById.do?id='+songId+'">'+songName+'</td>'+
                        '<td colspan="8"><a href="/musicPlayer/singerById.do?id='+singerId+'">'+singernameArt+'</td>'+
                        '<td colspan="3"> <span class="glyphicon glyphicon-share" ></span>\n' +
                        '   &nbsp;&nbsp;\n' +
                        '  <span class="glyphicon glyphicon-download-alt" ></span>\n' +
                        '</tr>'
                    )
                }

            }
        });
    }

    //初始化分页栏
    function initPagination(totalPage, totalNum,singerId) {
        $('#pagpaginationOneSinger').html(" ");
        $('#pagpaginationOneSinger').append(
            '<ul class="pagination" style="display:inline;">' +
            '</ul>'
        )
        // onclick="getUserList('+ (currentPage - 1) + ','+ avageNum + ')"
        $("#pagpaginationOneSinger ul").append(
            '<li><a href="javascript:void(0);" id="prev">上一页</a>'
        )
        for (var i = 1; i <= totalPage; i++) {
            $("#pagpaginationOneSinger ul").append(
                '<li id="page' + i + '"><a href="javascript:void(0);"  onclick="getSongList(' + i + ',' + avageNum +','+singerId+ ')">' + i + '</a>'
            )
        }
        $("#pagpaginationOneSinger ul").append(
            '<li><a href="javascript:void(0);"  id="next">下一页</a>'
        )
        $("select option[value=" + avageNum + "]").attr('selected', true)
        $("#page1").addClass("active");
        checkA();
    }


    //设置分页栏点击时候的高亮
    $("#pagpaginationOneSinger").on("click", "li", function () {
        var aText = $(this).find('a').html();
        checkA();
        if (aText == "上一页") {
            $(".pagination > li").removeClass("active");
            $("#page" + (currentPage - 1)).addClass("active");
            $(".songListTable tbody").empty();
            getSongList(currentPage - 1, avageNum,singerById);
            checkA();
        } else if (aText == "下一页") {
            $(".pagination > li").removeClass("active");
            $("#page" + (currentPage + 1)).addClass("active");
            $(".songListTable tbody").empty();
            getSongList(currentPage + 1, avageNum,singerById);
            checkA();
        } else {
            $(".pagination > li").removeClass("active");
            $(this).addClass("active");
            $(".songListTable tbody").empty();
            getSongList(aText, avageNum,singerById);
            currentPage = aText - 1;
        }
    })

    //因为其他地方都需要用到这两句，所以封装出来
    //主要是用于检测当前页如果为首页，或者尾页时，上一页和下一页设置为不可选中状态
    function checkA() {
        currentPage == 1 ? $("#prev").addClass("btn btn-default disabled") : $("#prev").removeClass("btn btn-default disabled");
        currentPage == totalPage ? $("#next").addClass("btn btn-default disabled") : $("#next").removeClass("btn btn-default disabled");
    }
</script>


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
