<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/2/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品系统</title>
    <%--<script type="text/javascript" src="jquery/jquery-3.2.1.js" charset="utf-8"></script>--%>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="layui/layui.js" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
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
        <ul class="layui-nav layui-layout-right">
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

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">



            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">床上用品&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                        <dd><a href="javascript:;">办公用品&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                        <dd><a href="javascript:;">日常用品&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                        <dd><a href="">超链接&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">方案一&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                        <dd><a href="javascript:;">方案二&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                        <dd><a href="">超链接&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 15px;">&#xe602;</i></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon" style="font-size: 30px;">&#xe62e;</i></a>
                    <dl class="layui-nav-child">
                    </dl>
                </li>

                <li class="layui-nav-item"><a href="">云市场&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 30px;">&#xe67c;</i> </a></li>
                <li class="layui-nav-item"><a href="">发布商品&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="layui-icon" style="font-size: 30px;">&#xe63c;</i> </a></li>
                <ul id="demo"></ul>
            </ul>
        </div>
    </div>
    <div class="layui-body layui-bg-black" >
        <div class="layui-tab" lay-filter="demo1">
            <ul class="layui-tab-title">

            </ul>
            <div class="layui-tab-content">

            </div>

        </div>
        <!-- 内容主体区域 -->
        <div class="layui-anim layui-anim-rotate layui-anim-loop">
            <center><i class="layui-icon" style="font-size: 500px; color: #c2c2c2;">&#xe69c;</i></center>
        </div>
    </div>

    <center><div class="layui-footer layui-bg-black">
        <!-- 底部固定区域 -->
        © yanyw_sir@163.com -
    </div></center>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });


    layui.use('tree',function () {
        layui.tree({
            elem: '#demo' //传入元素选择器
            ,click:function (node) {
                layui.use('element', function() {
                    var element = layui.element;
                    if(node.children==undefined){
                        element.tabAdd('demo1', {
                            title: node.name
                            ,content:createFrame(node.url) //支持传入html
                            ,id: node.id
                        });
                    }

                })
            },

            nodes:[ //节点
                {
                    name: '常用文件夹'
                    ,id: 1
                    ,alias: 'changyong'
                    ,children: [
                    {
                        name: '所有未读'
                        ,id: 11
                        ,url: 'http://www.baidu.com'
                        ,alias: 'weidu'
                    }, {
                        name: '置顶邮件'
                        ,id: 12
                    }, {
                        name: '标签邮件'
                        ,id: 13
                    }
                ]
                }, {
                    name: '我的邮箱'
                    ,id: 2
                    ,spread: true
                    ,children: [
                        {
                            name: 'QQ邮箱'
                            ,id: 21
                            ,spread: true
                            ,children: [
                            {
                                name: '收件箱'
                                ,id: 211
                                ,children: [
                                {
                                    name: '所有未读'
                                    ,id: 2111,
                                    url:'http://www.aliyun.com'

                                }, {
                                    name: '置顶邮件'
                                    ,id: 2112,
                                    url:'http://www.layui.com/doc/modules/element.html'
                                }, {
                                    name: '标签邮件'
                                    ,id: 2113,
                                    url:'http://echarts.baidu.com'
                                }
                            ]
                            }, {
                                name: '已发出的邮件'
                                ,id: 212,
                                url:'http://echarts.baidu.com'
                            }, {
                                name: '垃圾邮件'
                                ,id: 213,
                                url:'http://www.baidu.com'
                            }
                        ]
                        }, {
                            name: '阿里云邮'
                            ,id: 22
                            ,children: [
                                {
                                    name: '收件箱'
                                    ,id: 221
                                }, {
                                    name: '已发出的邮件'
                                    ,id: 222
                                }, {
                                    name: '垃圾邮件'
                                    ,id: 223
                                }
                            ]
                        }
                    ]
                }
            ]
        });
    })
    function createFrame(href){
        return '<iframe scrolling="auto" frameborder="0"  src="'+ href + '" style="width:100%;height:100%;"></iframe>';
    }

</script>
</body>
</html>
