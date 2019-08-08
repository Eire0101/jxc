<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品基本信息管理</title>
    <base href="http://localhost:9999/demo1/"></base>
    <link rel="stylesheet" href="layui/css/layui.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form id="myfrom1">
<table class="layui-table" lay-skin="line" id="table1">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品规格</th>
        <th>销售单价</th>
        <th>零售价</th>
        <th>建议零售价</th>
        <th>源产地</th>
        <th>计量单位</th>
        <th>库存</th>
        <th>类别(1：饮料/2：零食)</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd1">
    <tr>
        <td><input name="goodsno"></td>
        <td><input name="goodsname"></td>
        <td><input name="goodsspec"></td>
        <td><input name="purchaseprice"></td>
        <td><input name="unitsalesprice"></td>
        <td><input name="suggestedretailprice"></td>
        <td><input name="origin"></td>
        <td><input name="measurement"></td>
        <td><input name="inventory"></td>
        <td><input name="typeid"></td></br>
        <td><button type="button" class="layui-btn layui-btn-radius layui-btn-normal add">增加</button></td>
    </tr>
    </tbody>
</table>
</form>


<table class="layui-table" lay-skin="line" id="table2">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品规格</th>
        <th>销售单价</th>
        <th>零售价</th>
        <th>建议零售价</th>
        <th>源产地</th>
        <th>计量单位</th>
        <th>库存</th>
        <th>类别(1：饮料/2：零食)</th>
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
                <h4 class="modal-title">修改商品信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form id="myfrom2">
                    商品编号:&nbsp; &nbsp;<input class="goodsno" name="goodsno" placeholder="商品编号" readonly/><br/>
                    商品名称:&nbsp;&nbsp;&nbsp;<input class="goodsname" name="goodsname" placeholder="商品名称"/><br/>
                    商品规格:&nbsp;&nbsp;&nbsp;<input class="goodsspec" name="goodsspec" placeholder="商品规格"/><br/>
                    销售单价:&nbsp;&nbsp;&nbsp; <input class="purchaseprice" name="purchaseprice" placeholder="销售单价"/><br/>
                    零售价:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="unitsalesprice" name="unitsalesprice" placeholder="零售价"/><br/>
                    建议零售价:<input class="suggestedretailprice" name="suggestedretailprice" placeholder="建议零售价"/><br/>
                    源产地:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="origin" name="origin" placeholder="源产地"/><br/>
                    计量单位:&nbsp;&nbsp;&nbsp;&nbsp;<input class="measurement" name="measurement" placeholder="计量单位"/><br/>
                    库存:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="inventory" name="inventory" placeholder="库存"/><br/>
                    类别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="typeid" name="typeid" placeholder="类别"/><br/>
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
        queryGoodsMessage();
    })

    //查询获取到goods表中的数据
    function queryGoodsMessage() {
        $.ajax({
            url: "goods/selAllGoods",
            contextType: "application/json",
            type: "post",
            dataType: "json",
            success: function (data) {
                //加载前清空
                $("#mytbd2").html("");
                for (i = 0; i < data.length; i++) {
                    var tr = "<tr>"
                    tr += "<td>" + data[i].goodsno + "</td>"
                    tr += "<td>" + data[i].goodsname + "</td>"
                    tr += "<td>" + data[i].goodsspec + "</td>"
                    tr += "<td>" + data[i].purchaseprice + "</td>"
                    tr += "<td>" + data[i].unitsalesprice + "</td>"
                    tr += "<td>" + data[i].suggestedretailprice + "</td>"
                    tr += "<td>" + data[i].origin + "</td>"
                    tr += "<td>" + data[i].measurement + "</td>"
                    tr += "<td>" + data[i].inventory + "</td>"
                    tr += "<td>" + data[i].typename + "</td>"
                    tr += "<td><button type='button' class='layui-btn update' data-toggle='modal' data-target='#myModal'>编辑</button>" +
                        "<button type='button' class='layui-btn delete' goodsno='"+data[i].goodsno+"'>删除</button>" + "</td>"
                    tr += "</tr>"
                    $("#mytbd2").append(tr);
                }
            }
        })
    }

    //删除
    $("#mytbd2").on("click",".delete",function () {
        $.ajax({
            url:"goods/deleteGoods",
            type:"post",
            data:{"goodsno":$(this).attr("goodsno")},
            dataType:"text",
            success:function (data) {
                if (data=="true")
                    alert("确认删除？！")
                queryGoodsMessage();
            }
        })
    })

    //添加
    $("#mytbd1").on("click",".add",function () {
        $.ajax({
            url:"goods/addGoods",
            type:"post",
            data:$("#myfrom1").serialize(),
            dataType:"text",
            success:function (data) {
                if (data=="true"){
                    alert("添加成功！")
                    queryGoodsMessage();
                }
            }
        })
    })

    //修改一条数据
    $("#mytbd2").on("click",".update",function () {
        $(".goodsno").val($(this).parent().parent().find("td").eq(0).html());
        $(".goodsname").val($(this).parent().parent().find("td").eq(1).html());
        $(".goodsspec").val($(this).parent().parent().find("td").eq(2).html());
        $(".purchaseprice").val($(this).parent().parent().find("td").eq(3).html());
        $(".unitsalesprice").val($(this).parent().parent().find("td").eq(4).html());
        $(".suggestedretailprice").val($(this).parent().parent().find("td").eq(5).html());
        $(".origin").val($(this).parent().parent().find("td").eq(6).html());
        $(".measurement").val($(this).parent().parent().find("td").eq(7).html());
        $(".inventory").val($(this).parent().parent().find("td").eq(8).html());
        $(".typeid").val($(this).parent().parent().find("td").eq(9).html());
    })

    //点击提交时确认修改
    var btn=document.getElementById("submit");
    submit.onclick=function () {
        if (confirm("确认修改？！")){
            $.ajax({
                url:"goods/updateGoods",
                type:"post",
                data:$("#myfrom2").serialize(),
                success:function (data) {
                    if (data=="true"){
                        queryGoodsMessage();
                        $("#myModal").modal('hide')
                    }
                }
            })
        }
    }




</script>
