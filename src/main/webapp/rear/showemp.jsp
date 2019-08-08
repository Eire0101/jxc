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
    <title>员工页面</title>
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
                        <label for="empid">员工id</label>
                        <input type="text" name="empid" class="form-control" id='empid' readonly>
                        </div>
                    </div>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='roleid'>角色id</label>
                        <input type='text' name='roleid' class='form-control' id='roleid'>
                        </div>
                    </div>
                    </div>
                    <div class='row'>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='empno'>员工编号</label>
                        <input type='text' name='empno' class='form-control' id='empno'>
                        </div>
                    </div>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='empsex'>性别</label>
                        <input type='text' name='empsex' class='form-control' id='empsex'>
                        </div>
                    </div>
                    </div>
                    <div class='row'>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='empidno'>身份证号</label>
                        <input type='text' name='empidno' class='form-control' id='empidno'>
                        </div>
                    </div>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='tel'>电话号码</label>
                        <input type='text' name='tel' class='form-control' id='tel'>
                        </div>
                    </div>
                    </div>
                    <div class='row'>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='empemail'>邮箱</label>
                        <input type='text' name='empemail' class='form-control' id='empemail'>
                        </div>
                    </div>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='address'>住址</label>
                        <input type='text' name='address' class='form-control' id='address'>
                        </div>
                    </div>
                    </div>
                    <div class='row'>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='nativeplace'>籍贯</label>
                        <input type='text' name='nativeplace' class='form-control' id='nativeplace'>
                        </div>
                    </div>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='nation'>民族</label>
                        <input type='text' name='nation' class='form-control' id='nation'>
                        </div>
                    </div>
                    </div>
                    <div class='row'>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='education'>学历</label>
                        <input type='text' name='education' class='form-control' id='education'>
                        </div>
                    </div>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='university'>毕业院校</label>
                        <input type='text' name='university' class='form-control' id='university'>
                        </div>
                    </div>
                    </div>
                    <div class='row'>
                    <div class='col-sm-6 col-md-6'>
                        <div class='form-group'>
                        <label for='bankno'>银行卡号</label>
                        <input type='text' name='bankno' class='form-control' id='bankno'>
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
                        <label for='emppassword'>密码</label>
                        <input type='text' name='emppassword' class='form-control' id='emppassword'>
                        </div>
                    </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateEmp">提交修改</button>
            </div>
        </div>
    </div>
</div>

<form id="myform">
    <fieldset>

        <legend>添加员工</legend>
        <div class="row">
            <div class="col-xs-6 col-md-4">员工id:<input name="empid"/></div>
            <div class="col-xs-6 col-md-4">密码:<input name="emppassword"/></div>
            <div class="col-xs-6 col-md-4">角色id:<input name="roleid"></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-4">员工编号:<input name="empno"/></div>
            <div class="col-xs-6 col-md-4">性别:<input name="empsex"/></div>
            <div class="col-xs-6 col-md-4">身份证号:<input name="empidno"/></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-4">电话号码:<input name="tel"/></div>
            <div class="col-xs-6 col-md-4">邮箱:<input name="empemail"/></div>
            <div class="col-xs-6 col-md-4">住址:<input name="address"/></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-4">籍贯:<input name="nativeplace"/></div>
            <div class="col-xs-6 col-md-4">民族:<input name="nation"/></div>
            <div class="col-xs-6 col-md-4">学历:<input name="education"/></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-md-4">毕业院校:<input name="university"/></div>
            <div class="col-xs-6 col-md-4">银行卡号:<input name="bankno"/></div>
            <div class="col-xs-6 col-md-4">开户银行:<input name="bank"/></div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0">
                <button class="btn btn-primary" style="width:150px" id="btn" onclick="addEmp()">添加</button>
            </div>
        </div>

    </fieldset>

</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>员工id</th>
        <th>员工密码</th>
        <th>角色id</th>
        <th>员工编号</th>
        <th>性别</th>
        <th>身份证号</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>住址</th>
        <th>籍贯</th>
        <th>民族</th>
        <th>学历</th>
        <th>毕业院校</th>
        <th>银行卡号</th>
        <th>开户银行</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">

    </tbody>

</table>
</body>
<script>

    window.onload = function(){
        selectAllEmp()
    }

    //查询所有员工信息并填充到列表
    function selectAllEmp(){
        $("#mytbd").html(null)
        $.ajax({
            url: "emp/selectAllEmp",
            type: "post",
            dataType: "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].empid+"</td>";
                    tr+="<td>"+data[i].emppassword+"</td>";
                    tr+="<td>"+data[i].roleid+"</td>";
                    tr+="<td>"+data[i].empno+"</td>";
                    tr+="<td>"+data[i].empsex+"</td>";
                    tr+="<td>"+data[i].empidno+"</td>";
                    tr+="<td>"+data[i].tel+"</td>";
                    tr+="<td>"+data[i].empemail+"</td>";
                    tr+="<td>"+data[i].address+"</td>";
                    tr+="<td>"+data[i].nativeplace+"</td>";
                    tr+="<td>"+data[i].nation+"</td>";
                    tr+="<td>"+data[i].education+"</td>";
                    tr+="<td>"+data[i].university+"</td>";
                    tr+="<td>"+data[i].bankno+"</td>";
                    tr+="<td>"+data[i].bank+"</td>";
                    tr+="<td><button  class='btn btn-primary' value='"+data[i].empid+"' id='delEmp'>删除</button>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<button class='btn btn-primary'value='"+data[i].empid+"' type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\" id='modal-btn'>修改</button>" +
                        "</td>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);
                }
            }
        })
    }

    //添加员工
    function addEmp(){
        $.ajax({
            url: "emp/addEmp",
            type: "post",
            data: $("#myform").serialize(),
            success: function(data){
                selectAllEmp()
            }
        })
    }

    //删除员工
    function delEmp(element){
        $.ajax({
            url: "emp/delEmp",
            type: "post",
            data: {empid:element.val()},
            dataType: "text",
            success: function(data){
                alert("删除成功")
                selectAllEmp()
            }
        })
    }

    //根据id查询员工
