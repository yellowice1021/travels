<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>成功页面</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_second {
			background: url("../../img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="success_container" ng-app="travelsApp">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=1;headerFlag=1">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		
		<!--主要内容-->
		<div class="comment_container">
			<div class="comment_box result_box">
				<div class="result_title_box clearfix">
					<i style="background: url('<%=request.getContextPath() %>/img/success.png') no-repeat;background-size: 50px 40px"></i>
					<h4>添加成功</h4>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</html>