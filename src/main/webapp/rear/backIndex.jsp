<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="layui/css/layui.css">
    <%@page isELIgnored="false" %>
    <%@page pageEncoding="UTF-8" %>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
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
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${userInfo.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test" id="nav">

            </ul>
        </div>
    </div>

    <%--tab选项卡--%>
    <div class="layui-tab" lay-allowClose="true" lay-filter="demotab" style="margin-left: 200px">
        <ul class="layui-tab-title">

        </ul>
        <!-- 内容主体区域 -->
        <div style="padding: 15px;" class="layui-tab-content"></div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

        var $ = layui.$
        $.ajax({
            url: "menu/selectMenu",
            type: "post",
            dataType: "json",
            success: function(data){
                console.log(data)
                for(var i = 0; i < data.length; i++){
                    if(data[i].parentid == 0) {
                        var li = "<li class=\"layui-nav-item\">"
                        li += "<a href=\"javascript:;\">"+data[i].authorityname+"</a>"
                        li += "<dl class=\"layui-nav-child\">"
                        for(var j = 0; j < data.length; j++){
                            if(data[j].parentid == data[i].authorityid){
                                li += "<dd><a class='site-demo-active' data-url='"+data[j].urlpath+"' data-title='"+data[j].authorityname+"' data-id='"+data[j].authorityid+"'>"+data[j].authorityname+"</a></dd>"
                            }
                        }
                        li += "</dl>"
                        li += "</li>"
                        $("#nav").append(li)
                    }
                }
                element.init()
            }
        })

        //触发事件
        var active = {
        //在这里给active绑定几项事件，后面可通过active调用这些事件
        tabAdd: function(url,id,name){
                console.log(url)
        //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
        //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd("demotab",{
                    title:name,
                    content: "<iframe data-frameid='"+id+"' scrolling='auto' frameborder='0' src='"+url+"' style='width:100%;height:99%;'></iframe>",
                    id: id  //规定好的id
            })
            FrameWH()//计算ifram层的大小
        },
        tabChange: function(id) {
                element.tabChange('demotab',id)
        },
            tabDelete: function(id){
            element.tabDelete("demotab",id)
            },
            tabDeleteAll: function(ids){
            $.each(ids,function(id,item){
                element.tabDelete("demotab",item)
            })
            }
        }

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('#nav').on('click',".site-demo-active", function() {
            var dataid = $(this);
            console.log(dataid);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        //计算iframe大小
        function FrameWH() {
            var h = $(window).height() -41- 10 - 60 -10-44 -10;
            $("iframe").css("height",h+"px");
        }

        $(window).resize(function () {
            FrameWH();
        })

    });



</script>
</body>
</html>