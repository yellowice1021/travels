<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>注册界面</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/users/users.css" type="text/css" />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
</head>
<body style="background-color:white" ng-app="travelsApp" ng-controller="registerController">
	<div class="register_container">
		<!--头部信息-->
		<div class="register_header"></div>
		<!--主要内容-->
		<div class="register_main">
			<div class="register_main_container">
				<!--立即登录-->
				<div class="main_header clearfix">
					<div class="float_right">
						<span>已有账号了？</span>
						<span class="button">立即登录</span>
					</div>
				</div>
				<!--注册框-->
				<div class="main_box">
					<div class="box_header">
						<span>用户注册</span>
					</div>
					<div class="box_main">
						<form name="registerForm" ng-cloak>
							<ul>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>用户名：</span>
									</span>
									<input type="text" name="username" required ng-maxlength="10" ng-model="person.username"/>
									<span ng-show="registerForm.username.$error.required&&registerForm.username.$dirty" class="info_box">用户名不能为空</span>
									<span ng-show="registerForm.username.$error.maxlength" class="info_box">用户名长度不能大于10字符</span>
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>设置密码：</span>
									</span>
									<input type="password" name="passwords" required ng-model="person.passwords"/>
									<span ng-show="registerForm.passwords.$error.required&&registerForm.passwords.$dirty" class="info_box">密码不能为空</span>
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>确认密码：</span>
									</span>
									<input type="password" name="surePasswords" required ng-model="person.surePasswords"/>
									<span ng-show="registerForm.surePasswords.$error.required&&registerForm.surePasswords.$dirty" class="info_box">请再次输入密码</span>
									<span ng-show="person.passwords!=person.surePasswords&&registerForm.surePasswords.$dirty&&!registerForm.surePasswords.$error.required" class="info_box">两次密码输入不一致，请重新输入</span>
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>验证码：</span>
									</span>
									<input type="text" name="verifyCode" required ng-model="person.verifyCode"/>
									<span ng-show="registerForm.verifyCode.$error.required&&registerForm.verifyCode.$dirty" class="info_box">验证码不能为空</span>
									<div class="register_verifyImage_box">
										<img ng-src="{{verifyImage.imageUrl}}" alt="验证码" id="register_verify" />
										<a href="javascript:void(0);" ng-click="verifyImage.imageClick()">看不清</a>
									</div>
								</li>
								<li>				
									<button ng-click="person.registerSubmit()">确认注册</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/controller/users.js"></script>
</html>