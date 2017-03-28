<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发布行程</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/trip/trip.css" type="text/css"  />
</head>
<body>
	<div class="place_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--发布地点主要内容-->
		<div class="release_place_container">
			<div class="release_place_box">
				<div class="release_place_header">
					<h1>路越远，心越近</h1>
					<p><span>无论是爱情还是青春，其实都在旅行的路上</span></p>
				</div>
				<div class="release_place_main">
					<form>
						<div class="place_input_box">
							<div class="place_input clearfix">
								<span>出发地：</span>
								<select>
									<option>广东</option>
									<option>福建</option>
									<option>湖南</option>
									<option>湖北</option>
								</select>
								<select>
									<option>广州</option>
									<option>深圳</option>
									<option>珠海</option>
									<option>清远</option>
								</select>
							</div>
							<div class="place_input clearfix">
								<span>目的地：</span>
								<select>
									<option>广东</option>
									<option>福建</option>
									<option>湖南</option>
									<option>湖北</option>
								</select>
								<select>
									<option>广州</option>
									<option>深圳</option>
									<option>珠海</option>
									<option>清远</option>
								</select>
							</div>
						</div>
						<button>下一步</button>
					</form>
				</div>
			</div>
		</div>
				
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>