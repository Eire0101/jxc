<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户个人信息管理--管理员级别</title>
    <base href="http://localhost:9999/demo1/"></base>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form id="myform1">
    <table class="layui-table" lay-skin="row">
        <thead>
        <tr>
            <th>用户编号</th>
            <th>用户名</th>
            <th>电话号码</th>
            <th>地址</th>
            <th>密码</th>
            <th>职位</th>
        </tr>
        </thead>
        <tbody id="mytbd1">
        <tr>
            <td><input name="userno"/></td>
            <td><input name="username"/></td>
            <td><input name="telphone"/></td>
            <td><input name="address"/></td>
            <td><input name="pwd"/></td>
            <td><input name="roleid"/></td>
        </tr>
        </tbody>
    </table>
    <button type="button" class="layui-btn layui-btn-radius layui-btn-normal addNew">添加</button>
</form>


<table class="layui-table" lay-skin="line" id="table2">
    <thead>
    <tr>
        <th>用户编号</th>
        <th>用户名</th>
        <th>电话号码</th>
        <th>地址</th>
        <th>密码</th>
        <th>职位</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd2">
    <tr>
    </tr>
    </tbody>
</table>

<!-- 模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">修改信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form id="myform2">
                    用户编号:<input class="userno" name="userno" readonly/><br/>
                    用户名:<input class="username" name="username" /><br/>
                    电话号码:<input class="telphone" name="telphone"/><br/>
                    地址:<input class="address" name="address" /><br/>
                    密码:<input class="pwd" name="pwd" /><br/>
                    职位:<input class="roleid" name="roleid" /><br/>
                </form>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button id="submit" type="button" class="layui-btn layui-btn-radius layui-btn-normal" data-dismiss="modal">提交</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

</body>
</html>
<script>
    //加载时查询
    $(function () {
        queryUsersMessage();
    })

    //查询获取到userInfo表中的数据
    function queryUsersMessage() {
        $.ajax({
            url: "user/queryUser",
            type: "post",
            dataType: "json",
            success: function (data) {
                //加载前清空
                $("#mytbd2").html("");
                for (i = 0; i < data.length; i++) {
                    var tr = "<tr>"
                    tr += "<td>" + data[i].userno + "</td>"
                    tr += "<td>" + data[i].username + "</td>"
                    tr += "<td>" + data[i].telphone + "</td>"
                    tr += "<td>" + data[i].address + "</td>"
                    tr += "<td>" + data[i].pwd + "</td>"
                    tr += "<td>" + data[i].rolename + "</td>"
                    tr += "<td><button type='button' class='layui-btn update' data-toggle='modal' data-target='#myModal'>编辑</button>" +
                            "<button type='button' class='layui-btn delete' userno='"+data[i].userno+"'>删除</button>"+
                        "</td>"
                    tr += "</tr>"
                    $("#mytbd2").append(tr);
                }

            }
        })
    }

    //添加
    $("#myform1").on("click",".addNew",function () {
        $.ajax({
            url:"user/addUser",
            type:"post",
            data:$("#myform1").serialize(),
            dataType:"text",
            success:function (data) {
                if (data=="true"){
                    alert("添加成功！")
                    queryUsersMessage();
                }
            }
        })
    })

    //删除
    $("#mytbd2").on("click",".delete",function () {
        $.ajax({
            url:"user/deleteUser",
            type:"post",
            data:{"userno":$(this).attr("userno")},
            dataType:"text",
            success:function (data) {
                if (data=="true")
                    alert("确认删除？！")
                queryUsersMessage();
            }

        })
    })

    //修改一条数据
    $("#mytbd2").on("click",".update",function () {
        $(".userno").val($(this).parent().parent().find("td").eq(0).html());
        $(".username").val($(this).parent().parent().find("td").eq(1).html());
        $(".telphone").val($(this).parent().parent().find("td").eq(2).html());
        $(".address").val($(this).parent().parent().find("td").eq(3).html());
        $(".pwd").val($(this).parent().parent().find("td").eq(4).html());
        $(".roleid").val($(this).parent().parent().find("td").eq(5).html());
    })

    //点击提交时确认修改
    var btn=document.getElementById("submit");
    submit.onclick=function () {
        if (confirm("确认修改？！")){
            $.ajax({
                url:"user/updateUser2",
                type:"post",
                data:$("#myform2").serialize(),
                success:function (data) {
                    if (data=="true"){
                        queryUsersMessage();
                        $("#myModal").modal('hide')
                    }
                }
            })
        }
    }




</script>
