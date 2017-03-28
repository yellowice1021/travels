<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>登录界面</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/users/users.css" type="text/css" />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
</head>
<body style="background-color:white" ng-app="travelsApp" ng-controller="loginController">
	<div class="login_container">
		<!--头部信息-->
		<div class="login_header"></div>
		<!--主要内容-->
		<div class="login_main">
			<div class="login_main_container">
				<!--立即注册-->
				<div class="main_header clearfix">
					<div class="float_right">
						<span>还没注册账号？</span>
						<a class="button" href="register.jsp">立即注册</a>
					</div>
				</div>
				<!--登录框-->
				<div class="main_box">
					<div class="box_header">
						<span>用户登录</span>
					</div>
					<div class="box_main">
						<form name="loginForm" ng-cloak>
							<ul>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>用户名：</span>
									</span>
									<input type="text" name="username" required ng-model="loginUsers.username" />
									<span ng-show="loginForm.username.$error.required&&loginForm.username.$dirty" class="login_info_box">用户名不能为空</span>
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>密码：</span>
									</span>
									<input type="password" name="passwords" required ng-model="loginUsers.passwords"/>
									<span ng-show="loginForm.passwords.$error.required&&loginForm.passwords.$dirty" class="login_info_box">密码不能为空</span>
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>验证码：</span>
									</span>
									<input type="text" name="verifyCode" required ng-model="loginUsers.verifyCode"/>
									<span ng-show="loginForm.verifyCode.$error.required&&loginForm.verifyCode.$dirty" class="login_info_box">验证码不能为空</span>
									<div class="common_verifyImage_box">
										<img ng-src="{{verifyImage.imageUrl}}" alt="验证码" id="register_verify" />
										<a href="javascript:void(0);" ng-click="verifyImage.imageClick()">看不清</a>
									</div>
								</li>
								<li>				
									<button ng-click="loginUsers.loginSubmit()">确认登录</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/users.js"></script>
</html>