<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/11/2
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>音乐客栈后台</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body >
<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/songList.js"  charset="UTF-8"></script>

<script>
    layui.config({
        version: '1535898708509' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块





        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 420
            ,url: '${pageContext.request.contextPath}/backstage/songManager.do' //数据接口
            ,title: '用户表'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            ,limit:10
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left' , totalRowText: '合计：'}
                ,{field: 'songId', title: 'ID', width:80, sort: true, fixed: 'left' ,totalRow: true}
                ,{field: 'songName', title: '歌名', width:215}
                ,{field: 'singerId', title: '歌手编号', width:215}
                ,{field: 'songLrc', title: '歌词路径', width:215}
                ,{field: 'songReleseTime', title: '歌曲发行时间', width:215,templet:'#createTime'}
                ,{field:'songLongTime',title:'时长',width:215}
                ,{field: 'songNumberOfClick', title: '点击量', width:215}
                ,{field: 'songPath', title: '歌曲路径', width:215}
                ,{fixed: 'right', width: 215, align:'center', toolbar: '#barDemo'}
            ]],

            limits:[10,20,30,40,50]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    addSong();
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        editSong(checkStatus.data[0]);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    console.log(obj);
                    console.log(data);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/backstage/delSong.do",
                        type:"POST",
                        data:{"songId":data.songId},
                        dataType:"json",
                        success:function(data){
                            if(data == null){
                                layer.msg("删除失败");
                            }else{
                                //删除一行
                                obj.del();
                                //关闭弹框
                                layer.close(index);
                                layer.msg("删除成功");
                                layer.closeAll();
                                location.replace("/backstage/songManager.jsp");
                            }
                        },
                        error:function(){
                            alert(data);
                        }
                    });
                    //向服务端发送删除指令
                });
            }
            else if(layEvent === 'edit'){
                layer.msg('编辑操作');
                console.log(data);
                console.log(obj);
                //layer.alert('编辑行：<br>'+ JSON.stringify(data))
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
                        '<input type="text"  required lay-verify="required" name="songId"  class="layui-input" value="'+data.songId+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">歌曲名</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="songName"  class="layui-input" value="'+data.songName+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">歌手编号</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="singerId"  class="layui-input" value="'+data.singerId+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">歌词路径</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="songLrc"  class="layui-input" value="'+data.songLrc+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">歌曲发行时间</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="songReleseTime"  class="layui-input" value="'+data.songReleseTime+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">时长</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="songLongTime"  class="layui-input" value="'+data.songLongTime+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">点击量</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="songNumberOfClick"  class="layui-input" value="'+data.songNumberOfClick+'" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">歌曲路径</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="songPath"  class="layui-input" value="'+data.songPath+'" >' +
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
                            songLongTime:$("input[name='songLongTime']").val(),
                            songNumberOfClick: $("input[name='songNumberOfClick']").val(),
                            songPath:$("input[name='songPath']").val()
                        };
                        console.log(formData);
                        $.post('${basePath}songEdit.do', formData, function (data) {

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

        });


    });

</script>
<script src="../js/dateFormatSystem.js" type="text/javascript" charset="utf-8"></script>
<script id="createTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.songReleseTime);
    return date.Format("yyyy-MM-dd");
    }}
</script>
</body>
</html>

