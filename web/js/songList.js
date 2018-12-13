function addSong() {
    layer.open({
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['700px', '450px'],
        type: 1,
        closeBtn: false,
        shift: 25,
        content: '<blockquote class="layui-elem-quote layui-text">注意事项: 请填写相关的数据信息! </blockquote>' +
            '<form class="layui-form"> ' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌曲名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songName"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌手编号</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerId"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌词路径</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songLrc"  class="layui-input" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌曲发行时间</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songReleseTime"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">时长</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songLongTime"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">点击量</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songNumberOfClick"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌曲路径</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songPath"  class="layui-input" >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                songName: $("input[name='songName']").val(),
                singerId: $("input[name='singerId']").val(),
                songLrc: $("input[name='songLrc']").val(),
                songReleseTime: $("input[name='songReleseTime']").val(),
                songLongTime: $("input[name='songLongTime']").val(),
                songNumberOfClick: $("input[name='songNumberOfClick']").val(),
                songPath:$("input[name='songPath']").val()
            };
            console.log(formData);
            $.post('/backstage/addSong.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/songManager.jsp");
                }
            });
        },
        btn2: function (index, layero) {
            layer.msg("取消");
            //return false 开启该代码可禁止点击该按钮关闭
        },
        cancel: function () {
            layer.msg("关闭窗口");
            //右上角关闭回调
            //return false 开启该代码可禁止点击该按钮关闭
        },
        success: function () {
            layui.use('form', function () {
                var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功
                form.render('checkbox');
                form.on('checkbox(istrue)', function (data) {
                    /* if(data.elem.checked){
                     emailConfig['isenterprise']=1;
                     }; //是否被选中，true或者false*/
                });
            });
        }
    });
}

function editSong(data) {
    layer.open({
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['700px', '450px'],
        type: 1,
        closeBtn: false,
        shift: 25,
        content: '<blockquote class="layui-elem-quote layui-text">注意事项: 请填写相关的数据信息! </blockquote>' +
            '<form class="layui-form"> ' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">ID</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songId"  class="layui-input" value="' + data.songId + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌曲名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songName"  class="layui-input" value="' + data.songName + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌手编号</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerId"  class="layui-input" value="' + data.singerId + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌词路径</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songLrc"  class="layui-input" value="' + data.songLrc + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌曲发行时间</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songReleseTime"  class="layui-input" value="' + data.songReleseTime + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">时长</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songLongTime"  class="layui-input" value="' + data.songLongTime + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">点击量</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songNumberOfClick"  class="layui-input" value="' + data.songNumberOfClick + '" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">歌曲路径</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="songPath"  class="layui-input" value="' + data.songPath + '" >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                songId: $("input[name='songId']").val(),
                songName: $("input[name='songName']").val(),
                singerId: $("input[name='singerId']").val(),
                songLrc: $("input[name='songLrc']").val(),
                songReleseTime: $("input[name='songReleseTime']").val(),
                songLongTime: $("input[name='songLongTime']").val(),
                songNumberOfClick: $("input[name='songNumberOfClick']").val(),
                songPath:$("input[name='songPath']").val()

            };
            console.log(formData);
            $.post('/backstage/songEdit.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/songManager.jsp");
                }
            });
        },
        btn2: function (index, layero) {
            layer.msg("取消");
            //return false 开启该代码可禁止点击该按钮关闭
        },
        cancel: function () {
            layer.msg("关闭窗口");
            //右上角关闭回调
            //return false 开启该代码可禁止点击该按钮关闭
        },
        success: function () {
            layui.use('form', function () {
                var form = layui.form; //只有执行了这一步，部分表单元素才会修饰成功
                form.render('checkbox');
                form.on('checkbox(istrue)', function (data) {
                    /* if(data.elem.checked){
                     emailConfig['isenterprise']=1;
                     }; //是否被选中，true或者false*/
                });
            });
        }
    });

}


//总记录数
var totalNum = 0;

//总页数
var totalPage = 0;

//默认每页显示数
var avageNum = 10;

//默认显示第一页
var currentPage = 1;


getSongList(currentPage, avageNum);
initPagination(totalPage, totalNum);

//与后台交互获取数据，异步加载到页面上
function getSongList(pageNum, pageSize) {
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
                $(".songListTable tbody").append(
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
    $('#pagination').html(" ");
    $('#pagination').append(
        '<ul class="pagination" style="display:inline;">' +
        '</ul>'
    )
    // onclick="getUserList('+ (currentPage - 1) + ','+ avageNum + ')"
    $("#pagination ul").append(
        '<li><a href="javascript:void(0);" id="prev">上一页</a>'
    )
    for (var i = 1; i <= totalPage; i++) {
        $("#pagination ul").append(
            '<li id="page' + i + '"><a href="javascript:void(0);"  onclick="getSongList(' + i + ',' + avageNum + ')">' + i + '</a>'
        )
    }
    $("#pagination ul").append(
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
        $(".pagination > li").removeClass("active");
        $("#page" + (currentPage - 1)).addClass("active");
        $(".songListTable tbody").empty();
        getSongList(currentPage - 1, avageNum);
        checkA();
    } else if (aText == "下一页") {
        $(".pagination > li").removeClass("active");
        $("#page" + (currentPage + 1)).addClass("active");
        $(".songListTable tbody").empty();
        getSongList(currentPage + 1, avageNum);
        checkA();
    } else {
        $(".pagination > li").removeClass("active");
        $(this).addClass("active");
        $(".songListTable tbody").empty();
        getSongList(aText, avageNum);
        currentPage = aText - 1;
    }
})

//因为其他地方都需要用到这两句，所以封装出来
//主要是用于检测当前页如果为首页，或者尾页时，上一页和下一页设置为不可选中状态
function checkA() {
    currentPage == 1 ? $("#prev").addClass("btn btn-default disabled") : $("#prev").removeClass("btn btn-default disabled");
    currentPage == totalPage ? $("#next").addClass("btn btn-default disabled") : $("#next").removeClass("btn btn-default disabled");
}