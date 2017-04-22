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
	var distanceBox = document.getElementById("distance_box").innerHTML = (distance/1000).toFixed(2);
	
	map.enableScrollWheelZoom(true);
}

/*
 * 显示足迹
 */
function getFoot() {
	
	$.get("../../GetFootServlet",function(data,status){
		if(status == "success") {
			
			var points = JSON.parse(data);
			addMarker(points);
			
		}
	});
	
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(105.404, 36.915);
	map.centerAndZoom(point, 5);
	map.enableScrollWheelZoom(true);
	
	//创建标注点并添加到地图中
	function addMarker(points) {
	    //循环建立标注点
	    for(var i = 0, pointsLen = points.length; i < pointsLen; i++) {
	        var point = new BMap.Point(points[i].longitude, points[i].latitude); 	//将标注点转化成地图上的点
	        var marker = new BMap.Marker(point); 									//将点转化成标注点
	        map.addOverlay(marker);  												//将标注点添加到地图上
	        marker.setAnimation(BMAP_ANIMATION_BOUNCE); 							//跳动的动画
	        //添加监听事件
	        (function() {
	            var thePoint = points[i];
	            marker.addEventListener("click",
	                function() {
	                showInfo(this,thePoint);
	            });
	         })();  
	    }
	}
	
	function showInfo(thisMarker,point) {
		
	    //获取点的信息
	    var sContent = '<ul class="point_message_box"><li><span>地点:</span>' + point.province + '-' + point.city + '</li><li><span>出发日期:</span>' 
	    + point.date + '</li><li><span>天数:</span>' + point.day + '</li><li><span>操作:</span>' 
	    + '<a href="javascript:void(0);" onclick="pointDeatil(\''+ point.province +'\',\''+ point.city + '\',\'' + point.date + '\',\'' + point.day + '\',\'' + point.introduce + '\',\'' + point.id + '\')">'
	    + '查看详情</a><a href="javascript:void(0); onclick=pointDelete(\''+ point.id + '\')">删除足迹</a></li></ul>'
	    var infoWindow = new BMap.InfoWindow(sContent); 		//创建信息窗口对象
	    thisMarker.openInfoWindow(infoWindow); 					//图片加载完后重绘infoWindow
	}
	
}

// 查看详情
function pointDeatil(province, city, date, day, introduce, id) {
	
	// 显示相关信息
	$("#my_update_box").show();
	$("#mask").show();
	$("#foot_province").val(province);
	$("#foot_city").val(city);
	$("#foot_date").val(date);
	$("#foot_day").val(day);
	$("#foot_introduce").val(introduce);
	
	// 关闭窗口
	$("#foot_update_close").click(function() {
		$("#my_update_box").hide();
		$("#mask").hide();
	});
	
	// 修改信息
	$("#foot_update").click(function() {
		
		var updateDates = $("#foot_date").val();
		var updateDay = $("#foot_day").val();
		var updateIntroduce = $("#foot_introduce").val();
		
		$.post("../../UpdateFootServlet",
		{
	    	id: id,
	    	dates: updateDates,
	    	days: updateDay,
	    	introduce: updateIntroduce
		},
		function(data,status){
			if(status == "success") {
				switch(data) {
					case 'updateError':
						alert("修改失败，请重试");
						break;
					case 'success':
						alert("修改成功");
						location.reload();
						break;
					default:
						break;
				}
			} else {
				alert("修改失败，请重试");
			}
		});
	});
	
	$(".delete_day_button").click(function() {
		var dayNumber = $("#foot_day").val();
		if(dayNumber == 1) {
			return;
		} else {
			dayNumber--;
			$("#foot_day").val(dayNumber);
		}
	});
	
	$(".add_day_button").click(function() {
		var dayNumber = $("#foot_day").val();
		dayNumber++;
		$("#foot_day").val(dayNumber);
	});
}

// 删除足迹
function pointDelete(id) {
	
	$("#mask,#my_delete_box").show();
	
	// 关闭窗口
	$("#foot_delete_close,#delete_no_button").click(function() {
		$("#my_delete_box,#mask").hide();
	});
	
	// 确定删除
	$("#delete_sure_button").click(function() {
		$.post("../../DeleteFootServlet",
		{
	    	id: id
		},
		function(data,status){
			if(status == "success") {
				switch(data) {
					case 'deleteError':
						alert("删除失败，请重试");
						break;
					case 'success':
						alert("删除成功");
						location.reload();
						break;
					default:
						break;
				}
			} else {
				alert("删除失败，请重试");
			}
		});
	});
	
}