/*    function selEmpById(empdata){
        $.ajax({
            url: "emp/selEmpById",
            type: "post",
            data: {empid: empdata.val()},
            dataType: "json",
            success: function(data){
                console.log(data)
                return data
            }
        })
    }*/

    $("#mytbd").on("click","#delEmp",function(){
        delEmp($(this))
    })

    $("#mytbd").on("click","#modal-btn",function(){
        //var emp = selEmpById($(this))
        //$("#updateForm").html(null)
        $.ajax({
            url: "emp/selEmpById",
            type: "post",
            data: {empid: $(this).val()},
            dataType: "json",
            success: function(data){
                /*var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='empid'><div class='form-group'>" +
                    "<label for='empid'>" + "员工id" + "</label>" +
                    "<input type='text' class='form-control' id='empid' value='"+data.empid+"'readonly>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='roleid'><div class='form-group'>" +
                    "<label for='roleid'>" + "角色id" + "</label>" +
                    "<input type='text' class='form-control' id='roleid' value='"+data.roleid+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='empno'><div class='form-group'>" +
                    "<label for='empno'>" + "员工编号" + "</label>" +
                    "<input type='text' class='form-control' id='empno' value='"+data.empno+"'>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='empsex'><div class='form-group'>" +
                    "<label for='empsex'>" + "性别" + "</label>" +
                    "<input type='text' class='form-control' id='empsex' value='"+data.empsex+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='empidno'><div class='form-group'>" +
                    "<label for='empidno'>" + "身份证号" + "</label>" +
                    "<input type='text' class='form-control' id='empidno' value='"+data.empidno+"'>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='tel'><div class='form-group'>" +
                    "<label for='tel'>" + "电话号码" + "</label>" +
                    "<input type='text' class='form-control' id='tel' value='"+data.tel+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='empemail'><div class='form-group'>" +
                    "<label for='empemail'>" + "邮箱" + "</label>" +
                    "<input type='text' class='form-control' id='empemail' value='"+data.empemail+"'>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='address'><div class='form-group'>" +
                    "<label for='address'>" + "住址" + "</label>" +
                    "<input type='text' class='form-control' id='address' value='"+data.address+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='nativeplace'><div class='form-group'>" +
                    "<label for='nativeplace'>" + "籍贯" + "</label>" +
                    "<input type='text' class='form-control' id='nativeplace' value='"+data.nativeplace+"'>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='nation'><div class='form-group'>" +
                    "<label for='nation'>" + "民族" + "</label>" +
                    "<input type='text' class='form-control' id='nation' value='"+data.nation+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='education'><div class='form-group'>" +
                    "<label for='education'>" + "学历" + "</label>" +
                    "<input type='text' class='form-control' id='education' value='"+data.education+"'>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='university'><div class='form-group'>" +
                    "<label for='university'>" + "毕业院校" + "</label>" +
                    "<input type='text' class='form-control' id='university' value='"+data.university+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='bankno'><div class='form-group'>" +
                    "<label for='bankno'>" + "银行卡号" + "</label>" +
                    "<input type='text' class='form-control' id='bankno' value='"+data.bankno+"'>" +
                    "</div></div>"
                div += "<div class='col-sm-6 col-md-6' name='bank'><div class='form-group'>" +
                    "<label for='bank'>" + "开户银行" + "</label>" +
                    "<input type='text' class='form-control' id='bank' value='"+data.bank+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)
                var div = "<div class='row'>"
                div += "<div class='col-sm-6 col-md-6' name='emppassword'><div class='form-group'>" +
                    "<label for='emppassword'>" + "密码" + "</label>" +
                    "<input type='text' class='form-control' id='emppassword' value='"+data.emppassword+"'>" +
                    "</div></div>"
                div += "</div>"
                $("#updateForm").append(div)*/
                $("#updateForm").find("#empid").val(data.empid)
                $("#updateForm").find("#roleid").val(data.roleid)
                $("#updateForm").find("#empno").val(data.empno)
                $("#updateForm").find("#empsex").val(data.empsex)
                $("#updateForm").find("#empidno").val(data.empidno)
                $("#updateForm").find("#tel").val(data.tel)
                $("#updateForm").find("#empemail").val(data.empemail)
                $("#updateForm").find("#address").val(data.address)
                $("#updateForm").find("#nativeplace").val(data.nativeplace)
                $("#updateForm").find("#nation").val(data.nation)
                $("#updateForm").find("#education").val(data.education)
                $("#updateForm").find("#university").val(data.university)
                $("#updateForm").find("#bankno").val(data.bankno)
                $("#updateForm").find("#bank").val(data.bank)
                $("#updateForm").find("#emppassword").val(data.emppassword)
            }
        })

    })

    $("#myModal").on("click","#updateEmp",function(){
        $.ajax({
            url: "emp/updateEmp",
            type: "post",
            data: $("#updateForm").serialize(),
            success: function(data){
                selectAllEmp()
                $("#myModal").modal('hide')
            }
        })
    })


</script>
</html>
