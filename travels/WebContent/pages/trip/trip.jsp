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
	<div class="trip_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--发布行程-->
		<div class="comment_container">
			<div class="comment_box trip_plan_box">
				<div class="plan_box">
					<div class="header clearfix">
						<i style="background:url('../../img/icon.png') no-repeat 0 -100px"></i>
						<h4>行程安排</h4>
					</div>
					
					<div class="day_box">
						<form>
							<ul>
								<li>
									<div class="day_text clearfix">
										<h4>第一天</h4>
										<div class="day_place">
											<span>请写下您第一天的行程安排</span>
										</div>
									</div>
									<div class="day_arrange">
										<ul>
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('../../img/icon.png') no-repeat -248px -248px;background-color:white"></i>
													<h4>推荐行程</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>		
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('../../img/icon.png') no-repeat -346px -248px;background-color:white"></i>
													<h4>推荐美食</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>	
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('../../img/icon.png') no-repeat -298px -248px;background-color:white"></i>
													<h4>推荐住宿</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>	
										</ul>
									</div>
								</li>
								<li>
									<div class="day_text clearfix">
										<h4>第一天</h4>
										<div class="day_place">
											<span>请写下您第一天的行程安排</span>
										</div>
									</div>
									<div class="day_arrange">
										<ul>
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('../../img/icon.png') no-repeat -248px -248px;background-color:white"></i>
													<h4>推荐行程</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>		
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('../../img/icon.png') no-repeat -346px -248px;background-color:white"></i>
													<h4>推荐美食</h4>
												</div>
												<div class="arrange_input">
													<textarea></textarea>
												</div>
											</li>	
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('../../img/icon.png') no-repeat -298px -248px;background-color:white"></i>
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
</html>