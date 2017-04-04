<%@page import="sun.invoke.empty.Empty"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>查询界面</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search/search.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_first {
			background: url("<%=request.getContextPath() %>/img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="searchtrip_container" ng-app="travelsApp">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=0;headerFlag=0">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--搜索结果-->
		<div class="comment_container">
			<div class="comment_box search_box">
				<!--  
					<div class="search_introduce clearfix">
						<h4>北京</h4>
						<img src="../../images/search/beijing.jpg"  />
						<div class="search_introduce_box">
							<p>
								<span class="introduce_title">相关介绍：</span>
								<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
							</p>
							<p>
								<span class="introduce_title">最佳季节：</span>
								<span>3-5月、9-10月</span>
							</p>
							<p>
								<span class="introduce_title">建议游玩：</span>
								<span>3-5天</span>
							</p>
							<p>
								<span class="introduce_title">推荐景点：</span>
								<span>北京天安门、万里长城</span>
							</p>
						</div>
					</div>
				-->
				<div class="search_header">
					<div class="search_select clearfix">
						<span>目的地：</span>
						<ul>
							<c:choose>
								<c:when test="${place == '全部'}">
									<li>
										<a href="<%=request.getContextPath() %>/SearchTripServlet?place=全部&day=${day}" class="active">全部</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="<%=request.getContextPath() %>/SearchTripServlet?place=全部&day=${day}">全部</a>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="city" items="${citys}">
								<c:choose>
									<c:when test="${place == city}">
										<li>
											<a href="<%=request.getContextPath() %>/SearchTripServlet?place=${city}&day=${day}" class="active">${city}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<%=request.getContextPath() %>/SearchTripServlet?place=${city}&day=${day}">${city}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
					<div class="search_select clearfix">
						<span>天数：</span>
						<ul>
							<c:choose>
								<c:when test="${day == 0}">
									<li>
										<a href="<%=request.getContextPath() %>/SearchTripServlet?place=${place}&day=0" class="active">全部</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="<%=request.getContextPath() %>/SearchTripServlet?place=${place}&day=0">全部</a>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="1" end="10" step="1">   
								<c:choose>
									<c:when test="${i == day}">
										<li>
											<a href="<%=request.getContextPath() %>/SearchTripServlet?place=${place}&day=${i}" class="active">${i}天</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="<%=request.getContextPath() %>/SearchTripServlet?place=${place}&day=${i}">${i}天</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="search_main_box">
					<c:if var="result" test="${empty tripMessage}">
						<div class="search_empty clearfix">
							<i style="background:url('<%=request.getContextPath() %>/img/empty.JPG') no-repeat -40px 0;background-size:250px 180px"></i>
							<h4>暂无结果</h4>
						</div>
					</c:if>
					<ul class="clearfix">
						<c:forEach var="message" items="${tripMessage}">
							<li>
								<a href="#">
									<img src="<%=request.getContextPath() %>/${message.picture}" />
								</a>
								<div class="search_text">
									<h4><a href="#">${message.title}</a></h4>
									<p>目的地：${message.inCity}</p>
									<p>行程天数：${message.days}天</p>
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
</html>