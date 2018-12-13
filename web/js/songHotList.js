//总记录数
var totalNum = 0;

//总页数
var totalPage = 0;

//默认每页显示数
var avageNum = 10;

//默认显示第一页
var currentPage = 1;


getSongHotList(currentPage, avageNum);
initPagination(totalPage, totalNum);

//与后台交互获取数据，异步加载到页面上
function getSongHotList(pageNum, pageSize) {
    currentPage = pageNum;
    $.ajax({
        url: "/frontDesk/generalList.do",
        method: "get",
        data: {"page": pageNum, "limit": pageSize},
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
                var songLongTime=data.data[i].songLongTime;
                var songReleseTime=data.data[i].songReleseTime;
                $(".songHotListTable tbody").append(
                    '<tr>'+
                    '<td></td>'+
                    '<td><a href="">'+songReleseTime+'</td>'+
                    '<td><a href="/musicPlayer/songById.do?id='+songId+'">'+songName+'</a></td>'+
                    '<td><a href="/musicPlayer/singerById.do?id='+singerId+'">'+singernameArt+'</a></td>'+
                    '<td>'+songLongTime+'</td>'+
                    '<td> <span class="glyphicon glyphicon-heart-empty" ></span>\n' +
                    '                     &nbsp;&nbsp;\n' +
                    '                     <span class="glyphicon glyphicon-download-alt" ></span>\n' +
                    '</tr>'
                )
            }

        }
    });
}

//初始化分页栏
function initPagination(totalPage, totalNum) {
    $('#paginationHot').html(" ");
    $('#paginationHot').append(
        '<ul class="paginationHots" style="display:inline;">' +
        '</ul>'
    )
    // onclick="getUserList('+ (currentPage - 1) + ','+ avageNum + ')"
    $("#paginationHot ul").append(
        '<li><a href="javascript:void(0);" id="prev">上一页</a>'
    )
    for (var i = 1; i <= totalPage; i++) {
        $("#paginationHot ul").append(
            '<li id="page' + i + '"><a href="javascript:void(0);"  onclick="getSongHotList(' + i + ',' + avageNum + ')">' + i + '</a>'
        )
    }
    $("#paginationHot ul").append(
        '<li><a href="javascript:void(0);"  id="next">下一页</a>'
    )
    $("select option[value=" + avageNum + "]").attr('selected', true)
    $("#page1").addClass("active");
    checkA();
}


//设置分页栏点击时候的高亮
$("#pagination").on("click", "li", function () {
    var aText = $(this).find('a').html();
    checkA();
    if (aText == "上一页") {
        $(".paginationHots > li").removeClass("active");
        $("#page" + (currentPage - 1)).addClass("active");
        $(".songHotListTable tbody").empty();
        getSongHotList(currentPage - 1, avageNum);
        checkA();
    } else if (aText == "下一页") {
        $(".paginationHots > li").removeClass("active");
        $("#page" + (currentPage + 1)).addClass("active");
        $(".songHotListTable tbody").empty();
        getSongHotList(currentPage + 1, avageNum);
        checkA();
    } else {
        $(".paginationHots > li").removeClass("active");
        $(this).addClass("active");
        $(".songHotListTable tbody").empty();
        getSongHotList(aText, avageNum);
        currentPage = aText - 1;
    }
})

//因为其他地方都需要用到这两句，所以封装出来
//主要是用于检测当前页如果为首页，或者尾页时，上一页和下一页设置为不可选中状态
function checkA() {
    currentPage == 1 ? $("#prev").addClass("btn btn-default disabled") : $("#prev").removeClass("btn btn-default disabled");
    currentPage == totalPage ? $("#next").addClass("btn btn-default disabled") : $("#next").removeClass("btn btn-default disabled");
}