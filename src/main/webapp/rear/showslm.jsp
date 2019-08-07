<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/5
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>销售人员管理</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>
            </div>
            <div class="modal-body">
                <form id="modal-form" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">销售人员id</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="slmid" readonly placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">销售人员编号</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="slmno" readonly placeholder="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">销售人员名称</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="slmname" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">联系电话</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="contacttel" placeholder="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">邮箱</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="email" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">开户银行</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="bank" placeholder="">
                                </div>
                            </div>
                        </div>
                    </div><div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label">银行账号</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="bankaccount" placeholder="">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary confirm-update">确认修改</button>
            </div>
        </div>
    </div>
</div>

    <div class="container">
        <%--增加销售人员--%>
        <div class="panel panel-default">
            <div class="panel-heading">
                添加销售人员
            </div>
            <div class="panel-body">
                <form class="form-horizontal" id="addSlmForm">
                    <div class="row">
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">销售人员编号</label>
                                <div class="col-md-8">
                                    <input name="slmno" class="form-control" placeholder="销售人员编号" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">销售人员名称</label>
                                <div class="col-md-8">
                                    <input name="slmname" class="form-control" placeholder="销售人员名称">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">联系电话</label>
                                <div class="col-md-8">
                                    <input name="contacttel" class="form-control" placeholder="联系电话">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">住址</label>
                                <div class="col-md-8">
                                    <input name="address" class="form-control" placeholder="住址">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">开户银行</label>
                                <div class="col-md-8">
                                    <input name="bank" class="form-control" placeholder="开户银行">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">银行账号</label>
                                <div class="col-md-8">
                                    <input name="bankaccount" class="form-control" placeholder="银行账号">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-md-4">
                            <div class="form-group">
                                <label class="col-md-4">邮箱</label>
                                <div class="col-md-8">
                                    <input name="email" class="form-control" placeholder="邮箱">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-offset-10">
                        <button type="button" class="btn btn-primary addSlm">确认添加</button>
                    </div>
                </div>
            </div>
        </div>

            <%--销售人员列表--%>
            <div class="panel panel-default">
                <div class="panel-heading">销售人员列表</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>销售人员id</th>
                            <th>销售人员编号</th>
                            <th>销售人员名称</th>
                            <th>联系电话</th>
                            <th>邮箱</th>
                            <th>开户银行</th>
                            <th>银行账号</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="slmTbody">

                        </tbody>
                    </table>
                </div>
                <div style="bottom: 20px" class="panel-footer">
                    <div class="row">
                        <div class="col-md-offset-5">
                            <nav aria-label="pager">
                                <ul class="pager">
                                    <li>当前第<span class="pager-currpage" aria-hidden="true"></span>页,共<span class="pager-totalpage" aria-hidden="true"></span>页</li>
                                    <li>
                                        显示
                                            <select class="pager-select">
                                                <option value="5">5</option>
                                                <option value="10" selected>10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                            </select>
                                            条数据

                                    </li>
                                    <li><a name="firstPage" href="javascript:0">第一页</a></li>
                                    <li><a name="lastPage" href="javascript:0">最后一页</a></li>
                                    <li><a class="btn btn-default" name="prePage" href="javascript:0">Previous</a></li>
                                    <li><a class="btn btn-default" name="nextPage" href="javascript:0">Next</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</body>
