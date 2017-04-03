<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>详情界面</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/search/search.css" type="text/css"  />
</head>
<body>
	<div class="detailtrip_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--介绍内容-->
		<div class="comment_container">
			<div class="comment_box detail_box">
				<div class="detail_person_box clearfix">
					<img src="../../images/search/beijing.jpg"  />
					<div class="detail_intoduce">
						<div class="detail_person clearfix">
							<h4>姓名</h4>
							<span>2017-3-7发布</span>
						</div>
						<div class="detail_text">
							<p>
								<span class="detail_title">行程目的地：</span>
								<span>北京</span>
							</p>
							<p>
								<span class="detail_title">行程天数：</span>
								<span>4天</span>
							</p>
							<p>
								<span class="detail_title">行程介绍：</span>
								<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
							</p>
						</div>
					</div>
				</div>
				<div class="detail_trip_box">
					<div class="header clearfix">
						<i style="background:url('../../img/icon.png') no-repeat 0 -100px"></i>
						<h4>详细行程</h4>
					</div>
					<div class="day_box">
						<ul>
							<li>
								<div class="day_text clearfix">
									<h4>第一天</h4>
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
								</div>
								<div class="day_arrange">
									<ul>
										<li class="arrange_box">
											<div class="arrange_header">
												<i style="background:url('../../img/icon.png') no-repeat -248px -248px;background-color:white"></i>
												<h4>推荐行程</h4>
											</div>
											<div class="arrange_introduce">
												<p>
													<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
												</p>
											</div>
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
										</li>
										<li class="arrange_box">
											<div class="arrange_header">
												<i style="background:url('../../img/icon.png') no-repeat -346px -248px;background-color:white"></i>
												<h4>推荐美食</h4>
											</div>
											<div class="arrange_introduce">
												<p>
													<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
												</p>
											</div>
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
										</li>
										<li class="arrange_box">
											<div class="arrange_header">
												<i style="background:url('../../img/icon.png') no-repeat -298px -248px;background-color:white"></i>
												<h4>推荐住宿</h4>
											</div>
											<div class="arrange_introduce">
												<p>
													<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
												</p>
											</div>
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
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="day_text clearfix">
									<h4>第一天</h4>
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
								</div>
								<div class="day_arrange">
									<ul>
										<li class="arrange_box">
											<div class="arrange_header">
												<i style="background:url('../../img/icon.png') no-repeat -248px -248px;background-color:white"></i>
												<h4>推荐行程</h4>
											</div>
											<div class="arrange_introduce">
												<p>
													<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
												</p>
											</div>
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
										</li>
										<li class="arrange_box">
											<div class="arrange_header">
												<i style="background:url('../../img/icon.png') no-repeat -346px -248px;background-color:white"></i>
												<h4>推荐美食</h4>
											</div>
											<div class="arrange_introduce">
												<p>
													<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
												</p>
											</div>
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
										</li>
										<li class="arrange_box">
											<div class="arrange_header">
												<i style="background:url('../../img/icon.png') no-repeat -298px -248px;background-color:white"></i>
												<h4>推荐住宿</h4>
											</div>
											<div class="arrange_introduce">
												<p>
													<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
												</p>
											</div>
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
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="detail_comment_box">
				<div class="comment_box">
					<div class="comment_header clearfix">
						<i style="background:url('../../img/icon.png') no-repeat 0 -100px"></i>
						<h4>评论区</h4>
					</div>
					<div class="comment_write_box">
						<form>
							<textarea placeholder="亲，说说你对这个行程规划的想法"></textarea>
							<button>评论</button>
						</form>
					</div>
					<div class="comment_detail_box">
						<ul>
							<li class="clearfix">
								<img src="../../images/search/beijing.jpg"  />
								<div class="comment_text_box">
									<div class="comment_text_name clearfix">
										<h4>姓名</h4>
										<span>2017-03-07</span>
									</div>
									<div class="comment_detail_text">
										<p>评论内容</p>
									</div>
								</div>
							</li>
							<li class="clearfix">
								<img src="../../images/search/beijing.jpg"  />
								<div class="comment_text_box">
									<div class="comment_text_name clearfix">
										<h4>姓名</h4>
										<span>2017-03-07</span>
									</div>
									<div class="comment_detail_text">
										<p>评论内容</p>
									</div>
								</div>
							</li>
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
</html>