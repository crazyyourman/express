<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<link href="jsp/front/css/bootstrap.min.css" rel='stylesheet'
	type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="jsp/front/js/jquery.min.js"></script>
<script src="jsp/front/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="jsp/front/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="jsp/front/js/move-top.js"></script>
<script type="text/javascript" src="jsp/front/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!---- start-smoth-scrolling---->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
</script>
<!----start-top-nav-script---->
<script>
			$(function() {
				var pull 		= $('#pull');
					menu 		= $('nav ul');
					menuHeight	= menu.height();
				$(pull).on('click', function(e) {
					e.preventDefault();
					menu.slideToggle();
				});
				$(window).resize(function(){
	        		var w = $(window).width();
	        		if(w > 320 && menu.is(':hidden')) {
	        			menu.removeAttr('style');
	        		}
	    		});

	    		$('#ad-carousel').carousel();
			        $('#menu-nav .navbar-collapse a').click(function (e) {
			            var href = $(this).attr('href');
			            var tabId = $(this).attr('data-tab');
			            if ('#' !== href) {
			                e.preventDefault();
			                $(document).scrollTop($(href).offset().top - 70);
			                if (tabId) {
			                    $('#feature-tab a[href=#' + tabId + ']').tab('show');
			                }
			            }
			        });
			});

		</script>
</head>
<body>
	<!----- start-header---->
	<div id="home" class="header">
		<div class="top-header">
			<div class="container">
				<div class="logo">
					<a href="index.html"><img src="jsp/front/images/logo.png"
						title="Resto" /></a>
				</div>
				<!----start-top-nav---->
				<nav class="top-nav">
					<ul class="top-nav">
						<li class="active"><a href="#">首页</a></li>
						<li><a href="#"> 消息动态</a></li>
					</ul>
					<a href="#" id="pull"><img src="jsp/front/images/nav-icon.png"
						title="menu" /></a>
				</nav>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!----- //End-header---->
	<!----- banner ---->
	<!-- <div class="banner text-center">
				<div class="container">
					<div class="banner-info">
						<h1>This Template Is Awesome</h1>
						<h2><label> </label>resto restaurant bootstrap framework website template<label> </label></h2>
					</div>
				</div>
			</div> -->
	<!----- banner ---->

	<!-- 广告轮播 -->
	<div id="ad-carousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
			<li data-target="#ad-carousel" data-slide-to="1"></li>
			<li data-target="#ad-carousel" data-slide-to="2"></li>
			<li data-target="#ad-carousel" data-slide-to="3"></li>
			<li data-target="#ad-carousel" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="jsp/front/images/chrome-big.jpg" alt="1 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Chrome</h1>
						<p>Google Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的网页浏览器。</p>

					</div>
				</div>
			</div>
			<div class="item">
				<img src="jsp/front/images/firefox-big.jpg" alt="2 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Firefox</h1>
						<p>Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器。</p>

					</div>
				</div>
			</div>
			<div class="item">
				<img src="jsp/front/images/safari-big.jpg" alt="3 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Safari</h1>
						<p>Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器。</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="jsp/front/images/opera-big.jpg" alt="4 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Opera</h1>
						<p>Opera浏览器，是一款挪威Opera Software ASA公司制作的支持多页面标签式浏览的网络浏览器。</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="jsp/front/images/ie-big.jpg" alt="5 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>IE</h1>
						<p>Internet Explorer，简称 IE，是微软公司推出的一款网页浏览器。</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#ad-carousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<!----- menu ---->
	<div class="menu">
		<div class="container">
			<div class="menu-head text-center">
				<h3>
					<span>订单服务</span>
				</h3>
			</div>
		</div>
		<!----- main-menus ----->
		<form action="index.do?orderListByOrderId" method="post">
			<div class="main-menus">
				<div class="container">
					<div class="menus-left col-md-6">
						<div class="menus-left-grid">
							<div class="item">
								<h3>输入订单编号</h3>
								<span>国外编号</span>
							</div>

							<div class="item-price">
								<label></label>
							</div>
							<div class="clearfix"></div>
						</div>

					</div>
					<div class="menus-right col-md-6">
						<div class="menus-left-grid">
							<div class="item">
								<input type="text" name="orderId" value="${orderId }">
							</div>
							<div class="item-line">
								<label><input type="submit" value="查询"></label>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="container">
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
								<td><a href="order?toInnerOrder&nu=${student.nu }"><c:out
											value="${student.nu}" /></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</form>
		<!----- main-menus ----->
	</div>
	<div class="clearfix"></div>
	<!----- menu ---->
	<!----- fearuted-diesh ----->
	<div class="fearuted-diesh">
		<div class="container">
			<h3>
				<span>合作单位 </span>
			</h3>
			<!----sreen-gallery-cursual---->
			<div class="sreen-gallery-cursual">
				<!-- requried-jsfiles-for owl -->
				<link href="jsp/front/css/owl.carousel.css" rel="stylesheet">
				<script src="jsp/front/js/owl.carousel.js"></script>
				<script>
							    $(document).ready(function() {
							      $("#owl-demo").owlCarousel({
							         items :4,
							        lazyLoad : true,
							        autoPlay : true,
							        navigation : false,
							        navigationText :  false,
							        pagination : true,
							      });
							    });
							    </script>
				<!-- //requried-jsfiles-for owl -->
				<!-- start content_slider -->
				<div id="owl-demo" class="owl-carousel">
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d1.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Fugiat nulla sint</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$30</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d2.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Daute irure dolor</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$24</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d3.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Officia deserunt mollit</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$60</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d4.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Pim minim veniam</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$17</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d1.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Fugiat nulla sint</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$30</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d2.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Daute irure dolor</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$24</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d3.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Officia deserunt mollit</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$60</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
					<div class="item">
						<div class="item-grid">
							<div class="item-pic">
								<img src="jsp/front/images/d4.jpg" title="dish-name" />
							</div>
							<div class="item-info">
								<div class="item-info-left">
									<h4>Pim minim veniam</h4>
									<span class="item-rate"> </span>
								</div>
								<div class="item-info-right">
									<label>$17</label>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!----->
				</div>
				<!--//sreen-gallery-cursual---->
			</div>
		</div>
		<!----- fearuted-diesh ----->
		<!----- footer ----->
		<div class="footer">
			<div class="container">
				<div class="footer-grids">
					<div class="col-md-3 footer-grid">
						<p>
							<span>New York Restaurant</span> <span>3926 Anmoore Road</span>
						</p>
					</div>
					<div class="col-md-3 footer-grid">
						<p>
							<span>France Restaurant</span> <span>68, rue de la
								Couronne</span>
						</p>
					</div>
					<div class="col-md-3 footer-grid">
						<ul>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Careers</a></li>
						</ul>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!----- footer ----->
</body>
</html>

