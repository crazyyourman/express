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

	<form class="form-inline definewidth m20" action=""	method="get">
	<button type="button" class="btn btn-success" id="addnew">国内订单详细-物流单号[${orderList[0].nu}]</button>
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>编号</th>
				<th>物流公司编号</th>
				<th>时间</th>
				<th>内容描述</th>
				<th>状态</th>
			</tr>
		</thead>
		<c:forEach items="${orderList}" var="student" varStatus="index">
			<tr id="${student.id }">
				<td><c:out value="${index.count}" /></td>
				<td><c:out value="${student.com}" /></td>
				<td><c:out value="${student.time}" /></td>
				<td><c:out value="${student.context}" /></td>
				<td><c:out value="${student.stateString}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>