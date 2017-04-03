<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>我的收藏界面</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/users/users.css" type="text/css"  />
</head>
<body>
	<div class="save_container">
		<!--导航栏信息-->
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!--我的收藏-->
		<div class="comment_container">
			<div class="comment_box my_save_box">
				<div class="my_save_header">
					<i style="background:url('../../img/icon.png') no-repeat 0 -100px"></i>
					<h4>我的收藏</h4>
				</div>
				<div class="my_save_main">
					<ul class="clearfix">
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="my_save_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="my_save_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="my_save_text">
								<h4><a href="#">北京1日游</a></h4>
								<p>目的地：北京</p>
								<p>行程天数：1天</p>
							</div>
						</li>
						<li>
							<a href="#">
								<img src="../../images/search/beijing.jpg"  />
							</a>
							<div class="my_save_text">
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