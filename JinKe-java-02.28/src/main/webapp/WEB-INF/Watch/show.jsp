<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/3/1
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/jquery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <script src="/layui/layui.js"></script>
</head>
<body>

<%--新增按钮--%>
<button class="layui-btn" id="add"><i class="layui-icon">&#xe654;</i></button>
<%--删除按钮--%>
<button class="layui-btn" onclick="delstaff()"><i class="layui-icon">&#xe640;</i></button>
<%--修改按钮--%>
<button class="layui-btn" onclick="updatebutton()"><i class="layui-icon">&#xe642;</i></button>
<%--查询表格--%>
<table id="watchshow" lay-filter="test"></table>
<%--新增form--%>
<div id="addstaff" style="display: none">
    <form class="layui-form" id="addstaffForm" >
        <input type="hidden" id="id0" name="id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">手表名称:</label>
            <div class="layui-input-inline">
                <input type="text" id="id1" name="watchname" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手表价格:</label>
            <div class="layui-input-block">
                <input type="radio" name="watchprice" value="1" title="1000-5000">
                <input type="radio" name="watchprice" value="2" title="5000-10000" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">生产日期:</label>
            <div class="layui-input-inline">
                <input type="text" name="watchdate" id="createtimeid" required lay-verify="required" placeholder="请输入日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">手表简介:</label>
            <div class="layui-input-block">
                <textarea name="watchjianjie"  id="staffinfoid"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手表颜色:</label>
            <div class="layui-input-block">
                <input type="checkbox" name="watchcolor" title="黑色" value="1">
                <input type="checkbox" name="watchcolor" title="蓝色" value="2">
                <input type="checkbox" name="watchcolor" title="金色" value="3">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手表类型:</label>
            <div class="layui-input-block">
                <select name="watchtype" id="id2" lay-verify="required">
                    <option value="0"></option>
                    <option value="1">机械表</option>
                    <option value="2">运动表</option>
                    <option value="3">休闲表</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">封面</label>
            <input type="hidden" name="watchimg" id="image">
            <div id="showimg"></div>
            <button type="button" class="layui-btn" id="test2">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
        </div>
    </form>
</div>


