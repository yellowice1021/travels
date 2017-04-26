<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>成功页面</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_second {
			background: url("<%=request.getContextPath() %>/img/header.png") no-repeat 0 -155px;
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
				<c:choose>
					<c:when test="${operator == 'update'}">
						<div class="result_title_box">
							<div class="result_title_text clearfix">
								<i style="background: url('<%=request.getContextPath() %>/img/success.png') no-repeat;background-size: 50px 40px"></i>
								<h4>修改成功</h4>
							</div>
							<div class="result_title_choose">
								<a href="<%=request.getContextPath() %>/UpdateTripServlet?planId=${planId}">查看行程</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="result_title_box clearfix">
							<div class="result_title_text clearfix">
								<i style="background: url('<%=request.getContextPath() %>/img/success.png') no-repeat;background-size: 50px 40px"></i>
								<h4>添加成功</h4>
							</div>
							<div class="result_title_choose">
								<a href="<%=request.getContextPath() %>/SearchDetailServlet?id=${planId}">查看行程</a>
								<a href="<%=request.getContextPath() %>/pages/trip/place.jsp">继续添加</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</html>