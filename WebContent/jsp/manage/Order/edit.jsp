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

<link rel="stylesheet" type="text/css"
	href="jsp/manage/datepicker/bootstrap-datetimepicker.min.css" />

<script type="text/javascript"
	src="jsp/manage/datepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="jsp/manage/datepicker/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>


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
	<form action="order?editOrder" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover m10">
			<tr>
				<td class="tableleft">美国单号</td>
				<td>
				<input type="hidden" name="id" value="${modelOrder.id }"/>
				<input type="text" name="orderId" value="${modelOrder.orderId }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="tableleft">录入时间</td>
				<td><div class="form-group">
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" name="time" type="text" value="${modelOrder.time }"	readonly/> 
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div></td>
			</tr>
			<tr>
				<td class="tableleft">仓库位置</td>
				<td><input type="text" name="context" value="${modelOrder.context }"/></td>
			</tr>
			<tr>
				<td width="10%" class="tableleft">状态</td>
				<td><select name="state">
						<c:forEach items="${statuss}" var="status">
							<option value="${status.key }" <c:if test="${status.key eq modelOrder.state }">selected</c:if>>${status.value}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="tableleft">国内单号</td>
				<td><input type="text" name="nu" value="${modelOrder.nu }"/></td>
			</tr>
			<tr>
				<td class="tableleft"></td>
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
			window.location.href = "order?orderList";
		});

		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	});
</script>
</html>
