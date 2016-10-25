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
	<form action="order?binding" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover m10">
			<tr>
				<td class="tableleft">美国单号</td>
				<td><input type="text" name="OrderId" /></td>
			</tr>
			<tr>
				<td width="10%" class="tableleft">快递公司</td>
				<td><select name="com">
						<option value="anxindakuaixi">安信达</option>
						<option value='huitongkuaidi'>百世汇通</option>
						<option value='baifudongfang'>百福东方</option>
						<option value='datianwuliu'>大田物流</option>
						<option value='debangwuliu'>德邦物流</option>
						<option value='#' selected>需要完善支持的快递公司</option>
				</select></td>
			</tr>
			<tr>
				<td class="tableleft">国内单号</td>
				<td><input type="text" name="nu" /></td>
			</tr>
			<tr>
				<td class="tableleft"></td>
				<td>
					<button type="submit" class="btn btn-primary" type="button">保存</button>
					&nbsp;&nbsp;
					${message }
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	$(function() {
		$('#backid').click(function() {
			window.location.href = "order?toBinding";
		});
	});
</script>
</html>
