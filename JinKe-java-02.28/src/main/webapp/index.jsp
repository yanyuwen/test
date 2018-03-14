<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Watch后台数据统计系统</title>
    <script src="jquery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css"/>
    <script src="../layui/layui.js"></script>
    <%--<script src="../js/layui/layui.all.js"></script>--%>
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><i class="layui-icon" style="font-size: 50px; color: #1E9FFF;">&#xe60c;</i></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right layui-bg-black">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="img/5bb679wzgs3mqqjjtv49riryw.jpg" class="layui-nav-img">
                    <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe612;</i>ctkave,
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side ">
        <div class="layui-side-scroll layui-bg-gray">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul id="demo" ></ul>
        </div>
    </div>

    <div class="layui-body">

        <div class="layui-tab" lay-filter="demo1" lay-allowClose="true">
            <ul class="layui-tab-title" >
                <li class="layui-this">Watch数据统计系统</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show"></div>
            </div>

        </div>

    </div>
</div>

</body>
<script src="treeJson.js"></script>
<script>
    $(function () {
        //查询树表数据
        $.ajax({
            url:"<%=request.getContextPath()%>/queryTree.yyw",
            type:"post",
            dataType:"json",
            success:function (data) {
                var flag=false;
                layui.use('tree',function () {
                    layui.tree({
                        elem: '#demo' //传入元素选择器
                        ,click:function (node) {
                            layui.use('element', function() {
                                var element = layui.element;
                                if(node.children==undefined&&flag==false){
                                    element.tabAdd('demo1', {
                                        title: node.name
                                        ,content:createFrame(node.url) //支持传入html
                                        ,id: node.id
                                    });

                                    element.tabChange('demo1',node.id);
                                    /* flag=true;*/
                                }

                            })
                        },
                        nodes:data
                    });
                })

            }
        })

    })

    function createFrame(href){
        return '<iframe scrolling="auto" frameborder="0"  src="'+ href + '" style="width:100%;height:100%;"></iframe>';
    }
</script>
</html>
