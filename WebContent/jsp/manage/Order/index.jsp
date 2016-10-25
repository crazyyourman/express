<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="jsp/manage/Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="jsp/manage/Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="jsp/manage/Css/style.css" />

<script type="text/javascript" src="jsp/manage/Js/jquery.js"></script>
<script type="text/javascript" src="jsp/manage/Js/bootstrap.js"></script>
<script type="text/javascript" src="jsp/manage/Js/ckform.js"></script>
<script type="text/javascript" src="jsp/manage/Js/common.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>

	<form class="form-inline definewidth m20" action="order?orderListByOrderId"  method="post">
		美国单号： <input type="text" name="orderId" 
			class="abc input-default" placeholder="" value="${orderId }">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-success" id="addnew">新增国外订单</button>
	</form>

	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>编号</th>
				<th>美国单号</th>
				<th>录入时间</th>
				<th>系统时间</th>
				<th>仓库位置</th>
				<th>状态</th>
				<th>国内单号</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="student" varStatus="index">
			<tr id="${student.id }">
				<td><c:out value="${index.count}" /></td>
				<td><c:out value="${student.orderId}" /></td>
				<td><c:out value="${student.time}" /></td>
				<td><c:out value="${student.createDate}" /></td>
				<td><c:out value="${student.context}" /></td>
				<td><c:out value="${student.stateString}" /></td>
				<td><a href="order?toInnerOrder&nu=${student.nu }"><c:out value="${student.nu}" /></a></td>
				<td><input type="button" value="编辑" onclick="edit(${student.id})"/> <input type="button"
					onclick="del(${student.id})" value="删除" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>
    $(function () {
		$('#addnew').click(function(){
				window.location.href="order?toaddOrder";
		 });
    });

    
    function edit(id){
    	window.location.href="order?toEditOrder&id="+id;
    }
    function del(id){   
    	$.ajax( {   
    	    type : "POST",   
    	    url : "<%=request.getContextPath()%>/order?deleteOrder&id=" + id,   
    	    dataType: "json",   
    	    success : function(data) {   
    	        if(data.del == "true"){   
    	            alert("删除成功！");   
    	            $("#" + id).remove();   
    	        }   
    	        else{   
    	            alert("删除失败！");   
    	        }   
    	    },   
    	    error :function(){   
    	        alert("网络连接出错！");   
    	    }   
    	});   
    	} 
</script>
</html>