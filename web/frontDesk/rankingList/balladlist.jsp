<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/10/28
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../iframe/head.jsp"%>
<div class="container">
<div class="raw">
    <div class="col-md-12">
        <span class="glyphicon glyphicon-flag" style="font-size: large;">民谣排行榜</span>
        <table class="table table-hover songListTable">
            <thead>
            <tr class="text-center">
                <td></td>
                <td colspan="8" >歌曲</td>
                <td colspan="8">歌手</td>
                <td colspan="3">操作</td>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <div id="pagpaginationOneSinger">
    </div>
</div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="../../bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script>


    //总记录数
    var totalNum = 0;

    //总页数
    var totalPage = 0;

    //默认每页显示数
    var avageNum = 10;

    //默认显示第一页
    var currentPage = 1;

    var singerById =94001;
    var a=1;//全局排行
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
                    var songName=data.data[i].songName;
                    var singerId = data.data[i].singerId;
                    var singernameArt=data.data[i].singernameArt;
                    $(".songListTable tbody").append(
                        '<tr>'+
                        '<td><a href="${pageContext.request.contextPath}/frontDesk/collectSong1List.do?id='+songId+'&name=${user.userId}">'+
                        '<span class="glyphicon glyphicon-heart-empty" ></span></a>&nbsp;&nbsp;'+(a++)+'</td>'+
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
            a = 1;
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
            a = 1;
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
<%@ include file="../../iframe/loginHide.jsp" %>

<div class="bottom_base">
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
</div>

</body>
</html>
