<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/8
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>销售退货</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <%--销售列表--%>
        <table class="table">
            <thead>
            <th>销售单编号</th>
            <th>操作人</th>
            <th>买家</th>
            <th>总价</th>
            <th>购买时间</th>
            <th>订单状态</th>
            <th>操作</th>
            </thead>
            <tbody id="mytbody">

            </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-hover">
                        <thead>
                            <th>销售详情单编号</th>
                            <th>商品编号</th>
                            <th>销售数量</th>
                            <th>小计</th>
                            <th>购买状态</th>
                            <th>购买时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody id="modaltbody">

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default modal-close" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(function () {
        selAllSale()
    })

    function selAllSale(){
        $.ajax({
            url: "sale/selAllSale",
            post: "post",
            dataType: "json",
            success: function (data) {
                //重新加载时清空之前动态生成的列表的
                $("#mytbody").html("")
                for (var i in data) {
                    var tr = "<tr>"
                    tr += "<td>" + data[i].saleno + "</td>"
                    tr += "<td>" + data[i].operator + "</td>"
                    tr += "<td>" + data[i].buyman + "</td>"
                    tr += "<td>" + data[i].buymoney + "</td>"
                    tr += "<td>" + data[i].saletime + "</td>"
                    tr += "<td>" + data[i].buystatus + "</td>"
                    tr += "<td><button type='button' class='btn btn-primary modal-btn' data-toggle='modal' data-target='#myModal' value='" + data[i].saleno + "'>查看订单详情</button></td>"
                    tr += "</tr>"
                    $("#mytbody").append(tr)
                }
            }
        })
    }

    $("#mytbody").on("click",".modal-btn",function () {
        selSaleDetailBySaleno($(this).val())
    })

    function selSaleDetailBySaleno(saleno) {
        $.ajax({
            url: "sale/selSaleDetailBySaleno",
            type: "post",
            data: {"saleno":saleno},
            dataType: "json",
            success: function (data) {
                $("#modaltbody").empty()
                for(var i in data){
                    var tr = "<tr>"
                    tr += "<td>"+data[i].saleno+"<input type='hidden' value='"+data[i].saledid+"'></td>"
                    tr += "<td>"+data[i].goodsno+"</td>"
                    tr += "<td>"+data[i].saleamount+"</td>"
                    tr += "<td>"+data[i].subtotal+"</td>"
                    tr += "<td>"+data[i].isback+"</td>"
                    tr += "<td>"+data[i].createtime+"</td>"
                    if(data[i].isback == "退货"){
                        tr += "<td>"+"<button class='btn btn-danger th' onclick='th(this)' disabled>退货</button>"+"</td>"
                    }else{
                        tr += "<td>"+"<button class='btn btn-danger th' onclick='th(this)'>退货</button>"+"</td>"
                    }
                    tr += "</tr>"
                    $("#modaltbody").append(tr)
                }
            }
        })
    }

    function th(othis) {
        var tds = $(othis).parent().siblings()
        var saleno = tds.eq(0).text()
        var id = tds.eq(0).find("input").val()
        var amount = Number(tds.eq(2).text())
        var no = tds.eq(1).text()
        $.ajax({
            url: "sale/th",
            type: "post",
            data: {"saledid":id,"goodsno":no,"saleamount":amount,"saleno":saleno},
            dataType: "text",
            success: function (data) {
                selSaleDetailBySaleno(saleno)
            }
        })
    }

    $(".modal-close").click(function () {
        window.location.reload()
    })
</script>
</html>
