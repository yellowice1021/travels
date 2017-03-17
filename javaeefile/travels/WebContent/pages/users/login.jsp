<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>登录界面</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/users/users.css" type="text/css" />
</head>
<body style="background-color:white">
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
						<span class="button">立即注册</span>
					</div>
				</div>
				<!--登录框-->
				<div class="main_box">
					<div class="box_header">
						<span>用户登录</span>
					</div>
					<div class="box_main">
						<form>
							<ul>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>用户名：</span>
									</span>
									<input type="text" name="username" />
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>密码：</span>
									</span>
									<input type="password" name="password" />
								</li>
								<li>
									<span class="name_text">
										<i>*</i>
										<span>验证码：</span>
									</span>
									<input type="text" name="sure" />
								</li>
								<li>				
									<button>确认登录</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>