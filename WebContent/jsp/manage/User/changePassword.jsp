<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<form action="manage?editManagePassword" method="post" class="definewidth m20">
		<input type="hidden" name="id" value="${model_user.id}" />
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tableleft">登录名</td>
				<td><input type="text" name="username" value="${model_user.user}" disabled="disabled"/></td>
			</tr>
			<tr>
				<td class="tableleft">旧密码</td>
				<td><input type="password" name="passwordOld" /></td>
			</tr>
			<tr>
				<td class="tableleft">新密码</td>
				<td><input type="password" name="passwordNew1" /></td>
			</tr>
			<tr>
				<td class="tableleft">再次输入新密码</td>
				<td><input type="password" name="passwordNew2" /></td>
			</tr>
			<tr>
				<td class="tableleft"><p style="color: red">${errorMessage }</p></td>
				<td>
					<button type="submit" class="btn btn-primary" type="button">保存</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-success" name="backid"
						id="backid">返回列表</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	$(function() {
		$('#backid').click(function() {
			window.location.href = "manage?userList";
		});

	});
</script>
</html>