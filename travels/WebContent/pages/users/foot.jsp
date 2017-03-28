<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>我的足迹</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/users/users.css" type="text/css"  />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1YY9z07lbmdpPu5ZZEosE6Wo8PQ7bMNV"></script>
</head>
<body>
	<div class="comment_mask"></div>
	<div class="home_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--我的足迹-->
		<div class="my_foot_container">
			<div id="allmap"></div>
			<div class="my_foot_title">
				<h4>我的足迹</h4>
			</div>
			<div class="my_foot_box">
				<a href="#">添加足迹</a>
			</div>
			<div class="my_foot_add_box">
				<div class="bomb_header">
					<h4>添加足迹</h4>
					<span>×</span>
				</div>
				<div class="foot_add_main">
					<form>
						<ul>
							<li>
								<label>地点：</label>
								<select>
									<option>广东省</option>
									<option>福建省</option>
									<option>湖南省</option>
									<option>湖北省</option>
								</select>
								<select>
									<option>广州市</option>
									<option>深圳市</option>
									<option>珠海市</option>
									<option>惠州市</option>
								</select>
							</li>
							<li>
								<label>出发日期：</label>
								<input type="date"  />
							</li>
							<li class="foot_add_day_input clearfix">
								<label class="float_left">出游天数：</label>
								<span>
									<a href="#">—</a>
									<input type="text" value="1"  />
									<a href="#">+</a>
								</span>
							</li>
							<li class="clearfix">
								<label class="float_left">相关介绍：</label>
								<textarea></textarea>
							</li>
							<li>
								<button>确定</button>
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(105.404, 36.915);
	map.centerAndZoom(point, 5);
	
	var point = new BMap.Point(113.404, 23.915);
	var marker = new BMap.Marker(point);  		// 创建标注
	map.addOverlay(marker);               		// 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	var point = new BMap.Point(113.404, 29.915);
	var marker = new BMap.Marker(point);  		// 创建标注
	map.addOverlay(marker);               		// 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	var point = new BMap.Point(113.404, 33.915);
	var marker = new BMap.Marker(point);  		// 创建标注
	map.addOverlay(marker);               		// 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	map.enableScrollWheelZoom(true);
</script>
</html>