<script>
    $(window).load(function () {
        generateNo()
        selAllSlm(1,$(".pager-select").val())
    })

    //分页对象
    var pager

    //获取所有销售人员列表
    function selAllSlm(pageNum,pageSize) {
        $.ajax({
            url: "slm/selAllSlm",
            type: "post",
            data: {"pageNum":pageNum,"pageSize":pageSize},
            dataType: "json",
            success: function (data) {
                //生成编号
                generateNo()
                //清空之前的数据
                $("#slmTbody").empty()
                //封装分页对象
                pager = data
                console.log(pager)
                //获取分页结果
                var datalist = data.list
                for(var i in datalist){
                    var tr ="<tr>"
                    tr += "<td>"+datalist[i].slmid+"</td>"
                    tr += "<td>"+datalist[i].slmno+"</td>"
                    tr += "<td>"+datalist[i].slmname+"</td>"
                    tr += "<td>"+datalist[i].contacttel+"</td>"
                    tr += "<td>"+datalist[i].email+"</td>"
                    tr += "<td>"+datalist[i].bank+"</td>"
                    tr += "<td>"+datalist[i].bankaccount+"</td>"
                    tr += "<td>"+"<div class=\"btn-group\">\n" +
                        "  <button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                        "    管理 <span class=\"caret\"></span>\n" +
                        "  </button>\n" +
                        "  <ul class=\"dropdown-menu\">\n" +
                        "    <li><a class=\"slmUpdate\" data-toggle=\"modal\" data-target=\"#myModal\" href=\"javascript:0\">修改信息</a></li>\n" +
                        "    <li><a class='slmDel' href=\"javascript:0\">删除</a></li>\n" +
                        "  </ul>\n" +
                        "</div>"+"</td>"
                    tr += "</tr>"
                    $("#slmTbody").append(tr)

                    //分页工具显示
                    $(".pager-currpage").text(data.pageNum)
                    $(".pager-totalpage").text(data.pages)

                    //第一页和最后一页时分别将两个按钮隐藏
                    if(data.isFirstPage){
                        $("[name=prePage]").hide()
                    }else{
                        $("[name=prePage]").show()
                    }
                    if(data.isLastPage){
                        $("[name=nextPage]").hide()
                    }else{
                        $("[name=nextPage]").show()
                    }
                }
            }
        })
    }



    //上一页
    $("[name=prePage]").click(function () {
        selAllSlm(pager.prePage,$(".pager-select").val())
    })

    //下一页
    $("[name=nextPage]").click(function () {
        selAllSlm(pager.nextPage,$(".pager-select").val())
    })

    //第一页
    $("[name=firstPage]").click(function () {
        selAllSlm(pager.firstPage,$(".pager-select").val())
    })

    //最后一页
    $("[name=lastPage]").click(function () {
        selAllSlm(pager.lastPage,$(".pager-select").val())
    })


    //当页面容量发生变化时显示数据的改变
    $(".pager-select").change(function () {
        //改变后的总页数(小数部分向上取整)
        var changedPages = Math.ceil(pager.total / $(".pager-select").val())
        //当改变后的页数比之前少且当前页数超出改变后最大的页数
        if(changedPages < pager.pages && pager.pageNum > changedPages){
            selAllSlm(changedPages,$(".pager-select").val())
        }/*else if(pager.total / $(".pager-select").val() > pager.pages){

        }*/else{
            selAllSlm(pager.pageNum,$(".pager-select").val())
        }
    })

    //获取销售人员表行数,有服务器生成编号
    function generateNo(){
        $.ajax({
            url: "slm/generateNo",
            type: "post",
            dataType: "text",
            success: function (data) {
                $("#addSlmForm [name=slmno]").val(data)
            }
        })
    }

    //添加销售人员
    $(".addSlm").click(function () {
        $.ajax({
            url: "slm/addSlm",
            type: "post",
            data: $("#addSlmForm").serialize(),
            success: function (data) {
                selAllSlm(pager.pageNum,$(".pager-select").val())
            }
        })
    })

    //删除销售人员
    $("#slmTbody").on("click",".slmDel",function () {
        var slmid = $(this).parents("td").siblings().eq(0).text()
        $.ajax({
            url: "slm/delSlm",
            type: "post",
            data: {"slmid":slmid},
            success: function (data) {
                selAllSlm(pager.pageNum,$(".pager-select").val())
            }
        })
    })

    //修改销售人员信息按钮
    $("#slmTbody").on("click",".slmUpdate",function () {
        $("#modal-form [name=slmid]").val($(this).parents("td").siblings().eq(0).text())
        $("#modal-form [name=slmno]").val($(this).parents("td").siblings().eq(1).text())
        $("#modal-form [name=slmname]").val($(this).parents("td").siblings().eq(2).text())
        $("#modal-form [name=contacttel]").val($(this).parents("td").siblings().eq(3).text())
        $("#modal-form [name=email]").val($(this).parents("td").siblings().eq(4).text())
        $("#modal-form [name=bank]").val($(this).parents("td").siblings().eq(5).text())
        $("#modal-form [name=bankaccount]").val($(this).parents("td").siblings().eq(6).text())
    })
    
    //确认修改按钮
    $(".confirm-update").click(function () {
        confirmUpdate()
    })

    //修改信息,成功后刷新列表,关闭模态框
    function confirmUpdate(){
        $.ajax({
            url: "slm/updateSlm",
            type: "post",
            data: $("#modal-form").serialize(),
            success: function (data) {
                selAllSlm(pager.pageNum,$(".pager-select").val())
                $("#myModal").modal('hide')
            }
        })
    }

    //按下enter键,确认修改
    $("#myModal").keydown(function (event) {
        if(event.which == 13){
            confirmUpdate()
        }
    })
</script>
</html>
