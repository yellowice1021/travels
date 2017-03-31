/*
 * 显示两个城市的距离
 */
function showMapLine(inCityLng, inCityLat, outCityLng, outCityLat) {		
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom("兰州",5);  //初始化地图,设置城市和地图级别。
	var pointA = new BMap.Point(inCityLng, inCityLat);  
	var pointB = new BMap.Point(outCityLng, outCityLat);  
	var polyline = new BMap.Polyline([pointA,pointB], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
	map.addOverlay(polyline);     //添加折线到地图上
	
	var marker = new BMap.Marker(pointA);// 创建标注
	map.addOverlay(marker);             // 将标注添加到地图中
	marker.disableDragging();           // 不可拖拽
	var marker = new BMap.Marker(pointB);// 创建标注
	map.addOverlay(marker);             // 将标注添加到地图中
	marker.disableDragging();           // 不可拖拽
	
	var distance = parseInt(map.getDistance(pointA,pointB));
	var distanceBox = document.getElementById("distance_box").innerHTML = distance;
	
	map.enableScrollWheelZoom(true);
}