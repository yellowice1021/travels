<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发布行程</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/trip/trip.css" type="text/css"  />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1YY9z07lbmdpPu5ZZEosE6Wo8PQ7bMNV"></script>
</head>
<body>
	<div class="type_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--发布行程地图显示-->
		<div class="release_map_container">
			<div id="allmap"></div>
			<div class="release_map_box">
				<from>
					<h4>广州->北京：140000米</h4>
					<ul>
						<li>
							<label>出发地：</label>
							<input type="text" placeholder="广州市"  readonly="readonly"/>
						</li>
						<li>
							<label>目的地：</label>
							<input type="text" placeholder="北京市"  readonly="readonly"/>
						</li>
						<li class="map_day_box clearfix">
							<label>出游天数：</label>
							<span class="clearfix">
								<a href="#">—</a>
								<input type="text"  value="1"/>
								<a href="#">+</a>
							</span>
						</li>
						<li>
							<button>确定</button>
						</li>
					</ul>
				</from>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script>
		// 百度地图API功能
		var map = new BMap.Map("allmap");
		map.centerAndZoom("兰州",5);  //初始化地图,设置城市和地图级别。
		var pointA = new BMap.Point(113.3000,23.2000);  
		var pointB = new BMap.Point(116.2317,39.5427);  
		var polyline = new BMap.Polyline([pointA,pointB], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
		map.addOverlay(polyline);     //添加折线到地图上
		
		var marker = new BMap.Marker(pointA);// 创建标注
		map.addOverlay(marker);             // 将标注添加到地图中
		marker.disableDragging();           // 不可拖拽
		var marker = new BMap.Marker(pointB);// 创建标注
		map.addOverlay(marker);             // 将标注添加到地图中
		marker.disableDragging();           // 不可拖拽
		
		map.enableScrollWheelZoom(true)

	</script>
</html>