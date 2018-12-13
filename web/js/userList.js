 function addUser(){
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
                        '<label class="layui-form-label">用户名</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="userName"  class="layui-input"  >' +
                        '</div></div>' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">账号名</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="countName"  class="layui-input"  >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">密码</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="countPassword"  class="layui-input"  >' +
                        '</div></div>' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">性别</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="userSex"    class="layui-input" >' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">邮箱</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="userEmail"  class="layui-input" >' +
                        '</div></div>' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">图像</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="userImage"  class="layui-input" >' +
                        '</div></div>' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">创建时间</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text"  required lay-verify="required" name="createDate"    class="layui-input">' +
                        '</div></div>' +
                        '</div>' +
                        '<div class="layui-form-item">' +
                        '<div class="layui-inline">' +
                        '<label class="layui-form-label">用户类型</label>' +
                        '<div class="layui-input-inline">' +
                        '<input type="text" required lay-verify="required" name="userTypeId"  class="layui-input">' +
                        '</div></div>' +
                        '</div>' +
                        '</form>',
                    btnAlign: 'c',
                    btn: ['确定', '取消'],
                    yes: function (index, layero) {

                        var formData = {
                            userName: $("input[name='userName']").val(),
                            countName: $("input[name='countName']").val(),
                            countPassword: $("input[name='countPassword']").val(),
                            userSex: $("input[name='userSex']").val(),
                            userEmail: $("input[name='userEmail']").val(),
                            userImage:$("input[name='userImage']").val(),
                            createDate: $("input[name='createDate']").val(),
                            userTypeId: $("input[name='userTypeId']").val()
                        };
                        console.log(formData);
                        $.post('/backstage/userAdd.do', formData, function (data) {

                            console.log(window.location.href);
                            //判断是否发送成功
                            if (data.code == 200) {
                                layer.msg("保存失败...", {type: 1});
                            } else {
                                layer.close(index);
                                layer.closeAll();
                                location.replace("/backstage/UserManager.jsp");
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

function editUser(data) {

    layer.open({
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['700px', '550px'],
        type: 1,
        closeBtn: false,
        shift: 25,
        content: '<blockquote class="layui-elem-quote layui-text">注意事项: 请填写相关的数据信息! </blockquote>' +
            '<form class="layui-form"> ' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">ID</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userId"  class="layui-input" value="'+data.userId+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">用户名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userName"  class="layui-input" value="'+data.userName+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">账号名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="countName"  class="layui-input" value="'+data.countName+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">密码</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="countPassword"  class="layui-input" value="'+data.countPassword+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">性别</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userSex"    class="layui-input" value="'+data.userSex+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">邮箱</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userEmail"  class="layui-input" value="'+data.userEmail+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">图像</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userImage"  class="layui-input" value="'+data.userImage+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">创建时间</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="createDate"    class="layui-input" value="'+data.createDate+'">' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">用户类型</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text" required lay-verify="required" name="userTypeId"  class="layui-input" value="'+data.userTypeId+'" >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                userId: $("input[name='userId']").val(),
                userName: $("input[name='userName']").val(),
                countName: $("input[name='countName']").val(),
                countPassword: $("input[name='countPassword']").val(),
                userSex: $("input[name='userSex']").val(),
                userEmail: $("input[name='userEmail']").val(),
                userImage:$("input[name='userImage']").val(),
                createDate: $("input[name='createDate']").val(),
                userTypeId: $("input[name='userTypeId']").val()
            };
            console.log(formData);
            $.post('/backstage/userEdit.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/UserManager.jsp");
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

function checkUser(data){
    layer.open({
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['700px', '550px'],
        type: 1,
        closeBtn: false,
        shift: 25,
        content: '<blockquote class="layui-elem-quote layui-text">注意事项: 请填写相关的数据信息! </blockquote>' +
            '<form class="layui-form"> ' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">ID</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userId"  class="layui-input" value="'+data.userId+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">用户名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userName"  class="layui-input" value="'+data.userName+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">账号名</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="countName"  class="layui-input" value="'+data.countName+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">密码</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="countPassword"  class="layui-input" value="'+data.countPassword+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">性别</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userSex"    class="layui-input" value="'+data.userSex+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">邮箱</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userEmail"  class="layui-input" value="'+data.userEmail+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">图像</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="userImage"  class="layui-input" value="'+data.userImage+'" >' +
            '</div></div>' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">创建时间</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="createDate"    class="layui-input" value="'+data.createDate+'">' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">用户类型</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text" required lay-verify="required" name="userTypeId"  class="layui-input" value="'+data.userTypeId+'" >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        btn2: function (index, layero) {
            layer.msg("取消");
            //return false 开启该代码可禁止点击该按钮关闭
        },
        cancel: function () {
            layer.msg("关闭窗口");
            //右上角关闭回调
            //return false 开启该代码可禁止点击该按钮关闭
        }
    });
}