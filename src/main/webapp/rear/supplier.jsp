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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body" id="mymodal-body">
                <form id="updateForm">
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <div class="form-group">
                                <label for="supid">供应商id</label>
                                <input type="text" name="supid" class="form-control" id='supid' readonly>
                            </div>
                        </div>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='supno'>供应商编号</label>
                                <input type='text' name='supno' class='form-control' id='supno'>
                            </div>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='supname'>供应商名</label>
                                <input type='text' name='supname' class='form-control' id='supname'>
                            </div>
                        </div>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='contact'>联系人</label>
                                <input type='text' name='contact' class='form-control' id='contact'>
                            </div>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='contacttel'>联系人号码</label>
                                <input type='text' name='contacttel' class='form-control' id='contacttel'>
                            </div>
                        </div>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='email'>邮箱</label>
                                <input type='text' name='email' class='form-control' id='email'>
                            </div>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='address'>地址</label>
                                <input type='text' name='address' class='form-control' id='address'>
                            </div>
                        </div>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='bank'>开户银行</label>
                                <input type='text' name='bank' class='form-control' id='bank'>
                            </div>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col-sm-6 col-md-6'>
                            <div class='form-group'>
                                <label for='bankaccount'>银行账号</label>
                                <input type='text' name='bankaccount' class='form-control' id='bankaccount'>
                            </div>
                        </div>

                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateSup">提交修改</button>
            </div>
        </div>
    </div>
</div>

<form id="myform">
    <fieldset>

        <legend>添加供应商</legend>
        <div class="row">
            <div class="col-xs-6 col-md-4">供应商id:&nbsp<input name="supid"/></div>
            <div class="col-xs-6 col-md-4">编号:<input name="supno"/></div>
            <div class="col-xs-6 col-md-4">供应商名:<input name="supname"></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-4">联系人:&nbsp&nbsp&nbsp&nbsp<input name="contact"/></div>
            <div class="col-xs-6 col-md-4">地址:<input name="email"/></div>
            <div class="col-xs-6 col-md-4">电话号码:<input name="contacttel"/></div>
        </div>
        <div class="row">

            <div class="col-xs-6 col-md-4">开户银行:<input name="bank"/></div>
            <div class="col-xs-6 col-md-4">邮箱:<input name="address"/></div>
            <div class="col-xs-6 col-md-4">银行卡号:<input name="bankaccount"/></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <button class="btn btn-primary" style="width:150px" id="btn" onclick="addSup()">添加</button>
            </div>
        </div>

    </fieldset>

</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>供应商id</th>
        <th>供应商编号</th>
        <th>供应商名字</th>
        <th>供应商联系人</th>
        <th>联系人号码</th>
        <th>邮箱</th>
        <th>地址</th>
        <th>开户银行</th>
        <th>银行卡号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">

    </tbody>

</table>
</body>
<script>

    window.onload = function(){
        selectAllSup()
    }

    //查询所有员工信息并填充到列表
    function selectAllSup(){
        $("#mytbd").html(null)
        $.ajax({
            url: "sup/selectAllSup",
            type: "post",
            dataType: "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].supid+"</td>";
                    tr+="<td>"+data[i].supno+"</td>";
                    tr+="<td>"+data[i].supname+"</td>";
                    tr+="<td>"+data[i].contact+"</td>";
                    tr+="<td>"+data[i].contacttel+"</td>";
                    tr+="<td>"+data[i].email+"</td>";
                    tr+="<td>"+data[i].address+"</td>";
                    tr+="<td>"+data[i].bank+"</td>";
                    tr+="<td>"+data[i].bankaccount+"</td>";
                    tr+="<td><button  class='btn btn-primary' value='"+data[i].supid+"' id='delSup'>删除</button>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<button class='btn btn-primary'value='"+data[i].supid+"' type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\" id='modal-btn'>修改</button>" +
                        "</td>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);
                }
            }
        })
    }

    //添加员工
    function addSup(){
        $.ajax({
            url: "sup/addSup",
            type: "post",
            data: $("#myform").serialize(),
            success: function(data){
                selectAllSup()
            }
        })
    }

    //删除员工
    function delSup(element){
        $.ajax({
            url: "sup/delSup",
            type: "post",
            data: {supid:element.val()},
            dataType: "text",
            success: function(data){
                alert("删除成功")
                selectAllSup()
            }
        })
    }



    $("#mytbd").on("click","#delSup",function(){
        delSup($(this))
    })

    $("#mytbd").on("click","#modal-btn",function(){

        $.ajax({
            url: "sup/selSupById",
            type: "post",
            data: {supid: $(this).val()},
            dataType: "json",
            success: function(data){

                $("#updateForm").find("#supid").val(data.supid)
                $("#updateForm").find("#supno").val(data.supno)
                $("#updateForm").find("#supname").val(data.supname)
                $("#updateForm").find("#contact").val(data.contact)
                $("#updateForm").find("#contacttel").val(data.contacttel)
                $("#updateForm").find("#address").val(data.address)
                $("#updateForm").find("#email").val(data.email)
                $("#updateForm").find("#bank").val(data.bank)
                $("#updateForm").find("#bankaccount").val(data.bankaccount)

            }
        })

    })

    $("#myModal").on("click","#updateSup",function(){
        $.ajax({
            url: "sup/updateSup",
            type: "post",
            data: $("#updateForm").serialize(),
            success: function(data){
                selectAllSup()
                $("#myModal").modal('hide')
            }
        })
    })

</script>
</html>
