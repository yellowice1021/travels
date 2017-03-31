<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>修改信息</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/users/users.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_third {
			background: url("<%=request.getContextPath() %>/img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body ng-app="travelsApp" ng-controller="messageController">
	<div class="comment_mask" ng-if="messageUser.maskShow" ng-cloak></div>
	<div class="message_container">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=2;headerFlag=2">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--个人资料管理-->
		<div class="comment_container">
			<div class="comment_box my_message_box">
				<div class="message_header">
					<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
					<h4>个人资料</h4>
				</div>
				<div class="message_choose_box">
					<ul class="clearfix">
						<li ng-class="{'active': updateClass.hover==1}" ng-click="updateClass.boxHover(1)" ng-cloak>
							<a href="javascript:void(0);">修改个人资料</a>
						</li>
						<li ng-class="{'active': updateClass.hover==0}" ng-click="updateClass.boxHover(0)" ng-cloak>
							<a href="jacascript:void(0);">修改密码</a>
						</li>
					</ul>
				</div>
				<div class="message_box" ng-class="{'message_hidden': updateClass.hover==0}">
					<form class="clearfix">
						<div class="message_img_box">
							<img src="<%=request.getContextPath() %>/${users.userFace}" />
							<div class="message_img_change"><a href="javascript:void(0);" ng-click="messageUser.openChangeFace()">更换头像</a></div>
						</div>
						<div class="message_data_box">
							<ul>
								<li ng-init="messageUser.username='${users.userName }'">
									<label>用户名：</label>
									<input type="text" ng-model="messageUser.username" />
								</li>
								<li class="clearfix" ng-init="messageUser.sex='${users.userSex }'">
									<label class="float_left">性别：</label>
									<div class="message_sex_box">
										<span class="sex_box">
											<input type="radio"  ng-model="messageUser.sex" value="保密" />
											<span>保密</span>
										</span>
										<span class="sex_box">
											<input type="radio"  ng-model="messageUser.sex" value="男" />
											<span>男</span>
										</span>
										<span class="sex_box">
											<input type="radio" ng-model="messageUser.sex" value="女" />
											<span>女</span>
										</span>
									</div>
								</li>
								<li ng-init="messageUser.province='${users.userProvince }'; messageUser.city='${users.userCity }'" ng-cloak>
									<label>地区：</label>
									<select ng-model="messageUser.province">
										<option value="广东省" ng-selected="'${users.userProvince }'=='广东省'">广东省</option>
										<option value="福建省" ng-selected="'${users.userProvince }'=='福建省'">福建省</option>
										<option value="湖南省" ng-selected="'${users.userProvince }'=='湖南省'">湖南省</option>
										<option value="湖北省" ng-selected="'${users.userProvince }'=='湖北省'">湖北省</option>
									</select>
									<select ng-model="messageUser.city">
										<option value="广州市" ng-selected="'${users.userCity }'=='广州市'">广州市</option>
										<option valye="深圳市" ng-selected="'${users.userCity }'=='深圳市'">深圳市</option>
										<option value="珠海市" ng-selected="'${users.userCity }'=='珠海市'">珠海市</option>
										<option value="惠州市" ng-selected="'${users.userCity }'=='惠州市'">惠州市</option>
									</select>
								</li>
								<li class="clearfix" ng-init="messageUser.introduce='${users.userIntroduce }'">
									<label class="float_left">自我介绍：</label>
									<textarea ng-model="messageUser.introduce"></textarea>
								</li>
							</ul>
							<button ng-click="messageUser.updateSubmit()">保存</button>
						</div>
					</form>
				</div>
				<div class="password_box" ng-class="{'message_hidden': updateClass.hover==1}" ng-cloak>
					<form class="clearfix">
						<div class="password_data_box">
							<ul>
								<li ng-init="passUser.username='${username }'">
									<label>用户名：</label>
									<input type="text" required ng-model="passUser.username" readonly="readonly"/>
								</li>
								<li>
									<label>旧密码：</label>
									<input type="password" required ng-model="passUser.oldPasswords" />
								</li>
								<li>
									<label>新密码：</label>
									<input type="password" required ng-model="passUser.newPasswords" />
								</li>
							</ul>
							<button ng-click="passUser.passSubmit()">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 弹框 -->
		<div class="img_change_box" ng-if="messageUser.maskShow" ng-cloak>
			<div class="bomb_header">
				<h4>更换头像</h4>
				<span ng-click="messageUser.closeChangeFace()">×</span>
			</div>
			<div class="img_change_main">
				<form action="UpdateFaceServlet" method="post" enctype="multipart/form-data">
					<ul>
						<li>
							<p>请选择一张图片：</p>
							<p style="position:relative">
								<input class="img_change_fake" type="text" disabled="disabled" name="fakeInput" />
								<span class="img_change_button">浏览</span>
								<input type="file" name="uploadFile" onchange="fakeInput.value=this.value" class="img_change_file" />
							</p>
						</li>
						<li>
							<button>确定</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/users.js"></script>
</html>