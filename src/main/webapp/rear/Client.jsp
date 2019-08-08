<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/5
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户资料</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <form role="form" id="myform" class="form-horizontal">
        <div class="row">

            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="custno" class="col-sm-4 control-label">客户编号</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="custno" name="custno" placeholder="客户编号">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="custname" class="col-sm-4 control-label">客户名称</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="custname" name="custname" placeholder="客户名称">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="contact" class="col-sm-4 control-label">联系人</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="contact" name="contact" placeholder="联系人">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="tel" class="col-sm-4 control-label">联系人电话</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="tel" name="tel" placeholder="联系人电话">
                    </div>
                </div>
            </div>

            <div class="col-xs-6 col-md-4">
                <div class="form-group">
                    <label for="email" class="col-sm-4 control-label">客户邮箱</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" id="email" name="email" placeholder="客户邮箱">
                    </div>
                </div>
            </div>

           <div class="col-xs-6 col-md-4">
               <div class="form-group">
            <label for="bank" class="col-sm-4 control-label">银行</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" id="bank" name="bank" placeholder="银行" >
            </div>
        </div>
    </div>
        <div class="col-xs-6 col-md-4">
            <div class="form-group">
                <label for="bankno" class="col-sm-4 control-label">银行卡号</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" id="bankno" name="bankno" placeholder="银行卡号">

                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-4">
            <div class="form-group">
                <label for="custlevelid" class="col-sm-4 control-label">客户级别</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" id="custlevelid" name="custlevelid" placeholder="级别：1>2>3">
                </div>
            </div>
        </div>
        &nbsp;&nbsp;<button id="btn" class="btn btn-success">添加</button>
        </div>
    </form>
</div>

    <table  class="table table-bordered">
        <thead>
        <tr>
            <th>序号</th>
            <th>客户编号</th>
            <th>客户名称</th>
            <th>联系人</th>
            <th>联系人电话</th>
            <th>客户邮箱</th>
            <th>银行</th>
            <th>银行卡号</th>
            <th>客户级别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="mytbd">


        </tbody>

    </table>
<div style="position: fixed; bottom: 20px;">
    当前是第<span id="currPage"></span>页，共<span id="totalpage"></span>页，
    <button id="prevPage">上一页</button><button id="nextPage">下一页</button>
    每页<select id="pageSize">
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
</select>条
</div>

</body>
</html>
<script>
    $(function () {
        queryClient(1,5);

    })


var dataPage;
    function queryClient(pages,pageSize) {
        $.ajax({
            url: "queryClient",
            type: "post",
            dataType: "json",
            data:{"pageNum":pages,"pageSize":pageSize},
            success: function (data) {
                $("#mytbd").html("");
                dataPage=data;
                var datelist=data.list;
                for (var i in datelist) {
                    var tr = "<tr>"
                    tr += "<td>" + datelist[i].custid + "</td>";
                    tr += "<td>" + datelist[i].custno + "</td>";
                    tr += "<td>" + datelist[i].custname + "</td>";
                    tr += "<td>" + datelist[i].contact + "</td>";
                    tr += "<td>" + datelist[i].tel+ "</td>";
                    tr += "<td>" + datelist[i].email + "</td>";
                    tr += "<td>" + datelist[i].bank + "</td>";
                    tr += "<td>" + datelist[i].bankno+ "</td>";
                    tr += "<td>" + datelist[i].custlevel + "</td>";
                    tr+="<td><button  onclick='delClient("+datelist[i].custid+")' type=\"button\" class='btn btn-danger'>删除</button></td>"
                    tr += "</tr>";

                    var option="<option value="+datelist[i].custno+">"+datelist[i].custname+"</option>";
                    $("#custno").append(option);
                    $("#mytbd").append(tr);

                    $("#currPage").html(data.pageNum);
                    $("#totalpage").html(data.pages);
                    if(data.isFirstPage){
                        $("#prevPage").hide();
                    }else{
                        $("#prevPage").show();
                    }
                    if(data.isLastPage){
                        $("#nextPage").hide();
                    }else{
                        $("#nextPage").show();
                    }


                }
            }
        })
    }

    btn.onclick=function(){
        $.ajax({
            url:"addClient",
            type:"post",
            data:$("#myform").serialize(),//将表单序列化提交，将表单中的数据全部提交
            dataType:"json",
            success:function(data){
                queryClient();

            }

        })

    }

    function delClient(val){
        $.ajax({
            url: "delClient",
            type:"post",
            data:{"custid":val},
            dataType:"json",
            success:function(data){

                //重新执行一次查询，刷新页面
                queryClient();

            }
        })
    }

    //删除
    $("#mytbd").on("click",".btn",function(){
        if(confirm("是否删除?")) {
            $(this).parent().parent().remove();
            num--;
        }
    })

    $("#nextPage").click(function(){
        //将下一页的页码传到服务器
        queryClient(dataPage.nextPage,$("#pageSize").val());
    })
    $("#prevPage").click(function(){
        //将上一页的页码传到服务器
        queryClient(dataPage.prePage,$("#pageSize").val());
    })

    $("#pageSize").change(function(){
        queryClient(dataPage.pageNum,$("#pageSize").val());

    })

    $(function(){
        queryClient(1,5);
    })

</script>
