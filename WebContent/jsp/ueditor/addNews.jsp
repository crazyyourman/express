<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>功能管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" charset="utf-8"
	src="jsp/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="jsp/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="jsp/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	var ue;
	// 初始化函数
	$(document).ready(function() {
		mini.parse();
		ue = UE.getEditor('container', {
			serverUrl : "${ctx}/system/authority/getImgServer.ac",
			toolbars : [ [ 'bold', //加粗
			'indent', //首行缩进
			'snapscreen', //截图
			'italic', //斜体
			'underline', //下划线
			'strikethrough', //删除线
			'fontborder', //字符边框
			'formatmatch', //格式刷
			'source', //源代码
			'horizontal', //分隔线
			'removeformat', //清除格式
			'insertcode', //代码语言
			'fontfamily', //字体
			'fontsize', //字号
			'selectall', //全选
			'print', //打印
			'preview', //预览
			'paragraph', //段落格式
			'horizontal', //分隔线
			'simpleupload', //单图上传
			'insertimage', //多图上传
			'removeformat', //清除格式
			'date', //日期
			'time', //时间
			'link', //超链接
			'unlink', //取消链接
			'emotion', //表情
			'spechars', //特殊字符
			'searchreplace', //查询替换
			'help', //帮助
			'justifyleft', //居左对齐
			'justifyright', //居右对齐
			'justifycenter', //居中对齐
			'justifyjustify', //两端对齐
			'forecolor', //字体颜色
			'backcolor', //背景色
			'insertorderedlist', //有序列表
			'insertunorderedlist', //无序列表
			'fullscreen', //全屏
			'imagecenter', //居中
			'lineheight', //行间距
			'edittip ', //编辑提示
			'customstyle', //自定义标题
			'touppercase', //字母大写
			'tolowercase', //字母小写
			'autotypeset', //自动排版
			] ],
			autoHeightEnabled : true,
			autoFloatEnabled : true
		});

	});
</script>
</head>
<body>

	<script id="container" name="describes" type="text/plain"
		style="width:100%;height:350px;"></script>


</body>
</html>
