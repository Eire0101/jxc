<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/30
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>申请采购</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form id="purform" class="form-horizontal">
        <div class="row">
            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="purno" class="col-sm-4 control-label">采购单编号</label>
                    <div class="col-sm-8">
                    <input class="form-control" type="text" id="purno" name="purno" placeholder="采购单编号" readonly>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="purman" class="col-sm-4 control-label">采购人</label>
                    <div class="col-sm-8">
                    <input class="form-control" type="text" id="purman" name="purman" placeholder="采购人">
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="applydep" class="col-sm-4 control-label">申请部门</label>
                    <div class="col-sm-8">
                    <input class="form-control" type="text" id="applydep" name="applydep" placeholder="申请部门">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="applyman" class="col-sm-4 control-label">申请人</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="applyman" name="applyman" placeholder="申请人">
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="description" class="col-sm-4 control-label">说明</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="description" name="description" placeholder="说明">
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="buymoney" class="col-sm-4 control-label">采购总价</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="buymoney" name="buymoney" placeholder="采购总价" readonly>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-3 col-xs-offset-9">
                <button type="button" class="btn btn-default btn-lg" id="addgoods">添加商品</button>
                <button class="btn btn-primary btn-lg" id="submit" type="button">提交</button>
            </div>
        </div>

        <div class="container">
            <table class="table table-hover">
                <thead>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品规格</th>
                    <th>类型名称</th>
                    <th>采购单价</th>
                    <th>销售单价</th>
                    <th>建议零售价</th>
                    <th>产地</th>
                    <th>库存</th>
                    <th>计量单位</th>
                    <th>数量</th>
                    <th>小计(元)</th>
                    <th>操作</th>
                </thead>
                <tbody id="mytbody">

                </tbody>
            </table>
        </div>
    </form>
</div>
</body>
<script>

    //全局商品数据
    var ggd

    window.onload = function(){
        selAllGoods()
        getPurCount()
    }

    function selAllGoods(){
        $.ajax({
            url: "goods/selAllGoods",
            type: "post",
            dataType: "json",
            success: function(data){
                ggd = data
            }
        })
    }

    //获取系统给的采购单编号
    function getPurCount(){
        $.ajax({
            url: "pur/getPurCount",
            type: "post",
            dataType: "text",
            success: function (data) {
                $("[name='purno']").val(data)
            }
        })
    }

    //添加采购商品
    $("#addgoods").click(function(){
        var tr = "<tr>"
        tr+="<td></td>"
        tr+="<td><select class='goodsselect'><option value='--选择商品--'>--选择商品--</option><select></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td></td>"
        tr+="<td><input name='goodscount' class='form-control' style='width:50px' disabled></td>"
        tr+="<td></td>"
        tr+="<td><button class='btn btn-danger'>删除</button></td>"
        tr+= "</tr>"
        $("#mytbody").append(tr)
        appendGoods()
    })

    //行计数器
    var count = 0

    function appendGoods(){
        for (var i = 0; i < ggd.length; i++){
            var option = "<option value='"+ggd[i].goodsname+"' name='goodsname'>" + ggd[i].goodsname + "</option>"
            $("#mytbody .goodsselect").eq(count).append(option)
        }
        count++
    }

    $("#mytbody").on("click",".btn",function () {
        remGoods($(this))
    })

    function remGoods(data){
        var money = data.parent().parent().find("input").val() * data.parent().parent().children("td").eq(4).html()
        var totalmoney = $("[name='buymoney']").val()
        totalmoney -= money
        $("[name='buymoney']").val(totalmoney)
        data.parent().parent().remove()
        count--
    }

    $("#mytbody").on("change",".goodsselect",function () {
        for(var i in ggd){
            if(ggd[i].goodsname == $(this).val()){
                $(this).parent().parent().find("td").eq(0).html(ggd[i].goodsno)
                $(this).parent().parent().find("td").eq(2).html(ggd[i].goodsspec)
                $(this).parent().parent().find("td").eq(3).html(ggd[i].typename)
                $(this).parent().parent().find("td").eq(4).html(ggd[i].purchaseprice)
                $(this).parent().parent().find("td").eq(5).html(ggd[i].unitsalesprice)
                $(this).parent().parent().find("td").eq(6).html(ggd[i].suggestedretailprice)
                $(this).parent().parent().find("td").eq(7).html(ggd[i].origin)
                $(this).parent().parent().find("td").eq(8).html(ggd[i].inventory)
                $(this).parent().parent().find("td").eq(9).html(ggd[i].measurement)
            }
        }
        if($(this).val() != "--选择商品--"){
            $(this).parent().parent().find("input").prop("disabled",false)

            var amount = $(this).parent().parent().find("input").val()
            var price = $(this).parent().parent().children("td").eq(4).html()
            //小计大于之前的,则加上大于的部分
            //小计小于之前的,则减去小于的部分
            var money = Number($("[name='buymoney']").val()) + (amount * price - Number($(this).parent().parent().children("td").eq(11).html()))
            $("[name='buymoney']").val(money)

            $(this).parent().parent().children("td").eq(11).html(amount * price)
        }else{
            $(this).parent().parent().find("input").prop("disabled",true)
        }

    })

    $("#mytbody").on("keyup","input",function () {
        var amount = $(this).val()
        var price = $(this).parent().parent().children("td").eq(4).html()
        $(this).parent().next().html(amount * price)
        var money = 0
        $("[name='buymoney']").val("")
        $("#mytbody tr").each(function(){
            money += Number($(this).children("td").eq(11).html())
        })
        $("[name='buymoney']").val(money)
    })

    $("#submit").on("click",function(){
        var purno = $("#purno").val()                                           //采购单编号
        var purman = $("#purman").val()                                         //采购人
        var applydep = $("#applydep").val()                                    //申请部门
        var applyman = $("#applyman").val()                                    //申请人
        var description = $("#description").val()                              //说明
        var buymoney = $("#buymoney").val()                                   //采购总价
        var goodsarr = new Array()
        //对商品单是否正确进行判断
        var flag = true;
        $("#mytbody tr").each(function(){
            var good = new Object()
            if($(this).find(".goodsselect").val() == "--选择商品--"){
                alert("请检查商品")
                flag = false;
                return false;
            }
            good.purno = purno                                                      //采购单编号
            good.goodsno = $(this).children("td").eq(0).html()                     //商品编号
            good.goodsname = $(this).find(".goodsselect").val()                   //商品名称
            good.goodstype = $(this).children("td").eq(3).html()                  //类型名称
            good.puramount = $(this).find("input").val()                          //采购数量
            if($(this).find("input").val() == '' || $(this).find("input").val() < 0){
                alert("请填写正确的商品数量")
                flag = false;
                return false;
            }
            good.subtotal = $(this).children("td").eq(11).html()                  //小计
            goodsarr.push(good)
        })
        if(flag != true){
            return false;
        }
        var jsonstr = {"purno":purno,"purman":purman,"applydep":applydep,"applyman":applyman,"description":description,
        "buymoney":buymoney,"goodsarr":goodsarr}
        submitForm(jsonstr)
    })

    //以json提交页面表单数据
    function submitForm(jsonstr){
        $.ajax({
            url: "pur/submitForm",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(jsonstr),
            dataType: "text",
            success: function (data) {
                if(data == "true"){
                    alert("提交成功")
                    $("#submit").prop("disabled",true)
                }else{
                    alert("提交失败")
                }
                window.location.reload()
            }
        })
    }

</script>
</html>
