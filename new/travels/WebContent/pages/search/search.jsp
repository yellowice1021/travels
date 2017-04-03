<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>查询界面</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/search/search.css" type="text/css"  />
</head>
<body>
	<div class="searchtrip_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--搜索结果-->
		<div class="comment_container">
			<div class="comment_box search_box">
				<div class="search_introduce clearfix">
					<h4>北京</h4>
					<img src="../../images/search/beijing.jpg"  />
					<div class="search_introduce_box">
						<p>
							<span class="introduce_title">相关介绍：</span>
							<span>厦门是一个秀丽清新的城市，空气和阳光都很好。厦门大学的校园整洁优美，鼓浪屿有很多特色店铺，都是可以去看看的。厦门的街道很干净，慢节奏的生活很惬意。海鲜不错，当地小吃很棒。海边也是很漂亮的，在这里可以看日出日落，都是一件很开心的事。可以在海边游泳，烧烤，看海景，漫步，在这座城市你会发现很轻松很愉快。</span>
						</p>
						<p>
							<span class="introduce_title">最佳季节：</span>
							<span>3-5月、9-10月</span>
						</p>
						<p>
							<span class="introduce_title">建议游玩：</span>
							<span>3-5天</span>
						</p>
						<p>
							<span class="introduce_title">推荐景点：</span>
							<span>北京天安门、万里长城</span>
						</p>
					</div>
				</div>
				<div class="search_header">
					<div class="search_select clearfix">
						<span>目的地：</span>
						<ul>
							<li>
								<a href="#">全部</a>
							</li>
							<li>
								<a href="#" class="active">北京</a>
							</li>
							<li>
								<a href="#">上海</a>
							</li>
							<li>
								<a href="#">成都</a>
							</li>
							<li>
								<a href="#">杭州</a>
							</li>
							<li>
								<a href="#">厦门</a>
							</li>
							<li>
								<a href="#">丽江</a>
							</li>
							<li>
								<a href="#">香港</a>
							</li>
							<li>
								<a href="#">大理</a>
							</li>
							<li>
								<a href="#">昆明</a>
							</li>
							<li>
								<a href="#">香格里拉</a>
							</li>
						</ul>
					</div>
					<div class="search_select clearfix">
						<span>天数：</span>
						<ul>
							<li>
								<a href="#" class="active">全部</a>
							</li>
							<li>
								<a href="#">1天</a>
							</li>
							<li>
								<a href="#">2天</a>
							</li>
							<li>
								<a href="#">3天</a>
							</li>
							<li>
								<a href="#">4天</a>
							</li>
							<li>
								<a href="#">5天</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="search_main_box">
					<ul class="clearfix">
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="search_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="search_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="search_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="search_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="comment_page_box">
					<a href="#">上一页</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">下一页</a>
				</div>
			</div>
		</div>
		
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>