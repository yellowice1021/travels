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
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_third {
			background: url("../../img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body onload="getFoot()">
	<div ng-app="travelsApp" ng-controller="footController">
		<div class="comment_mask" ng-if="boxShowHide.ifShow" ng-cloak></div>
		<div class="comment_mask" id="mask"></div>
		<div class="home_container">
			<!--导航栏信息-->
			<div ng-controller="headerController" ng-init="initHeaderFlag=3;headerFlag=3">
				<jsp:include page="../common/header.jsp"></jsp:include>
			</div>
			
			<!--我的足迹-->
			<div class="my_foot_container">
				<div id="allmap"></div>
				<div class="my_foot_title">
					<h4>我的足迹</h4>
				</div>
				<div class="my_foot_box">
					<a href="javascript:void(0);" ng-click="boxShowHide.ifShowClick()">添加足迹</a>
				</div>
				<div class="my_foot_add_box" ng-if="boxShowHide.ifShow" ng-cloak>
					<div class="bomb_header">
						<h4>添加足迹</h4>
						<span ng-click="boxShowHide.ifCloseClick()">×</span>
					</div>
					<div class="foot_add_main">
						<form>
							<ul>
								<li>
									<label>地点：</label>
									<select ng-model="addFoot.province" ng-init="addFoot.province='北京_0'" ng-change="addFoot.provinceChange(this)">
										<option value= "北京_0" >北京</option> 
										<option value= "上海_1" >上海</option> 
										<option value= "天津_2" >天津</option> 
										<option value= "重庆_3" >重庆</option> 
										<option value= "河北_4" >河北</option> 
										<option value= "山西_5" >山西</option> 
										<option value= "内蒙古_6" >内蒙古</option> 
										<option value= "辽宁_7" >辽宁</option> 
										<option value= "吉林_8" >吉林</option> 
										<option value= "黑龙江_9" >黑龙江</option> 
										<option value= "江苏_10" >江苏</option> 
										<option value= "浙江_11" >浙江</option> 
										<option value= "安微_12" >安徽</option> 
										<option value= "福建_13" >福建</option> 
										<option value= "江西_14" >江西</option> 
										<option value= "山东_15" >山东</option> 
										<option value= "河南_16" >河南</option> 
										<option value= "湖北_17" >湖北</option> 
										<option value= "湖南_18" >湖南</option> 
										<option value= "广东_19" >广东</option> 
										<option value= "广西_20" >广西</option> 
										<option value= "海南_21" >海南</option> 
										<option value= "四川_22" >四川</option> 
										<option value= "贵州_23" >贵州</option> 
										<option value= "云南_24" >云南</option> 
										<option value= "西藏_25" >西藏</option> 
										<option value= "陕西_26" >陕西</option> 
										<option value= "甘肃_27" >甘肃</option> 
										<option value= "宁夏_28" >宁夏</option> 
										<option value= "青海_29" >青海</option> 
										<option value= "新疆_30" >新疆</option> 
										<option value= "香港_31" >香港</option> 
										<option value= "澳门_32" >澳门</option> 
										<option value= "台湾_33" >台湾</option>
									</select>
									<select ng-model="addFoot.city" ng-init="addFoot.city='北京'">
										<option ng-repeat="x in addFoot.cityList">{{x}}</option>
									</select>
								</li>
								<li>
									<label>出发日期：</label>
									<input type="date"  required ng-model="addFoot.dates" />
								</li>
								<li class="foot_add_day_input clearfix">
									<label class="float_left">出游天数：</label>
									<span>
										<a href="javascript:void(0);" ng-click="addFoot.deleteDayClick()">—</a>
										<input type="text" value="1"  required ng-model="addFoot.days" ng-init="addFoot.days=1" />
										<a href="javascript:void(0);" ng-click="addFoot.addDayClick()">+</a>
									</span>
								</li>
								<li class="clearfix">
									<label class="float_left">相关介绍：</label>
									<textarea required ng-model="addFoot.introduce"></textarea>
								</li>
								<li>
									<button ng-click="addFoot.addFootClick()">确定</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
				<div class="my_foot_add_box" id="my_update_box">
					<div class="bomb_header">
						<h4>修改足迹</h4>
						<span id="foot_update_close">×</span>
					</div>
					<div class="foot_add_main">
						<form>
							<ul>
								<li>
									<label>地点：</label>
									<input id="foot_province" readonly="readonly"></input>
									<input id="foot_city" readonly="readonly"></input>
								</li>
								<li>
									<label>出发日期：</label>
									<input type="date"  required id="foot_date" />
								</li>
								<li class="foot_add_day_input clearfix">
									<label class="float_left">出游天数：</label>
									<span>
										<a href="#" class="delete_day_button">—</a>
										<input type="text" value="1" required id="foot_day" />
										<a href="#" class="add_day_button">+</a>
									</span>
								</li>
								<li class="clearfix">
									<label class="float_left">相关介绍：</label>
									<textarea id="foot_introduce" required></textarea>
								</li>
								<li>
									<button id="foot_update">确定修改</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
				<div id="my_delete_box">
					<div class="bomb_header">
						<h4>删除足迹</h4>
						<span id="foot_delete_close">×</span>
					</div>
					<div class="delete_main">
						<div class="delete_main_text">
							<h4>是否确定删除该足迹？</h4>
						</div>
						<div class="delete_main_button clearfix">
							<button id="delete_sure_button">确定</button>
							<button id="delete_no_button">取消</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<!--底部导航栏-->
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/users.js"></script>
<script src="<%=request.getContextPath() %>/js/lib/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/map.js"></script>
</html>