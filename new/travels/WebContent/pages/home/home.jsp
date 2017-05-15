<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>主界面</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/home/home.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_zero {
			background: url("../../img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="home_container" ng-app="travelsApp" ng-controller="homeController">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=0;headerFlag=0">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--轮播图-->
		<div class="home_banner_container">
			<div class="home_banner_box" ng-style="banner.bannerBackground" ng-mouseenter="banner.stopBanner()" ng-mouseleave="banner.beginBanner()">
				<div class="home_banner_choose">
					<div class="home_banner_button clearfix">
						<span ng-class="{'home_banner_on':banner.index==1}" ng-click="banner.indexClick(1)"></span>
						<span ng-class="{'home_banner_on':banner.index==2}" ng-click="banner.indexClick(2)"></span>
						<span ng-class="{'home_banner_on':banner.index==3}" ng-click="banner.indexClick(3)"></span>
						<span ng-class="{'home_banner_on':banner.index==4}" ng-click="banner.indexClick(4)"></span>
					</div>
					<a href="javascript:void(0);" class="home_banner_change change_left" ng-click="banner.prevClick()">&lt;</a>
					<a href="javascript:void(0);" class="home_banner_change change_right" ng-click="banner.nextClick()">&gt;</a>
				</div>
			</div>
		</div>
		
		<!--主要内容-->
		<div class="comment_container">
			<!--热门推荐-->
			<div class="comment_box home_box">
				<div class="main_hot_header">
					<i></i>
					<span>热门推荐</span>
				</div>
				<div class="main_hot_box">
					<ul class="clearfix">
						<li class="main_hot_first">
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=北京&day=0">
								<img src="../../images/home/hot/1.jpg" />
							</a>
							<div class="main_hot_place">
								<span>北京</span>
							</div>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=上海&day=0">
								<img src="../../images/home/hot/2.jpg" />
							</a>
							<div class="main_hot_place">
								<span>上海</span>
							</div>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=云南&day=0">
								<img src="../../images/home/hot/3.jpg" />
							</a>
							<div class="main_hot_place">
								<span>云南</span>
							</div>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=广州&day=0">
								<img src="../../images/home/hot/4.jpg" />
							</a>
							<div class="main_hot_place">
								<span>广州</span>
							</div>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=南京&day=0">
								<img src="../../images/home/hot/5.jpg" />
							</a>
							<div class="main_hot_place">
								<span>南京</span>
							</div>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=杭州&day=0">
								<img src="../../images/home/hot/6.jpg" />
							</a>
							<div class="main_hot_place">
								<span>杭州</span>
							</div>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/SearchTripServlet?place=哈尔滨&day=0">
								<img src="../../images/home/hot/7.jpg" />
							</a>
							<div class="main_hot_place">
								<span>哈尔滨</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</html>