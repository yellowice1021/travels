<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>详情界面</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/search/search.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_first {
			background: url("<%=request.getContextPath() %>/img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body>
	<div class="detailtrip_container" ng-app="travelsApp" ng-controller="tripDetailController">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=1;headerFlag=1">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--介绍内容-->
		<div class="comment_container">
			<div class="comment_box detail_box">
				<div class="detail_person_box clearfix">
					<img src="<%=request.getContextPath() %>/${message.picture}" />
					<div class="detail_intoduce">
						<div class="detail_person clearfix" ng-init="save.ifSave=${message.save};save.planId=${message.id};save.userId=${message.users}" ng-cloak>
							<a class="detail_person_save" href="javascript:void(0);" title="取消收藏" style="background:url('<%=request.getContextPath() %>/img/save.jpg') no-repeat -250px -62px" ng-if="save.ifSave==1" ng-click="save.deleteSaveClick()"></a>
							<a class="detail_person_save" href="javascript:void(0);" title="收藏行程" style="background:url('<%=request.getContextPath() %>/img/save.jpg') no-repeat -330px -62px;cursor:pointer" ng-click="save.saveTripClick()" ng-if="save.ifSave==0"></a>
							<h4>${message.title}</h4>
							<span>${message.date}发布</span>
						</div>
						<div class="detail_text">
							<p class="detail_person_txt clearfix">
								<span class="detail_title">发布者：</span>
								<img src="<%=request.getContextPath() %>/${message.face}" />
								<span>${message.username}</span>
							</p>
							<p>
								<span class="detail_title_box">
									<span class="detail_title">行程出发地：</span>
									<span>${message.outCity }</span>
								</span>
								<span class="detail_title_box">
									<span class="detail_title">行程目的地：</span>
									<span>${message.inCity}</span>
								</span>
							</p>
							<p>
								<span class="detail_title">行程天数：</span>
								<span>${message.days}天</span>
							</p>
							<p>
								<span class="detail_title">行程介绍：</span>
								<span>${message.introduce}</span>
							</p>
						</div>
					</div>
				</div>
				<div class="detail_trip_box">
					<div class="header clearfix">
						<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
						<h4>详细行程</h4>
					</div>
					<div class="day_box">
						<ul>
							<c:forEach var="detail" items="${tripDetails}">
								<li>
									<div class="day_text clearfix">
										<h4>第${detail.day}天</h4>
										<div class="day_place">
											<ul>
												<li>第${detail.day}天的行程安排</li>
											</ul>
										</div>
										<!--  
										<div class="day_place">
											<ul class="clearfix">
												<li>
													<span>颐和园</span>
													<span>——</span>
												</li>
												<li>
													<span>北京天安门</span>
													<span>——</span>
												</li>
												<li>
													<span>万里长城</span>
													<span>——</span>
												</li>
												<li>
													<span>故宫</span>
												</li>
											</ul>
										</div>
										-->
									</div>
									<div class="day_arrange">
										<ul>
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat -248px -248px;background-color:white"></i>
													<h4>推荐行程</h4>
												</div>
												<div class="arrange_introduce">
													<p>
														<span>${detail.trip}</span>
													</p>
												</div>
												<!--
												<div class="arrange_picture">
													<ul class="clearfix">
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
													</ul>
												</div>
												-->
											</li>
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat -346px -248px;background-color:white"></i>
													<h4>推荐美食</h4>
												</div>
												<div class="arrange_introduce">
													<p>
														<span>${detail.food}</span>
													</p>
												</div>
												<!-- 
												<div class="arrange_picture">
													<ul class="clearfix">
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
													</ul>
												</div>
												-->
											</li>
											<li class="arrange_box">
												<div class="arrange_header">
													<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat -298px -248px;background-color:white"></i>
													<h4>推荐住宿</h4>
												</div>
												<div class="arrange_introduce">
													<p>
														<span>${detail.live}</span>
													</p>
												</div>
												<!--  
												<div class="arrange_picture">
													<ul class="clearfix">
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
														<li>
															<img src="../../images/search/beijing.jpg"  />
														</li>
													</ul>
												</div>
												-->
											</li>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="detail_comment_box">
				<div class="comment_box">
					<div class="comment_header clearfix">
						<i style="background:url('<%=request.getContextPath() %>/img/icon.png') no-repeat 0 -100px"></i>
						<h4>评论区</h4>
					</div>
					<div class="comment_write_box">
						<form>
							<textarea name="comment" placeholder="亲，说说你对这个行程规划的想法" required ng-model="tripComment.commentsText"></textarea>
							<button ng-click="tripComment.commentsClick(${message.id})">评论</button>
						</form>
					</div>
					<div class="comment_detail_box">
						<ul>
							<c:forEach var="comment" items="${tripComments}">
								<li class="clearfix">
									<img src="<%=request.getContextPath() %>/${comment.face}" />
									<div class="comment_text_box">
										<div class="comment_text_name clearfix">
											<h4>${comment.username}</h4>
											<span>${comment.date}</span>
										</div>
										<div class="comment_detail_text">
											<p>${comment.comment }</p>
										</div>
									</div>
								</li>
							</c:forEach>
							<c:if var="result" test="${empty tripComments}">
								<li class="comment_empty_box">暂无评论</li>
							</c:if>
						</ul>
						<div class="comment_page_box">
							<a href="#">上一页</a>
							<a href="#" class="active">1</a>
							<a href="#">2</a>
							<a href="#">下一页</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/trip.js"></script>
</html>