<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发布行程</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/trip/trip.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_second {
			background: url("../../img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="place_container" ng-app="travelsApp" ng-controller="tripCityController">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=2;headerFlag=2">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--发布地点主要内容-->
		<div class="release_place_container">
			<div class="release_place_box">
				<div class="release_place_header">
					<h1>路越远，心越近</h1>
					<p><span>无论是爱情还是青春，其实都在旅行的路上</span></p>
				</div>
				<div class="release_place_main">
					<form action="../../ReleasePlaceServlet" method="post">
						<div class="place_input_box">
							<div class="place_input clearfix">
								<span>出发地：</span>
								<select name="outProvince">
									<option value="北京">北京</option>
									<option value="广东">广东</option>
									<option value="福建">福建</option>
									<option value="湖南">湖南</option>
									<option value="湖北">湖北</option>
									<option value="云南">云南</option>
									<option value="江苏">江苏</option>
								</select>
								<select name="outCity">
									<option value="北京">北京</option>
									<option value="广州">广州</option>
									<option value="深圳">深圳</option>
									<option value="珠海">珠海</option>
									<option value="清远">清远</option>
									<option value="昆明">昆明</option>
									<option value="南京">南京</option>
								</select>
							</div>
							<div class="place_input clearfix">
								<span>目的地：</span>
								<select name="inProvince">
									<option value="北京">北京</option>
									<option value="广东">广东</option>
									<option value="福建">福建</option>
									<option value="湖南">湖南</option>
									<option value="湖北">湖北</option>
									<option value="云南">云南</option>
									<option value="江苏">江苏</option>
								</select>
								<select name="inCity">
									<option value="北京">北京</option>
									<option value="广州">广州</option>
									<option value="深圳">深圳</option>
									<option value="珠海">珠海</option>
									<option value="清远">清远</option>
									<option value="昆明">昆明</option>
									<option value="南京">南京</option>
								</select>
							</div>
						</div>
						<button ng-click="cityChoose.cityClick()">下一步</button>
					</form>
				</div>
			</div>
		</div>
				
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/trip.js"></script>
</script>
</html>