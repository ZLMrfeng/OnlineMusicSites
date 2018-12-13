
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
                var songId= data.data[i].songId;
                var songName=data.data[i].songName;
                var singernameArt=data.data[i].singernameArt;
                $(".songListTable tbody").append(
                    '<tr>'+
                    '<td><span class="glyphicon glyphicon-heart-empty" ></span></td>'+
                    '<td colspan="8"><a href="/musicPlayer/songById.do?id='+songId+'" >'+songName+'</a></td>'+
                    '<td colspan="8"><a href="/musicPlayer/songById.do?id='+songId+'" >'+singernameArt+'</a></td>'+
                    '<td colspan="3"> <span class="glyphicon glyphicon-heart-empty" ></span>\n' +
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