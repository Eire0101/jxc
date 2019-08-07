<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/31
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单管理</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>



    <div class="container">
        <%--订单列表--%>
        <table class="table">
            <thead>
                <th>采购单编号</th>
                <th>采购人</th>
                <th>申请部门</th>
                <th>申请人</th>
                <th>说明</th>
                <th>采购总价</th>
                <th>创建时间</th>
                <th>订单状态</th>
                <th>操作</th>
            </thead>
            <tbody id="mytbody">

            </tbody>
        </table>
    </div>
</body>
<script>
    //订单数据
    var orderdata
    //订单详情数据
    var detaildata
    //更新前的数据
    var olddata

    var j = 0

    $(function () {
        selAllPurOrder()
        loadModal()
        setInterval(function () {
            selAllPurOrder()
        },1000)
    })

    //从服务器获取所有订单总表数据,并填充到html
    function selAllPurOrder(){
        $.ajax({
            url: "pur/selAllPurOrder",
            type: "post",
            dataType: "json",
            success: function (data) {
                if(olddata != data) {
                    //全局订单数据
                    orderdata = data
                    //当列表和之前不同时,更新详情数据
                    selAllPurDetail()
                    //重新加载时清空之前动态生成的列表的
                    $("#mytbody").html("")

                    for (var i in data) {
                        var tr = "<tr>"
                        tr += "<td>" + data[i].purno + "</td>"
                        tr += "<td>" + data[i].purman + "</td>"
                        tr += "<td>" + data[i].applydep + "</td>"
                        tr += "<td>" + data[i].applyman + "</td>"
                        tr += "<td>" + data[i].description + "</td>"
                        tr += "<td>" + data[i].buymoney + "</td>"
                        tr += "<td>" + data[i].createtime + "</td>"
                        tr += "<td>" + data[i].purstatus + "</td>"
                        tr += "<td><button type='button' class='btn btn-primary modal-btn' data-toggle='modal' data-target='#myModal' value='" + data[i].purno + "'>查看订单详情</button></td>"
                        tr += "</tr>"
                        $("#mytbody").append(tr)
                    }
                    olddata = data
                }
            }
        })
    }

    //从服务器获取所有订单详情数据
    function selAllPurDetail(){
        $.ajax({
            url: "pur/selAllPurDetail",
            type: "post",
            dataType: "json",
            success: function (data) {
                detaildata = data
            }
        })
    }

    //js动态生成模态框
    function loadModal() {
        var modal = "<div class=\"modal fade\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">"
        modal += "<div class=\"modal-dialog\" role=\"document\">"
        modal += "<div class=\"modal-content\">"
        modal += "<div class=\"modal-header\">"
        modal += "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">"
        modal += "<span aria-hidden=\"true\">&times;</span>"
        modal += "</button>"
        modal += "<h4 class=\"modal-title\" id=\"myModalLabel\">订单详情</h4>"
        modal += "</div>"
        modal += "<div class=\"modal-body\">"
        modal += "<table class=\"table\">\n" +
            "                            <thead>\n" +
            "                                <th>采购单编号</th>\n" +
            "                                <th>商品编号</th>\n" +
            "                                <th>商品名称</th>\n" +
            "                                <th>商品类型</th>\n" +
            "                                <th>采购数量</th>\n" +
            "                                <th>小计</th>\n" +
            "                                <th>创建时间</th>\n" +
            "                            </thead>\n" +
            "                            <tbody id=\"modaltbody\">"
        modal += " ."
        modal += " </tbody>\n" +
            "                        </table>"
        modal += "</div>"
        modal += "<div class=\"modal-footer\">"
        modal += "<button type=\"button\" class=\"btn btn-danger wtgsh\" data-dismiss=\"modal\" onclick='wtgsh(this)'>未通过审核</button>"
        modal += "<button type=\"button\" class=\"btn btn-success tgsh\" data-dismiss=\"modal\" onclick='tgsh(this)'>通过审核</button>"
        modal += "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button>"
        modal += "</div>\n" +
            "                </div>\n" +
            "            </div>\n" +
            "        </div>"
        $("body").append(modal)
    }

    //根据purno选取相应订单的详情数据,返回一个对应详情集合detaillist
    function selPurDetail(purno){
        //相应订单的详情数据
        var detaillist = new Array();
        for (var i in detaildata) {
            if(detaildata[i].purno == purno){
                detaillist.push(detaildata[i])
            }
        }
        return detaillist;
    }

    //查看订单详情按钮的点击事件
    $("#mytbody").on("click",".modal-btn",function () {
        //清空之前添加的文档元素
        $("#modaltbody").html("")

        //获取对应详情集合
        var detaillist = selPurDetail($(this).val())
        //将详情集合填充到模态框
        for (var i in detaillist){
            var tr = "<tr>"
            tr += "<td>"+detaillist[i].purno+"</td>"
            tr += "<td>"+detaillist[i].goodsno+"</td>"
            tr += "<td>"+detaillist[i].goodsname+"</td>"
            tr += "<td>"+detaillist[i].goodstype+"</td>"
            tr += "<td>"+detaillist[i].puramount+"</td>"
            tr += "<td>"+detaillist[i].subtotal+"</td>"
            tr += "<td>"+detaillist[i].createtime+"</td>"
            tr += "</tr>"
            $("#modaltbody").append(tr)
        }
        var statustext = $(this).parents("tr").find("td").eq(7).html()
        //根据订单状态禁用按钮,避免重复点击之前的操作
        if(statustext == "通过审核"){
            $(".tgsh").prop("disabled",true)
            $(".wtgsh").prop("disabled",false)
        }else if(statustext == "未通过审核"){
            $(".tgsh").prop("disabled",false)
            $(".wtgsh").prop("disabled",true)
        }else if(statustext == '采购完成'){
            $(".tgsh").prop("disabled",false)
            $(".wtgsh").prop("disabled",false)
        }
    })

    function wtgsh(obj) {
        //获取要审核的采购单编号
        var purno = $(obj).parent().prev().find("td:first").html()
        sh(purno,"未通过审核")
    }

    function tgsh(obj) {
        var purno = $(obj).parent().prev().find("td:first").html()
        sh(purno,"通过审核")
    }

    function sh(purno,status){
        $.ajax({
            url: "pur/sh",
            type: "post",
            data: {"purno":purno,"purstatus":status},
            dataType: "text",
            success: function (data) {
                var trs = $("#mytbody").children()
                //更新列表数据
                trs.each(function () {
                    if($(this).find("td").eq(0).html() == purno){
                        $(this).find("td").eq(7).html(status)
                    }
                })
            }
        })
    }
</script>
</html>
