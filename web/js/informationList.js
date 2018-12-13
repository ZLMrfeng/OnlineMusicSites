function addInformation(){
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
            '<input type="text"  required lay-verify="required" name="informationId"  class="layui-input" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">标题</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="informationTitle"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">详细内容</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="informationIntroduction"  class="layui-input"  >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                informationId: $("input[name='informationId']").val(),
                informationTitle: $("input[name='informationTitle']").val(),
                informationIntroduction: $("input[name='informationIntroduction']").val()
            };
            console.log(formData);
            $.post('/backstage/addInformation.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/informationManager.jsp");
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
function editInformation(data){
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
            '<input type="text"  required lay-verify="required" name="informationId"  class="layui-input" value="'+data.informationId+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">标题</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="informationTitle"  class="layui-input" value="'+data.informationTitle+'" >' +
            '</div></div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<div class="layui-inline">' +
            '<label class="layui-form-label">详细内容</label>' +
            '<div class="layui-input-inline">' +
            '<input type="text"  required lay-verify="required" name="informationIntroduction"  class="layui-input" value="'+data.informationIntroduction+'" >' +
            '</div></div>' +
            '</div>' +
            '</form>',
        btnAlign: 'c',
        btn: ['确定', '取消'],
        yes: function (index, layero) {

            var formData = {
                informationId: $("input[name='informationId']").val(),
                informationTitle: $("input[name='informationTitle']").val(),
                informationIntroduction: $("input[name='informationIntroduction']").val()

            };
            console.log(formData);
            $.post('/backstage/informationEdit.do', formData, function (data) {

                console.log(window.location.href);
                //判断是否发送成功
                if (data.code == 200) {
                    layer.msg("保存失败...", {type: 1});
                } else {
                    layer.close(index);
                    layer.closeAll();
                    location.replace("/backstage/informationManager.jsp");
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