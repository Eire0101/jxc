<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/7
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>采购退货</title>
    <base href="http://localhost:9999/demo1/">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="panel panel-default">
        <div class="panel-heading">入库列表</div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <th>入库编号</th>
                <th>操作人</th>
                <th>发货单位</th>
                <th>入库时间</th>
                <th>入库商品编号</th>
                <th>入库商品类型</th>
                <th>入库数量</th>
                <th>采购订单编号</th>
                <th>操作</th>
                </thead>
                <tbody id="sretbody">

                </tbody>
            </table>
        </div>
        <%--分页--%>
        <div class="panel-footer">
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
</body>
<script>
    window.onload = function(){
        queryAllSre()
    }

    //查询所有未退货的入库商品
    function queryAllSre() {
        $.ajax({
            url: "purb/queryAllSre",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#sretbody").empty()
                for (var i in data) {
                    var tr = "<tr>"
                    tr += "<td>"+data[i].storageno+"</td>"
                    tr += "<td>"+data[i].operator+"</td>"
                    tr += "<td>"+data[i].forwardingunit+"</td>"
                    tr += "<td>"+data[i].storagetime+"</td>"
                    tr += "<td>"+data[i].storagegoodsno+"</td>"
                    tr += "<td>"+data[i].storagegoodstype+"</td>"
                    tr += "<td>"+data[i].storageamount+"</td>"
                    tr += "<td>"+data[i].purno+"</td>"
                    tr += "<td><button type=\"button\" class='btn btn-primary th'>退货</button></td>"
                    tr += "</tr>"
                    $("#sretbody").append(tr)
                }
            }
        })
    }

    //当点击退货按钮时,发送数据到服务器退货
    $("#sretbody").on("click",".th",function () {
        //获得td的集合
        var obj = $(this).parent().siblings()
        var purb = new Object()
        purb.purbno = ""
        purb.boperator = ""
        purb.btime = "2019-08-07"
        purb.storageno = obj.eq(0).text()
        purb.consignee = obj.eq(2).text()
        purb.bgoodsno = obj.eq(4).text()
        purb.bgoodstype = obj.eq(5).text()
        purb.bgoodsamount = Number(obj.eq(6).text())
        purb.purno = obj.eq(7).text()
        var jsonstr = {"purb":purb}
        //var jsonstr = {"purbno":purbno,"boperator":boperator,"btime":btime,"consignee":consignee,"bgoodsno":bgoodsno,"bgoodstype":bgoodstype,"bgoodsamount":bgoodsamount,"purno":purno}
        $.ajax({
            url: "purb/th",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(jsonstr),
            success: function (data) {
                alert("成功")
                window.location.reload()
            }
        })
    })
</script>
</html>
