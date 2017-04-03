<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发布行程</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/trip/trip.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1YY9z07lbmdpPu5ZZEosE6Wo8PQ7bMNV"></script>
</head>
<body onload="showMapLine(${latitudes[0]}, ${latitudes[1]}, ${latitudes[2]}, ${latitudes[3]})">
	<div class="type_container" ng-app="travelsApp">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=1;headerFlag=1">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--发布行程地图显示-->
		<div class="release_map_container">
			<div id="allmap"></div>
			<div class="release_map_box">
				<form action="ReleaseTypeServlet" method="post" enctype="multipart/form-data">
					<h4>${outCity}->${inCity}：<span id="distance_box"></span>米</h4>
					<ul>
						<li>
							<label>行程标题：</label>
							<input type="text" name="title" />
						</li>
						<li>
							<label>出发地：</label>
							<input type="text" value="${outCity}" readonly="readonly" name="outCity" />
						</li>
						<li>
							<label>目的地：</label>
							<input type="text" value="${inCity}"  readonly="readonly" name="inCity" />
						</li>
						<li class="map_day_box clearfix">
							<label>出游天数：</label>
							<span class="clearfix">
								<a href="#">—</a>
								<input type="text" value="3" name="days"/>
								<a href="#">+</a>
							</span>
						</li>
						<li class="clearfix">
							<label class="float_left">行程介绍：</label>
							<textarea name="introduce"></textarea>
						</li>
						<li class="clearfix">
							<label class="float_left">标题图片：</label>
							<div class="trip_file_box">
								<input type="text" name="fakeInput" class="file_fake" />
								<input type="file" onchange="fakeInput.value=this.value" class="file_choose" name="files" />
								<span class="file_choose_button">浏览</span>
							</div>
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
<script src="<%=request.getContextPath() %>/js/controller/map.js"></script>
</html>