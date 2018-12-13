function addSinger(){
    layer.open({
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['700px', '450px'],
        type: 1,
        closeBtn: false,
        shift: 25,
        content:   '<blockquote class="layui-elem-quote layui-text">注意事项: 请填写相关的数据信息! </blockquote>' +
            '<form class="layui-form"> ' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">中文名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singernameChinese"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">外文名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singernameForgin"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">艺名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singernameArt"  class="layui-input" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">性别</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerSex"  class="layui-input"  >' +
             '<label class="layui-form-label">(*0表示男；1表示女*)</label>' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">出生地</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerAddress"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">出生日期</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerBirthday"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">爱好</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerHobby"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">代表作品</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerProduction"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">出道日期</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerDebut"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">简介</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerIntroduction"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">图像路径</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerImage"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">工作地点</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="companyName"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">访问量</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerVisitorVolume"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                singernameChinese: $("input[name='singernameChinese']").val(),
                singernameForgin: $("input[name='singernameForgin']").val(),
                singernameArt: $("input[name='singernameArt']").val(),
                singerSex: $("input[name='singerSex']").val(),
                singerAddress: $("input[name='singerAddress']").val(),
                singerBirthday: $("input[name='singerBirthday']").val(),
                singerHobby: $("input[name='singerHobby']").val(),
                singerProduction: $("input[name='singerProduction']").val(),
                singerDebut: $("input[name='singerDebut']").val(),
                singerIntroduction: $("input[name='singerIntroduction']").val(),
                singerImage: $("input[name='singerImage']").val(),
                companyName: $("input[name='companyName']").val(),
                singerVisitorVolume: $("input[name='singerVisitorVolume']").val()
                  
            };
            console.log(formData);
            $.post('/backstage/addSinger.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/singerManager.jsp");
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
function editSinger(data){
    layer.open({
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['700px', '450px'],
        type: 1,
        closeBtn: false,
        shift: 25,
        content:  '<blockquote class="layui-elem-quote layui-text">注意事项: 请填写相关的数据信息! </blockquote>' +
            '<form class="layui-form"> ' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">ID</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerId"  class="layui-input" value="'+data.singerId+'">' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">中文名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singernameChinese"  class="layui-input" value="'+data.singernameChinese+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">外文名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singernameForgin"  class="layui-input" value="'+data.singernameForgin+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">艺名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singernameArt"  class="layui-input" value="'+data.singernameArt+'">' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">性别</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerSex"  class="layui-input" value="'+data.singerSex+'" >' +
             '<label class="layui-form-label">(*0表示男；1表示女*)</label>' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">出生地</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerAddress"  class="layui-input" value="'+data.singerAddress+'" >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">出生日期</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerBirthday"  class="layui-input"  value="'+data.singerBirthday+'">' +
            '<label class="layui-form-label">(格式为 日/月/年 02/11/2018)</label>' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">爱好</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerHobby"  class="layui-input"  value="'+data.singerHobby+'">' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">代表作品</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerProduction"  class="layui-input" value="'+data.singerProduction+'" >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">出道日期</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerDebut"  class="layui-input" value="'+data.singerDebut+'" >' +
            '<label class="layui-form-label">(格式为 日/月/年 02/11/2018)</label>' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">简介</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerIntroduction"  class="layui-input" value="'+data.singerIntroduction+'" >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">图像路径</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerImage"  class="layui-input" value="'+data.singerImage+'" >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">工作地点</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="companyName"  class="layui-input" value="'+data.companyName+'" >' +
            '</div></div>' +
            '</div>' +
             '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">访问量</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="singerVisitorVolume"  class="layui-input"  value="'+data.singerVisitorVolume+'">' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                singerId: $("input[name='singerId']").val(),
                singernameChinese: $("input[name='singernameChinese']").val(),
                singernameForgin: $("input[name='singernameForgin']").val(),
                singernameArt: $("input[name='singernameArt']").val(),
                singerSex: $("input[name='singerSex']").val(),
                singerAddress: $("input[name='singerAddress']").val(),
                singerBirthday: $("input[name='singerBirthday']").val(),
                singerHobby: $("input[name='singerHobby']").val(),
                singerProduction: $("input[name='singerProduction']").val(),
                singerDebut: $("input[name='singerDebut']").val(),
                singerIntroduction: $("input[name='singerIntroduction']").val(),
                singerImage: $("input[name='singerImage']").val(),
                companyName: $("input[name='companyName']").val(),
                singerVisitorVolume: $("input[name='singerVisitorVolume']").val()

            };
            console.log(formData);
            $.post('/backstage/singerEdit.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/singerManager.jsp");
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



var totalNum = 0;

//总页数
var totalPage = 0;

//默认每页显示数
var avageNum = 6;

//默认显示第一页
var currentPage = 1;

getSingerList(currentPage,avageNum);
initPagination(totalPage,totalNum);


//与后台交互获取数据，异步加载到页面上
function getSingerList(pageNum,pageSize){
    currentPage = pageNum;

    $.ajax({
        url:"/frontDesk/index.do",
        method:"get",
        data:{"page":pageNum,"limit":pageSize},
        async:false,
        success:function(data){
                var length = data.data.length;

                    totalNum=data.total;
                    totalPage=data.pages;
                for(var  i = 0;i<length;i++){
                    var singernameChinese = data.data[i].singernameChinese;
                    var singernameForgin= data.data[i].singernameForgin;
                    var singernameArt= data.data[i].singernameArt;
                    var singerSex = data.data[i].singerSex;
                    var singerAddress= data.data[i].singerAddress;
                    var singerBirthday= data.data[i].singerBirthday;
                    var singerHobby = data.data[i].singerHobby;
                    var singerProduction= data.data[i].singerProduction;
                    var singerDebut= data.data[i].singerDebut;
                    var singerIntroduction = data.data[i].singerIntroduction;
                    var singerImage = data.data[i].singerImage;
                    var singerId = data.data[i].singerId;
                    $(".singerListTable").append(
                        '<div class="col-md-4">'+
                        '<div class="thumbnail">'+
                       ' <img src="'+singerImage+'" alt="..." class="img-thumbnail" style="width:130px;height: 130px">'+
                        '<div class="caption">'+
                        '<h5>'+singernameChinese+'</h5>'+
                        '<p><a href="/frontDesk/singerListById.do?id='+singerId+'" class="btn btn-primary" role="button">歌手作品>></a> </p>'+
                        '</div>'+
                        '</div>'+
                        '</div>'
                    )
                }

        }
    });
}

//初始化分页栏
function initPagination(totalPage,totalNum) {
    $('#paginations').html(" ");
    $('#paginations').append(
        '<ul class="pagination" style="display:inline;">' +
        '</ul>'
    )
    // onclick="getUserList('+ (currentPage - 1) + ','+ avageNum + ')"
    $("#paginations ul").append(
        '<li><a href="javascript:void(0);" id="prev">上一页</a>'
    )
    for (var i = 1; i <= totalPage; i++) {
        $("#paginations ul").append(
            '<li id="page'+i+'"><a href="javascript:void(0);"  onclick="getSingerList(' + i + ',' + avageNum + ')">' + i + '</a>'
        )
    }
    $("#paginations ul").append(
        '<li><a href="javascript:void(0);"  id="next">下一页</a>'

    )
    $("select option[value=" + avageNum + "]").attr('selected', true)
    $("#page1").addClass("active");
    checkA();
}

//很关键，因为执行initPagination方法时，将select删除再重新添加，所以需要先将select上的结点移除off
//然后再绑定结点on，如果不这么做，会出现change事件只被触发一次。
$(document).off('change','#dataNum').on('change','#dataNum',function(){
    avageNum = $(this).children('option:selected').val();
    currentPage = 1;
    getSingerList(currentPage,avageNum);
    initPagination(totalPage,totalNum);
});

//设置分页栏点击时候的高亮
$("#paginations").on("click","li",function(){
    var aText = $(this).find('a').html();
    checkA();
    if (aText == "上一页"){
        $(".pagination > li").removeClass("active");
        $("#page"+(currentPage -1)).addClass("active");
        $(".singerListTable").empty();
        getSingerList(currentPage - 1,avageNum);
        checkA();
    }else if(aText == "下一页"){
        $(".pagination > li").removeClass("active");
        $("#page"+(currentPage + 1)).addClass("active");
        $(".singerListTable").empty();
        getSingerList(currentPage + 1,avageNum);
        checkA();
    }else{
        $(".pagination > li").removeClass("active");
        $(this).addClass("active");
        $(".singerListTable").empty();
        getSingerList(aText,avageNum);
        currentPage=aText - 1;
    }
})


//因为其他地方都需要用到这两句，所以封装出来
//主要是用于检测当前页如果为首页，或者尾页时，上一页和下一页设置为不可选中状态
function checkA() {
    currentPage == 1 ? $("#prev").addClass("btn btn-default disabled") : $("#prev").removeClass("btn btn-default disabled");
    currentPage == totalPage ? $("#next").addClass("btn btn-default disabled") : $("#next").removeClass("btn btn-default disabled");
}