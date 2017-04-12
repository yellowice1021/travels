<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>我的足迹</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/users/users.css" type="text/css"  />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1YY9z07lbmdpPu5ZZEosE6Wo8PQ7bMNV"></script>
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_third {
			background: url("../../img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body onload="getFoot()">
	<div ng-app="travelsApp" ng-controller="footController">
		<div class="comment_mask" ng-if="boxShowHide.ifShow" ng-cloak></div>
		<div class="comment_mask" id="mask"></div>
		<div class="home_container">
			<!--导航栏信息-->
			<div ng-controller="headerController" ng-init="initHeaderFlag=3;headerFlag=3">
				<jsp:include page="../common/header.jsp"></jsp:include>
			</div>
			
			<!--我的足迹-->
			<div class="my_foot_container">
				<div id="allmap"></div>
				<div class="my_foot_title">
					<h4>我的足迹</h4>
				</div>
				<div class="my_foot_box">
					<a href="javascript:void(0);" ng-click="boxShowHide.ifShowClick()">添加足迹</a>
				</div>
				<div class="my_foot_add_box" ng-if="boxShowHide.ifShow" ng-cloak>
					<div class="bomb_header">
						<h4>添加足迹</h4>
						<span ng-click="boxShowHide.ifCloseClick()">×</span>
					</div>
					<div class="foot_add_main">
						<form>
							<ul>
								<li>
									<label>地点：</label>
									<select ng-model="addFoot.province" ng-init="addFoot.province='广东省'">
										<option>广东省</option>
										<option>福建省</option>
										<option>湖南省</option>
										<option>湖北省</option>
										<option>北京</option>
										<option>云南省</option>
										<option>江苏省</option>
									</select>
									<select ng-model="addFoot.city" ng-init="addFoot.city='广州市'">
										<option>广州市</option>
										<option>深圳市</option>
										<option>珠海市</option>
										<option>惠州市</option>
										<option>北京市</option>
										<option>昆明</option>
										<option>南京市</option>
									</select>
								</li>
								<li>
									<label>出发日期：</label>
									<input type="date"  required ng-model="addFoot.dates" />
								</li>
								<li class="foot_add_day_input clearfix">
									<label class="float_left">出游天数：</label>
									<span>
										<a href="#">—</a>
										<input type="text" value="1"  required ng-model="addFoot.days" ng-init="addFoot.days=1" />
										<a href="#">+</a>
									</span>
								</li>
								<li class="clearfix">
									<label class="float_left">相关介绍：</label>
									<textarea required ng-model="addFoot.introduce"></textarea>
								</li>
								<li>
									<button ng-click="addFoot.addFootClick()">确定</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
				<div class="my_foot_add_box" id="my_update_box">
					<div class="bomb_header">
						<h4>修改足迹</h4>
						<span id="foot_update_close">×</span>
					</div>
					<div class="foot_add_main">
						<form>
							<ul>
								<li>
									<label>地点：</label>
									<select id="foot_province" disabled="disabled">
										<option>广东省</option>
										<option>福建省</option>
										<option>湖南省</option>
										<option>湖北省</option>
										<option>北京</option>
										<option>云南省</option>
										<option>江苏省</option>
									</select>
									<select id="foot_city" disabled="disabled">
										<option>广州市</option>
										<option>深圳市</option>
										<option>珠海市</option>
										<option>惠州市</option>
										<option>北京市</option>
										<option>昆明</option>
										<option>南京市</option>
									</select>
								</li>
								<li>
									<label>出发日期：</label>
									<input type="date"  required id="foot_date" />
								</li>
								<li class="foot_add_day_input clearfix">
									<label class="float_left">出游天数：</label>
									<span>
										<a href="#">—</a>
										<input type="text" value="1" required id="foot_day" />
										<a href="#">+</a>
									</span>
								</li>
								<li class="clearfix">
									<label class="float_left">相关介绍：</label>
									<textarea id="foot_introduce"></textarea>
								</li>
								<li>
									<button id="foot_update">确定修改</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			
			
			<!--底部导航栏-->
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/users.js"></script>
<script src="<%=request.getContextPath() %>/js/lib/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/map.js"></script>
</html>