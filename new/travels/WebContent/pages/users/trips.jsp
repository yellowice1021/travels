<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>我的行程界面</title>
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
	<div class="trips_container" ng-app="travelsApp" ng-controller="deleteTripController">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=3;headerFlag=3">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--我的行程-->
		<div class="comment_container">
			<div class="comment_box my_trip_box">
				<div class="trip_box_header">
					<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
					<h4>我的行程</h4>
				</div>
				<div class="trip_box_main">
					<c:if var="result" test="${empty tripMessages}">
						<div class="common_empty clearfix">
							<i style="background:url('<%=request.getContextPath() %>/img/empty.JPG') no-repeat -40px 0;background-size:250px 180px;"></i>
							<h4>暂无行程</h4>
						</div>
					</c:if>
					<ul class="clearfix">
						<c:forEach var="message" items="${tripMessages}">
							<li>
								<a href="<%=request.getContextPath() %>/SearchDetailServlet?id=${message.id}">
									<img src="<%=request.getContextPath() %>/${message.picture}" />
								</a>
								<div class="trips_box_text">
									<h4><a href="<%=request.getContextPath() %>/SearchDetailServlet?id=${message.id}">${message.title}</a></h4>
									<p>目的地：${message.inCity}</p>
									<p>
										<span>行程天数：${message.days}天</span>
										<span class="my_trip_delete" ng-click="trip.deleteTripClick(${message.id})">删除行程</span>
										<span class="my_trip_delete" ng-click="trip.updateTripClick(${message.id})">修改行程</span>		
									</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="comment_page_box">
					<a href="#">上一页</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">下一页</a>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/users.js"></script>
</html>