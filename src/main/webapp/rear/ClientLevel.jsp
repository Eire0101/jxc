<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户级别</title>
    <base href="http://localhost:9999/demo1/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>序号</th>
        <th>客户编号</th>
        <th>客户名称</th>
        <th>联系人</th>
        <th>联系人电话</th>
        <th>客户级别</th>
        <th>操作</th>

    </tr>

    </thead>


    <tbody id="mytbd">


    </tbody>
</table>
<div class="container">
    <div class="row">
       <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title center-block" id="myModalLabel" >
                    修改
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform">
                    <h4>序号：<br/></h4>
                    <input class="custid" name="custid" placeholder="序号"  readonly/><br/><br/>
                    <h4>联系人：<br/></h4>
                    <input class="contact" name="contact" placeholder="联系人" /><br/><br/>
                    <h4>联系人电话：<br/></h4>
                    <input class="tel" name="tel" placeholder="联系人电话" /><br/><br/>
                    <h4>客户级别：<br/></h4>
                    <input class="custlevel"  style="color:#FF0000" name="custlevel" placeholder="客户级别" readonly/><br/><br/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary btn-success" id="updateconfirm">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</div>
</div>

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
        queryClientLevel(1,5);
        queryClientLevel2();

    })




    var dataPage;
    function queryClientLevel(pages,pageSize){
        $.ajax({
            url:"queryClientLevel",
            type:"post",
            dataType:"json",
            data:{"pageNum":pages,"pageSize":pageSize},
            success:function(data){
                $("#mytbd").html("");
                dataPage=data;
                var datelist=data.list;
                for (var i in datelist) {
                    var tr = "<tr>"
                    tr += "<td>" + datelist[i].custid + "</td>";
                    tr += "<td>" + datelist[i].custno + "</td>";
                    tr += "<td>" + datelist[i].custname + "</td>";
                    tr += "<td>" + datelist[i].contact + "</td>";
                    tr += "<td>" + datelist[i].tel + "</td>";
                    tr += "<td>" + datelist[i].custlevel + "</td>";
                    tr +=" <td><button  type='button' class='btn btn-danger btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">修改</button>" +
                    "</td>"
                    tr += "</tr>";
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

        });

    }


    function queryClientLevel2() {
        $.ajax({
            url: "selectClientLevel2",
            type: "post",
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    //option:value（提交到服务器），text(用户直观看到的)
                    var option = "<option value=" + data[i].custlevelid + ">" + data[i].custlevel + "</option>";
                    $("#custlevelid").append(option);
                    $("#myform2 select").append(option);
                }
            }

        });
    }



    //点击修改时需要将被点击行的数据填充到form中
    $("#mytbd").on("click",".update",function(){
        //节点
        $(".custid").val($(this).parent().parent().find("td").eq(0).html());
        $(".contact").val($(this).parent().parent().find("td").eq(3).html());
        $(".tel").val($(this).parent().parent().find("td").eq(4).html());
        $(".custlevel").val($(this).parent().parent().find("td").eq(5).html());
    })
    // 点击确认修改按钮时，提交表单
    updateconfirm.onclick=function(){
        if(confirm("确认修改?")){
            $.ajax({
                url:"updateClientLevel",
                type:"post",
                data:$("#myform").serialize(),//将表单序列化提交，将表单中的数据全部提交
                dataType:"text",
                success:function(data) {
                    if (data == "true") {
                        queryClientLevel();
                        $('#myModal').modal('hide');
                    }
                }
            })
        }
    }


    $("#nextPage").click(function(){
        //将下一页的页码传到服务器
        queryClientLevel(dataPage.nextPage,$("#pageSize").val());
    })
    $("#prevPage").click(function(){
        //将上一页的页码传到服务器
        queryClientLevel(dataPage.prePage,$("#pageSize").val());
    })

    $("#pageSize").change(function(){
        queryClientLevel(dataPage.pageNum,$("#pageSize").val());

    })

    $(function(){
        queryClientLevel(1,5);
    })

</script>