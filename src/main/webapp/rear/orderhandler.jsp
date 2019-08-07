<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单处理</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">验收商品</h4>
            </div>
            <div class="modal-body">
                <table class="table modal-table">
                    <thead>
                    <th>采购单编号</th>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品类型</th>
                    <th>采购数量</th>
                    <th>库存</th>
                    <th>验收数量</th>
                    <th>操作</th>
                    </thead>
                    <tbody id="modaltbody">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="container">

    <div class="panel panel-default">
        <div class="panel-heading">采购单列表</div>
        <div class="panel-body">
            <table class="table table-hover">
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
                <tbody id="purtbody">
    
                </tbody>
            </table>


        </div>
        <div class="panel-footer">
            <nav aria-label="purpager">
                <ul class="pager">
                    <li class="previous"><a href="javascript:0" class="btn btn-default btnprevious" role="button"><span aria-hidden="true">&larr;</span>前一页</a></li>
                    <li class="next"><a href="javascript:0" class="btn btn-default btnnext" role="button">下一页<span aria-hidden="true">&rarr;</span></a></li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">入库商品操作</div>
        <div class="panel-body">
            <form class="form-horizontal">
                <div class="row">
                    <div class="col-xs-4 col-md-3">
                        <div class="form-group">
                            <label class="col-md-4">入库编号</label>
                            <div class="col-md-8">
                                <input readonly name="storageno" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 col-md-3">
                        <div class="form-group">
                            <label class="col-md-3">入库时间</label>
                            <div class="col-md-9">
                                <input name="storagetime" type="text" class="form-control rksj">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 col-md-3">
                        <div class="form-group">
                            <label class="col-md-4">操作人</label>
                            <div class="col-md-8">
                                <input name="operator" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-4 col-md-3">
                        <div class="form-group">
                            <label class="col-md-4">发货单位</label>
                            <div class="col-md-8">
                                <input name="forwardingunit" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <hr>
            <table class="table table-hover">
                <thead>
                <th>商品名称</th>
                <th>商品编号</th>
                <th>商品类型</th>
                <th>商品数量</th>
                <th>库存数量</th>
                <th>采购单编号</th>
                </thead>
                <tbody id="storagetbody">

                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-offset-11">
                    <button class="btn btn-primary submit-storage">提交</button>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