<script>

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#createtimeid' //指定元素
        });
    });
    //上传图片
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test2' //绑定元素
            ,url: 'uploadPhoto.yyw' //上传接口
            ,done: function(res){
                //上传完毕回调
                $ = layui.jquery;
                $("#image").val(res.path);
                $("#showimg").append("<img width='100px' height='100px' src='"+res.path+"'>")
            }
            ,error: function(res){
            }
        });
    });



    //查询
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#watchshow'
            ,height: 315
            ,url: 'watchSelect.yyw' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: '手表编号', width:50,type:'checkbox'}
                ,{field: 'watchname', title: '手表名称', width:150}
                ,{field: 'watchtype', title: '手表类型', width:150, sort: true,
                    templet: function(d){
                        if(d.watchtype==1){
                            return "机械表";
                        }else if(d.watchtype==2){
                            return "运动表";
                        } else if(d.watchtype==3){
                            return "休闲表"
                        }
                    }}
                ,{field: 'watchdate', title: '生产时间', width:150}
                ,{field: 'watchcolor', title: '手表颜色', width: 150,
                    templet: function(d){
                        if(d.watchcolor==1){
                            return "黑色";
                        }else if(d.watchcolor==2){
                            return "蓝色";
                        } else if(d.watchcolor==3){
                            return "金色"
                        }
                    }}
                ,{field: 'watchprice', title: '手表价格', width: 150, sort: true,
                    templet: function(d){
                        if(d.watchprice==1){
                            return "1000-5000";
                        }
                            return "5000-10000";
                    }}
                ,{field: 'watchjianjie', title: '手表简介', width: 150, sort: true}
                ,{field: 'watchimg', title: '封面', width: 150,
                    templet: function(d){
                        return "<img width='300px' height='500px' src='"+d.watchimg+"' alt='图片不存在'>";
                }}
            ]]
        });
    });

    //富文本编辑器
    layui.use('layedit', function(){
        layedit = layui.layedit;
        indexs= layedit.build('staffinfoid'); //建立编辑器
    });

    //新增
    $("#add").click(function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //id
        $("#id0").val("");
        //手表名称
        $("#id1").val("");
        //手表价格
        $("[name='watchprice']").each(function () {
                $(this).attr('checked',false);
        })
        //出产日期
        $("#createtimeid").val("");
        //手表简介
        $("#staffinfoid").val("");
        //手表颜色
        /*$("[name='watchcolor']").each(function () {
             var arr= checkStatus.data[0].watchcolor;
                  $(this).attr('checked',false)
             }
            })*/
        //手表类型
        $("#id2").val("");
        //图片
        $("#showimg").append("<img width='100px' height='100px' src=''>")
        form.render();

        layui.use('layer', function(){
            var layer = layui.layer;
            layer.open({
                title:'添加手表信息',
                type: 1,
                content:$("#addstaff"),//这里content是一个普通的String
                area:['800px', '420px'],
                offset:'auto',
                btn:['确认'],
                yes: function(index, layero){
                    layedit.sync(indexs);
                    $.ajax({
                        url:"addWatch.yyw",
                        type:"post",
                        data:$("#addstaffForm").serialize(),
                        success:function (map) {
                            if(map.success){
                                layer.close(index);
                                location.href=location;
                                /*  layui.use('table', function(){
                                      table.reload('demo', {
                                          url: '../staff/queryStaff.do'
                                          ,height: 800
                                          //,height: 300
                                      });
                                  })*/
                            }
                        }
                    })
                }
            });
        });
    })

    //删除
    function delstaff() {
        layui.use('table', function(){
            var table = layui.table;
            var checkStatus = table.checkStatus('watchshow');

            if(checkStatus.data.length==0){
                layer.alert('请选择需要删除的数据!', {icon: 2});
            }else{
                var id=checkStatus.data[0].id;
                layer.confirm('你确定要删除此条数据吗?', {icon: 3, title:'提示'}, function(index){
                    $.ajax({
                        url:"delwatch.yyw",
                        type:"post",
                        data:{'id':id},
                        success:function (map) {
                            if(map.success){
                                layer.close(index);
                                layer.alert('删除成功', {icon: 1});
                                location.href=location;
                            }
                        }
                    })

                });
            }
        })
    }


    //修改
    function updatebutton(){
        layui.use(['form','layedit'], function(){
        var table = layui.table;
        var checkStatus = table.checkStatus('watchshow');
        var id=checkStatus.data[0].id;
        layedit = layui.layedit;
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //id
        $("#id0").val(checkStatus.data[0].id);
        //手表名称
        $("#id1").val(checkStatus.data[0].watchname);
        //手表价格
        $("[name='watchprice']").each(function () {
            if($(this).val()==checkStatus.data[0].watchprice){
                $(this).attr('checked',true);
            }
        })
        //出产日期
        $("#createtimeid").val(checkStatus.data[0].watchdate);
        //手表简介
        $("#staffinfoid").val(checkStatus.data[0].watchjianjie);
        //手表颜色
        /*$("[name='watchcolor']").each(function () {
            var arr= checkStatus.data[0].watchcolor;
            alert(arr)
            for(var i=0;i<arr.length;i++){
                if($(this).val()==arr[i]){
                    $(this).attr('checked',true)
                }
                alert(arr[i])
            }
        })*/
        //手表类型
        $("#id2").val(checkStatus.data[0].watchtype);
        //手表图片
            /*alert(data[0].watchimg)*/
           /* $("#showimg").append("<img width='100px' height='100px' src='"+data[0].watchimg+"'>")*/
        form.render();

        layer.open({
            title: '修改用户数据'
            ,content: $("#addstaff"),
            area:['800px', '420px'],
            offset:'auto',
            type: 1,
            btn:['确认'],
            yes: function(index, layero){
                $.ajax({
                    url:"updateWatch1.yyw",
                    type:"post",
                    data:$("#addstaffForm").serialize(),
                    success:function () {
                        layer.alert('修改成功', {icon: 1});
                        location.href=location;
                    }
                })
            }
        });
        });
    }




    //富文本编辑器2
    layui.use('layedit', function(){
        layedit = layui.layedit;
        indexs= layedit.build('staffinfoid2'); //建立编辑器
    });
    //日期2
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#createtimeid2' //指定元素
        });
    });
</script>
</body>
</html>
