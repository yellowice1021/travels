<%@ page pageEncoding="utf-8" %>
<div class="common_header">
	<div class="header_box clearfix">
		<div class="header_logo float_left"></div>
		<ul class="header_navigation float_left">
			<li class="active_first" ng-mouseover="headerMouseover(0)" ng-mouseleave="headerMouseleave()">
				<span>行程规划</span>
				<span class="hot"></span>
				<span class="cor" ng-if="headerFlag==0" ng-cloak></span>
				<ul class="header_another_navigation clearfix" ng-if="headerFlag==0" ng-cloak>
					<li>
						<a href="#">
							<span>全部</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>北京</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>上海</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>云南</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>桂林</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="active_second" ng-mouseover="headerMouseover(1)" ng-mouseleave="headerMouseleave()">
				<span>发布行程</span>
				<span class="cor" ng-if="headerFlag==1" ng-cloak></span>
				<ul class="header_another_navigation clearfix" style="left:-15px;" ng-if="headerFlag==1" ng-cloak>
					<li style="width: 120px;">
						<a href="<%=request.getContextPath() %>/pages/trip/place.jsp">
							<span>发布行程规划</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="active_third" ng-mouseover="headerMouseover(2)" ng-mouseleave="headerMouseleave()">
				<span>个人中心</span>
				<span class="cor" ng-if="headerFlag==2" ng-cloak></span>
				<ul class="header_another_navigation navigation_third clearfix" style="left:-250px;" ng-if="headerFlag==2" ng-cloak>
					<li>
						<a href="<%=request.getContextPath() %>/GetUserMessageServlet">
							<span>修改资料</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>我的行程</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>我的收藏</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>我的足迹</span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
		<div class="header_user_img float_right">
			<img src="<%=request.getContextPath() %>/img/users.jpg" />
			<div class="header_user_choose">
				<ul>
					<li>
						<a href="#" class="clearfix">
							<i style="background-position: 0 -77px"></i>
							<span>修改资料</span>
						</a>
					</li>
					<li>
						<a href="#" class="clearfix">
							<i style="background-position: 0 -177px"></i>
							<span>我的行程</span>
						</a>
					</li>
					<li>
						<a href="#" class="clearfix">
							<i style="background-position: 0 -216px"></i>
							<span>我的收藏</span>
						</a>
					</li>
					<li>
						<a href="#" class="clearfix">
							<i style="background-position: 0 -97px"></i>
							<span>我的足迹</span>
						</a>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/LoginOutServlet" class="clearfix">
							<i style="background-position: 0 -198px"></i>
							<span>退出</span>
						</a>
					</li>
				</ul>
				<div class="header_choose_icon"></div>
			</div>
		</div>
		<div class="header_search float_right">
			<form class="clearfix">
				<div class="header_search_box float_left">
					<input type="text" placeholder="目的地/类型"  />
				</div>
				<button class="float_left">搜索</button>
			</form>
		</div>
	</div>
	<div class="header_another_box"></div>
</div>