<script>
    var pageCount = 0
    var page = 1
    var purDetailData = null

    $(function () {
        getPageCount(5)
        btnPage()
        tgshQuery(1,5)
        getSreCount()
    })


    //前一页
    $(".btnprevious").click(function () {
        if(page == 1)
            return false;
        page--
        btnPage()
        tgshQuery(page,5)
    })

    //下一页
    $(".btnnext").click(function () {
        if(page == pageCount)
            return false;
        page++
        btnPage()
        tgshQuery(page,5)
    })

    //分页显示按钮状态控制
    function btnPage() {
        if(page == 1){
            $(".btnprevious").attr("disabled",true)
            $(".btnnext").removeAttr("disabled")
        }else if(page == pageCount){
            $(".btnprevious").removeAttr("disabled")
            $(".btnnext").attr("disabled",true)
        }else{
            $(".btnprevious").removeAttr("disabled")
            $(".btnnext").removeAttr("disabled")
        }
    }//end page

    //获取所有已通过审核的采购单总表
    function tgshQuery(currpage,pagesize) {
        $.ajax({
            url: "pur/tgshQuery",
            type: "post",
            //contentType: "application/json",
            data: {"currpage":currpage,"pagesize":pagesize},
            dataType: "json",
            success: function (data) {
                $("#purtbody").empty()
                for (var i in data) {
                    var tr = "<tr>"
                    tr += "<td>"+data[i].purno+"</td>"
                    tr += "<td>"+data[i].purman+"</td>"
                    tr += "<td>"+data[i].applydep+"</td>"
                    tr += "<td>"+data[i].applyman+"</td>"
                    tr += "<td>"+data[i].description+"</td>"
                    tr += "<td>"+data[i].buymoney+"</td>"
                    tr += "<td>"+data[i].createtime+"</td>"
                    tr += "<td>"+data[i].purstatus+"</td>"
                    tr += "<td><button type=\"button\" data-toggle=\"modal\" data-target=\"#myModal\" class='btn btn-primary wccg'>完成采购</button></td>"
                    tr += "</tr>"
                    $("#purtbody").append(tr)
                }
            }
        })
    }

    //根据purno获取采购单详情并填充到模态框
    function getPurDetailBypurno(purno){
        $.ajax({
            url:"pur/getPurDetailBypurno",
            type: "post",
            data: {"purno": purno},
            dataType: "json",
            success: function (data) {
                $("#modaltbody").empty()
                for (var i in data){
                    var tr = "<tr>"
                    tr += "<td>"+data[i].purno+"</td>"
                    tr += "<td>"+data[i].goodsno+"</td>"
                    tr += "<td>"+data[i].goodsname+"</td>"
                    tr += "<td>"+data[i].goodstype+"</td>"
                    tr += "<td>"+data[i].puramount+"</td>"
                    tr += "<td>"+data[i].inventory+"</td>"
                    tr += "<td><input type='text' class='form-control modal-input' style='width:50px'></td>"
                    tr += "<td>"+data[i].caastatus+"</td>"
                    if(data[i].caastatus == "已验收"){
                        tr += "<td><button type='button' class='btn btn-primary modal-confirm' disabled>确认验收</button></td>"
                    }else{
                        tr += "<td><button type='button' class='btn btn-primary modal-confirm'>确认验收</button></td>"
                    }
                    tr += "</tr>"
                    $("#modaltbody").append(tr)
                }

                $("#storagetbody tr").each(function () {
                    var goodsno1 = $(this).find("td").eq(1).text()
                    var purno = $(this).find("input").eq(0).val()
                    $("#modaltbody tr").each(function () {
                        var purno1 = $(this).find("td").eq(0).text()
                        var goodsno = $(this).find("td").eq(1).text()
                        if(purno1 == purno && goodsno == goodsno1){
                            $(this).find("button").prop("disabled",true)
                        }
                    })
                })
            }
        })
    }

    //根据服务器生成入库编号
    function getSreCount() {
        $.ajax({
            url: "sre/getSreCount",
            type: "post",
            dataType: "text",
            success: function (data) {
                $("[name='storageno']").val(data)
            }
        })
    }

    //根据页面容量获取采购单总表有几页
    function getPageCount(pagesize) {
        $.ajax({
            url: "pur/getPageCount",
            type: "post",
            data: {"pagesize":pagesize},
            dataType: "text",
            success: function (data) {
                pageCount = data
                console.log(pageCount)
            }
        })
    }

    //点击表单获取时间
    $(".rksj").click(function () {
        var d = new Date()
        var time = d.getFullYear() + '-' + (d.getMonth()+1) + '-' + d.getDate() + ' '+ d.getHours()
        + ':' + d.getMinutes() + ':' + d.getSeconds()
        $(".rksj").val(time)
    })

    //点击完成采购按钮,将采购详情填充到模态框
    $("#purtbody").on("click",".wccg",function () {
        var purno = $(this).parent().siblings().eq(0).text()
        getPurDetailBypurno(purno)
    })

    //点击模态框确定验收按钮,将其添加到要提交的table里
    $("#modaltbody").on("click",".modal-confirm",function () {
        var obj = $(this).parent().siblings()
        var tr = "<tr>"
        tr += "<td>"+obj.eq(2).text()+"<input type='hidden' value='"+obj.eq(0).text()+"'></td>"
        tr += "<td>"+obj.eq(1).text()+"</td>"
        tr += "<td>"+obj.eq(3).text()+"</td>"
        tr += "<td>"+obj.eq(6).children().val()+"</td>"
        tr += "<td>"+obj.eq(5).text()+"</td>"
        tr += "<td>"+obj.eq(0).text()+"</td>"
        tr += "</tr>"
        $("#storagetbody").append(tr)
        $(this).prop("disabled",true);
    })

    $(".submit-storage").click(function () {
        var storageno = $("[name=storageno]").val()
        var storagetime = $("[name=storagetime]").val()
        var operator = $("[name=operator]").val()
        var forwardingunit = $("[name=forwardingunit]").val()
        var storagearr = new Array()
        $("#storagetbody tr").each(function () {
            var storageobj = new Object()
            //获取一行tr里的所有td
            var thiso = $(this).children()
            storageobj.storageno = storageno
            storageobj.storagegoods = thiso.eq(0).text()
            storageobj.storagegoodsno = thiso.eq(1).text()
            storageobj.storagegoodstype = thiso.eq(2).text()
            storageobj.storageamount = Number(thiso.eq(3).text())
            storageobj.inventory = Number(thiso.eq(4).text())
            storageobj.purno = thiso.eq(5).text()
            storagearr.push(storageobj)
        })

        //生成json格式的字符串,方便转换成json数据
        var jsonstr = {"storageno":storageno,"storagetime":storagetime,"operator":operator,"forwardingunit":forwardingunit,"storagearr":storagearr}

        $.ajax({
            url: "sre/setSreOrder",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(jsonstr),
            dataType: "text",
            success: function (data) {
                alert(data)
                window.location.reload()
            }
        })
    })

</script>
</html>
