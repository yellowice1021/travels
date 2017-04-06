<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>个人中心</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/users/users.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_third {
			background: url("<%=request.getContextPath() %>/img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="personal_container" ng-app="travelsApp">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=3;headerFlag=3">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--个人信息管理-->
		<div class="comment_container">
			<div class="comment_box personal_box">
				<div class="personal_header clearfix">
					<div class="personal_img_box">
						<img src="<%=request.getContextPath() %>/${users.userFace}" />
					</div>
					<div class="personal_message">
						<div class="personal_name clearfix">
							<h4>${users.userName}</h4>
							<a href="#">编辑个人资料</a>
						</div>
						<div class="personal_number clearfix">
							<div class="personal_number_box">
								<a href="#">
									<h4>0</h4>
									<span>我的行程</span>
								</a>
							</div>
							<div class="personal_number_box" style="border: none;">
								<a href="#">
									<h4>0</h4>
									<span>我的收藏</span>
								</a>
							</div>
						</div>
						<div class="personal_detail">
							<p>
								<span class="title_text">所在地区：</span>
								<span>${users.userProvince}-${users.userCity}</span>
							</p>
							<p>
								<span class="title_text">自我介绍：</span>
								<span>${users.userIntroduce}</span>
							</p>
						</div>
					</div>
				</div>
				<div class="personal_main">
					<div class="personal_main_box">
						<div class="personal_main_header">
							<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
							<h4 style="font-size:20px;">我的行程(4)</h4>
							<a href="#">查看全部</a>
						</div>
						<ul class="clearfix">
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="personal_main_box">
						<div class="personal_main_header">
							<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
							<h4 style="font-size:20px;">我的收藏(4)</h4>
							<a href="#">查看全部</a>
						</div>
						<ul class="clearfix">
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
							<li>
								<a href="#">
									<img src="../../images/search/beijing.jpg"  />
								</a>
								<div class="personal_main_text">
									<h4><a href="#">北京1日游</a></h4>
									<p>目的地：北京</p>
									<p>行程天数：1天</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</html>