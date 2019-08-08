<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/29
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>供应商操作</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>


<form id="myform">
    <fieldset>

        <li>
            <div class="layui-input-block" style="float: left; position: relative;">
                <label class="layui-form-label">商品库存查询</label>
                <input style="width: auto;" type="text" id="queryInventory" name="select_orderId" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <button type="button" class="layui-btn" lay-submit="" id="searchBtn" data-type="getInfo" style="float: left;">搜索</button>
        </li>

    </fieldset>

</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>规格</th>
        <th>采购单价</th>
        <th>售卖单价</th>
        <th>产地</th>

        <th>计量单位</th>
        <th>库存</th>

    </tr>
    </thead>
    <tbody id="mytbd">

    </tbody>

</table>
</body>
<script>

    window.onload = function(){
        seachAllGoods(null)
    }

    //查询所有goods信息并填充到列表
    function seachAllGoods(data){
        $("#mytbd").html(null)
        $.ajax({
            url: "goods/seachAllGoods",
            type: "post",
            data:{"queryName":data},
            dataType: "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].goodsno+"</td>";
                    tr+="<td>"+data[i].goodsname+"</td>";
                    tr+="<td>"+data[i].goodsspec+"</td>";
                    tr+="<td>"+data[i].purchaseprice+"</td>";
                    tr+="<td>"+data[i].unitsalesprice+"</td>";
                    tr+="<td>"+data[i].origin+"</td>";
                    tr+="<td>"+data[i].measurement+"</td>";
                    tr+="<td>"+data[i].inventory+"</td>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);
                }
            }
        })
    }

    //点击搜索按钮
    $("#searchBtn").on("click",function(){
        var query =$("#queryInventory").val();
        seachAllGoods(query)
    })




</script>
</html>
