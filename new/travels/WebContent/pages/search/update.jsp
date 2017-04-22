<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>行程修改</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/trip/trip.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_third {
			background: url("<%=request.getContextPath() %>/img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="updatetrip_container" ng-app="travelsApp" ng-controller="homeController">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=3;headerFlag=3">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--发布行程-->
		<div class="comment_container">
			<div class="comment_box trip_plan_box">
			
				<div class="trip_message_box clearfix">
					<img src="<%=request.getContextPath() %>/${tripMessage.picture }"  />
					<div class="detail_intoduce">
						<div class="detail_person clearfix">
							<h4>${tripMessage.title }</h4>
							<span>${tripMessage.date }发布</span>
						</div>
						<div class="detail_text">
							<p>
								<span class="detail_title_box">
									<span class="detail_title">行程出发地：</span>
									<span>${tripMessage.outCity }</span>
								</span>
								<span class="detail_title_box">
									<span class="detail_title">行程目的地：</span>
									<span>${tripMessage.inCity }</span>
								</span>
							</p>
							<p>
								<span class="detail_title">行程天数：</span>
								<span>${tripMessage.days }天</span>
							</p>
							<p>
								<span class="detail_title">行程介绍：</span>
								<span>${tripMessage.introduce }</span>
							</p>
						</div>
					</div>
				</div>
			
			
				<div class="plan_box">
					<div class="header clearfix">
						<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
						<h4>行程修改</h4>
					</div>
					
					<div class="day_box">
						<form>
							<ul>
								<li>
									<div class="day_text clearfix">
										<h4>第一天</h4>
										<div class="day_place">
											<span>请修改您第一天的行程安排</span>
										</div>
									</div>
									<div class="day_arrange">
										<ul>
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat -248px -248px;background-color:white"></i>
													<h4>推荐行程</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>		
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat -346px -248px;background-color:white"></i>
													<h4>推荐美食</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>	
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat -298px -248px;background-color:white"></i>
													<h4>推荐住宿</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>	
										</ul>
									</div>
								</li>
							</ul>
							<div class="plan_button_box">
								<button>确定</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</html>