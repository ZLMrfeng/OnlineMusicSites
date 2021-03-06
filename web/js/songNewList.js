﻿//总记录数
var totalNum = 0;

//总页数
var totalPage = 0;

//默认每页显示数
var avageNum = 10;

//默认显示第一页
var currentPage = 1;


getSongNewList(currentPage, avageNum);
initPagination(totalPage, totalNum);

//与后台交互获取数据，异步加载到页面上
function getSongNewList(pageNum, pageSize) {
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
                var songName=data.data[i].songName;
                var singernameArt=data.data[i].singernameArt;
                var songLongTime=data.data[i].songLongTime;
                var songReleseTime=data.data[i].songReleseTime;
                $(".songNewListTable tbody").append(
                    '<tr>'+
                    '<td></td>'+
                    '<td>'+songReleseTime+'</td>'+
                    '<td>'+songName+'</td>'+
                    '<td><a href="#">'+singernameArt+'</a></td>'+
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
    $('#paginationNew').html(" ");
    $('#paginationNew').append(
        '<ul class="paginationNews" style="display:inline;">' +
        '</ul>'
    )
    // onclick="getUserList('+ (currentPage - 1) + ','+ avageNum + ')"
    $("#paginationNew ul").append(
        '<li><a href="javascript:void(0);" id="prev">上一页</a>'
    )
    for (var i = 1; i <= totalPage; i++) {
        $("#paginationNew ul").append(
            '<li id="page' + i + '"><a href="javascript:void(0);"  onclick="getSongNewList(' + i + ',' + avageNum + ')">' + i + '</a>'
        )
    }
    $("#paginationNew ul").append(
        '<li><a href="javascript:void(0);"  id="next">下一页</a>'
    )
    $("select option[value=" + avageNum + "]").attr('selected', true)
    $("#page1").addClass("active");
    checkA();
}


//设置分页栏点击时候的高亮
$("#paginationNew").on("click", "li", function () {
    var aText = $(this).find('a').html();
    checkA();
    if (aText == "上一页") {
        $(".paginationNews > li").removeClass("active");
        $("#page" + (currentPage - 1)).addClass("active");
        $(".songNewListTable tbody").empty();
        getSongNewList(currentPage - 1, avageNum);
        checkA();
    } else if (aText == "下一页") {
        $(".paginationNews > li").removeClass("active");
        $("#page" + (currentPage + 1)).addClass("active");
        $(".songNewListTable tbody").empty();
        getSongNewList(currentPage + 1, avageNum);
        checkA();
    } else {
        $(".paginationNews > li").removeClass("active");
        $(this).addClass("active");
        $(".songNewListTable tbody").empty();
        getSongNewList(aText, avageNum);
        currentPage = aText - 1;
    }
})

//因为其他地方都需要用到这两句，所以封装出来
//主要是用于检测当前页如果为首页，或者尾页时，上一页和下一页设置为不可选中状态
function checkA() {
    currentPage == 1 ? $("#prev").addClass("btn btn-default disabled") : $("#prev").removeClass("btn btn-default disabled");
    currentPage == totalPage ? $("#next").addClass("btn btn-default disabled") : $("#next").removeClass("btn btn-default disabled");
}