<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/10/28
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="../../css/sign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menuType.css">
    <script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>

    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/image/con_bg.jpg");
        }
        .navbar{
            margin:20px 0px;
        }
        .copyright{
            background: #111;
            font-size: 13px;
            text-align: center;
            color: #555;
            padding-top: 14px;
            padding-bottom: 20px;
            border-top: 1px solid #303030;
        }
        .main-footer {
            margin-top:10px;
            background: #202020;
            padding: 35px 0 0;
            color: #959595;
        }
        .widget {
            margin-bottom: 35px;
        }
        .widget .title {
            margin-top: 0;
            padding-bottom: 7px;
            border-bottom: 1px solid #ebebeb;
            margin-bottom: 21px;
            position: relative;
        }
    </style>
</head>
<body>
<!-- 头部-->
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
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
                    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">首页<span class="sr-only">(current)</span></a></li>
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
                        <ul class="dropdown-menu" id="login-menu">
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

    <div class ="box">
        <div class="box1">
            <%@include file="../../iframe/menuType.jsp"%>
        </div>
        <div class="box2" id="box2-1" >
            <form class="form-horizontal" action="${pageContext.request.contextPath}/frontDesk/editDetailPersonal.do" method="post">
                <div class="form-group">
                    <div class="col-sm-4">
                        <input type="hidden" class="form-control" name="userId" id="userId" placeholder="Hidden" value="${user.userId}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userName" id="userName" placeholder="输入用户名" value="${user.userName}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="countName" class="col-sm-2 control-label">账号</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="countName" id="countName" placeholder="输入账号" value="${user.countName}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userSex" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userSex"id="userSex" placeholder="输入性别" value="${user.userSex}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userImage" class="col-sm-2 control-label">头像</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userImage" id="userImage" placeholder="输入图像路径" value="${user.userImage}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userEmail" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-4">
                        <input type="Email" class="form-control" name="userEmail" id="userEmail" placeholder="请输入邮箱" value="${user.userEmail}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userTypeId" class="col-sm-2 control-label">用户类型</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userTypeId" id="userTypeId" placeholder="请输入用户类型" value="${user.userTypeId}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">修改</button>
                        &nbsp;&nbsp;
                        <button type="reset" class="btn btn-default">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="box3" id="box3-1" style="display:none;">
            <table class=" songListTable" width="60%" >
                <thead>
                <tr class="text-center">
                    <td colspan="8">歌手</td>
                    <td colspan="8">操作</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <br>
            <div id="pagpaginationOneSinger">
            </div>

        </div>
        <div class="box4"id="box4-1" style="display:none;">
            <table class="singerListTable" width="60%">
                <thead>
                <tr class="text-center">
                    <td colspan="8">歌曲名</td>
                    <td colspan="8">歌手</td>
                    <td colspan="3">操作</td>
                </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
            <br>
            <div id="pagpaginationOneSong">
            </div>
        </div>

    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $("#firstpaneDiv .menu_nva:eq(0)").show();
        $("#firstpaneDiv h3.menu_head").click(function(){
            $(this).addClass("current").next("div.menu_nva").slideToggle(200).siblings("div.menu_nva").slideUp("slow");
            $(this).siblings().removeClass("current");
        });
        $("#secondpane .menu_nva:eq(0)").show();
        $("#secondpane h3.menu_head").mouseover(function(){
            $(this).addClass("current").next("div.menu_nva").slideDown(400).siblings("div.menu_nva").slideUp("slow");
            $(this).siblings().removeClass("current");
        });
    });
</script>
<script>
    function boxCheck(flag){
        var box2 =document.getElementById("box2-1");
        var box3 =document.getElementById("box3-1");
        var box4 =document.getElementById("box4-1");

        switch (flag) {
            case 1:
                box2.style.display='none';
                box3.style.display="";
                box4.style.display='none';
                box5.style.display='none';
                break;
            case 2:
                box2.style.display='none';
                box3.style.display='none';
                box4.style.display="";
                box5.style.display='none';
                break;
        }
    }
