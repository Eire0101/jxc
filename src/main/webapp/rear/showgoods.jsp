<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-striped">
    <thead>
    <tr>
        <th>类型id</th>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品规格</th>
        <th>采购单价</th>
        <th>销售单价</th>
        <th>建议零售价</th>
        <th>产地</th>
        <th>计量单位</th>
        <th>库存</th>
        <th>商品类型</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">

    </tbody>

</table>
</body>
<script>

    var olddata

    window.onload = function(){
        selectAllGoods()
        refreshOrder()
    }

    //查询所有商品信息(包含类型表)
    function selectAllGoods(){
        $.ajax({
            url: "goods/selAllGoods",
            type: "post",
            dataType: "json",
            success: function(data){
                    $("#mytbd").html(null)
                    for(var i=0;i<data.length;i++){
                        var tr="<tr>"
                        tr+="<td>"+data[i].typeid+"</td>";
                        tr+="<td>"+data[i].goodsno+"</td>";
                        tr+="<td>"+data[i].goodsname+"</td>";
                        tr+="<td>"+data[i].goodsspec+"</td>";
                        tr+="<td>"+data[i].purchaseprice+"</td>";
                        tr+="<td>"+data[i].unitsalesprice+"</td>";
                        tr+="<td>"+data[i].suggestedretailprice+"</td>";
                        tr+="<td>"+data[i].origin+"</td>";
                        tr+="<td>"+data[i].measurement+"</td>";
                        tr+="<td>"+data[i].inventory+"</td>";
                        tr+="<td>"+data[i].typename+"</td>";
                        tr+="<td><button  class='btn btn-primary' value='"+data[i].goodsno+"' id='delGoods'>删除</button>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "<button class='btn btn-primary'value='"+data[i].goodsno+"' type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\" id='modal-btn'>修改</button>" +
                            "</td>";
                        tr+="</tr>";
                        $("#mytbd").append(tr);
                }
            }
        })
    }



</script>
</html>
