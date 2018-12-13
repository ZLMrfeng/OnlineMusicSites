//总记录数
var totalNum = 0;

//总页数
var totalPage = 0;

//默认每页显示数
var avageNum = 8;

//默认显示第一页
var currentPage = 1;


getSingerRankingList(currentPage, avageNum);

//与后台交互获取数据，异步加载到页面上
function getSingerRankingList(pageNum, pageSize) {
    currentPage = pageNum;
    $.ajax({
        url: "/frontDesk/generalList.do",
        method: "get",
        data: {"page": pageNum, "limit": pageSize},
        async: false,
        success: function (data) {
            var length = data.data.length;
            for (var i = 0; i < length; i++) {
                var songId = data.data[i].songId;
                var songName = data.data[i].songName;
                var singernameArt = data.data[i].singernameArt;
                var id = i + 1;
                $(".singerRankingList ").append(
                    '<a href="/musicPlayer/songById.do?id='+songId+'" class="list-group-item list-group-item-success">' +
                    '<ul class="list-inline">' +
                    '<li>'+id+'</li>'+
                    '<li>'+songName+'</li>'+
                    '<li>'+singernameArt+'</li>'+
                    '</ul>'+
                    '</a>'
                )
            }

        }
    });
}