</script>
<script>


    //总记录数
    var totalNum = 0;

    //总页数
    var totalPage = 0;

    //默认每页显示数
    var avageNum = 10;

    //默认显示第一页
    var currentPage = 1;

    var userId =${user.userId};

    getSongList(currentPage, avageNum,userId);
    initPagination(totalPage, totalNum,userId);

    //与后台交互获取数据，异步加载到页面上
    function getSongList(pageNum, pageSize,userId) {
        currentPage = pageNum;
        $.ajax({
            url: "/frontDesk/collectionList.do",
            method: "get",
            data: {"page": pageNum, "limit": pageSize,"userId":userId},
            async: false,
            success: function (data) {
                var length = data.data.length;
                totalNum = data.total;
                totalPage = data.pages;
                for (var i = 0; i < length; i++) {
                    var songId = data.data[i].songId;
                    var songName=data.data[i].songName;
                    var singerId = data.data[i].singerId;
                    var singernameArt=data.data[i].singernameArt;
                    $(".songListTable tbody").append(
                        '<tr height=20px style="line-height: 24px" class="text-center">'+
                        '<td colspan="8"><a href="/musicPlayer/singerById.do?id='+singerId+'">'+singernameArt+'</td>'+
                        '<td colspan="8"> <span class="glyphicon glyphicon-share" ></span>\n' +
                        '   &nbsp;&nbsp;\n' +
                        '  <span class="glyphicon glyphicon-download-alt" ></span>\n' +
                        '</tr>'
                    )
                }

            }
        });
    }

    //初始化分页栏
    function initPagination(totalPage, totalNum,userId) {
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
                '<li id="page' + i + '"><a href="javascript:void(0);"  onclick="getSongList(' + i + ',' + avageNum +','+userId+ ')">' + i + '</a>'
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
            getSongList(currentPage - 1, avageNum,userId);
            checkA();
        } else if (aText == "下一页") {
            $(".pagination > li").removeClass("active");
            $("#page" + (currentPage + 1)).addClass("active");
            $(".songListTable tbody").empty();
            getSongList(currentPage + 1, avageNum,userId);
            checkA();
        } else {
            $(".pagination > li").removeClass("active");
            $(this).addClass("active");
            $(".songListTable tbody").empty();
            getSongList(aText, avageNum,userId);
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
<!-- 歌曲-->

<script>

    //总记录数
    var totalNum = 0;

    //总页数
    var totalPage = 0;

    //默认每页显示数
    var avageNum = 10;

    //默认显示第一页
    var currentPage = 1;

    var userId ='${user.userId}';

    getSingerList(currentPage, avageNum,userId);
    initPaginationS(totalPage, totalNum,userId);

    //与后台交互获取数据，异步加载到页面上
    function getSingerList(pageNum, pageSize,userId) {
        currentPage = pageNum;
        $.ajax({
            url: "/frontDesk/collectionListSong.do",
            method: "get",
            data: {"page": pageNum, "limit": pageSize,"userId":userId},
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
                    $(".singerListTable tbody").append(
                        '<tr>'+
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
    function initPaginationS(totalPage, totalNum,userId) {
        $('#pagpaginationOneSong').html(" ");
        $('#pagpaginationOneSong').append(
            '<ul class="pagination" style="display:inline;">' +
            '</ul>'
        )
        // onclick="getUserList('+ (currentPage - 1) + ','+ avageNum + ')"
        $("#pagpaginationOneSong ul").append(
            '<li><a href="javascript:void(0);" id="prev">上一页</a>'
        )
        for (var i = 1; i <= totalPage; i++) {
            $("#pagpaginationOneSong ul").append(
                '<li id="page' + i + '"><a href="javascript:void(0);"  onclick="getSingerList(' + i + ',' + avageNum +','+userId+ ')">' + i + '</a>'
            )
        }
        $("#pagpaginationOneSong ul").append(
            '<li><a href="javascript:void(0);"  id="next">下一页</a>'
        )
        $("select option[value=" + avageNum + "]").attr('selected', true)
        $("#page1").addClass("active");
        checkA();
    }


    //设置分页栏点击时候的高亮
    $("#pagpaginationOneSong").on("click", "li", function () {
        var aText = $(this).find('a').html();
        checkA();
        if (aText == "上一页") {
            $(".pagination > li").removeClass("active");
            $("#page" + (currentPage - 1)).addClass("active");
            $(".singerListTable tbody").empty();
            getSingerList(currentPage - 1, avageNum,userId);
            checkA();
        } else if (aText == "下一页") {
            $(".pagination > li").removeClass("active");
            $("#page" + (currentPage + 1)).addClass("active");
            $(".singerListTable tbody").empty();
            getSingerList(currentPage + 1, avageNum,userId);
            checkA();
        } else {
            $(".pagination > li").removeClass("active");
            $(this).addClass("active");
            $(".singerListTable tbody").empty();
            getSingerList(aText, avageNum,userId);
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
