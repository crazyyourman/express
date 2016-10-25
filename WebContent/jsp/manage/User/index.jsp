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

	<form class="form-inline definewidth m20" action="manage?userListByName"
		method="post">
		用户名称： <input type="text" name="name" id="name"
			class="abc input-default" placeholder="" value="${name }">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询</button>
		&nbsp;&nbsp;
		<button type="button" class="btn btn-success" id="addnew">新增用户</button>
	</form>

	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>用户id</th>
				<th>用户名称</th>
				<th>用户密码</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="student">
			<tr id="${student.id }">
				<td><c:out value="${student.id}" /></td>
				<td><c:out value="${student.user}" /></td>
				<td><c:out value="${student.psw}" /></td>
				<td><input type="button" value="编辑" onclick="edit(${student.id})"/> <input type="button"
					onclick="del(${student.id})" value="删除" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>
    $(function () {
		$('#addnew').click(function(){
				window.location.href="manage?toaddManage";
		 });
    });

    function edit(id){
    	window.location.href="manage?toEditManage&id="+id;
    }
    function del(id){   
    	$.ajax( {   
    	    type : "POST",   
    	    url : "<%=request.getContextPath()%>/manage?deleteManage&id=" + id,   
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