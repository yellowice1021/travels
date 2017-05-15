<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>发布行程</title>
	<link rel="stylesheet" href="../../css/common/common.css" type="text/css"  />
	<link rel="stylesheet" href="../../css/trip/trip.css" type="text/css"  />
	<script src="<%=request.getContextPath() %>/js/lib/angular.min.js"></script>
	<style>
		.active_second {
			background: url("../../img/header.png") no-repeat 0 -155px;
		}
	</style>
</head>
<body onload="getCity()">
	<div class="place_container" ng-app="travelsApp">
		<!--导航栏信息-->
		<div ng-controller="headerController" ng-init="initHeaderFlag=2;headerFlag=2">
			<jsp:include page="../common/header.jsp"></jsp:include>
		</div>
		
		<!--发布地点主要内容-->
		<div class="release_place_container">
			<div class="release_place_box">
				<div class="release_place_header">
					<h1>路越远，心越近</h1>
					<p><span>无论是爱情还是青春，其实都在旅行的路上</span></p>
				</div>
				<div class="release_place_main">
					<form action="../../ReleasePlaceServlet" method="post">
						<div class="place_input_box">
							<div class="place_input clearfix">
								<span>出发地：</span>
								<select name="outProvince" onChange="changeCity(this)">
									<option value= 0 >北京</option> 
									<option value= 1 >上海</option> 
									<option value= 2 >天津</option> 
									<option value= 3 >重庆</option> 
									<option value= 4 >河北</option> 
									<option value= 5 >山西</option> 
									<option value= 6 >内蒙古</option> 
									<option value= 7 >辽宁</option> 
									<option value= 8 >吉林</option> 
									<option value= 9 >黑龙江</option> 
									<option value= 10 >江苏</option> 
									<option value= 11 >浙江</option> 
									<option value= 12 >安徽</option> 
									<option value= 13 >福建</option> 
									<option value= 14 >江西</option> 
									<option value= 15 >山东</option> 
									<option value= 16 >河南</option> 
									<option value= 17 >湖北</option> 
									<option value= 18 >湖南</option> 
									<option value= 19 >广东</option> 
									<option value= 20 >广西</option> 
									<option value= 21 >海南</option> 
									<option value= 22 >四川</option> 
									<option value= 23 >贵州</option> 
									<option value= 24 >云南</option> 
									<option value= 25 >西藏</option> 
									<option value= 26 >陕西</option> 
									<option value= 27 >甘肃</option> 
									<option value= 28 >宁夏</option> 
									<option value= 29 >青海</option> 
									<option value= 30 >新疆</option> 
									<option value= 31 >香港</option> 
									<option value= 32 >澳门</option> 
									<option value= 33 >台湾</option> 
								</select>
								<select name="outCity" id="outCity">
								</select>
							</div>
							<div class="place_input clearfix">
								<span>目的地：</span>
								<select name="inProvince" onChange="changeCity(this)">
									<option value= 0 >北京</option> 
									<option value= 1 >上海</option> 
									<option value= 2 >天津</option> 
									<option value= 3 >重庆</option> 
									<option value= 4 >河北</option> 
									<option value= 5 >山西</option> 
									<option value= 6 >内蒙古</option> 
									<option value= 7 >辽宁</option> 
									<option value= 8 >吉林</option> 
									<option value= 9 >黑龙江</option> 
									<option value= 10 >江苏</option> 
									<option value= 11 >浙江</option> 
									<option value= 12 >安徽</option> 
									<option value= 13 >福建</option> 
									<option value= 14 >江西</option> 
									<option value= 15 >山东</option> 
									<option value= 16 >河南</option> 
									<option value= 17 >湖北</option> 
									<option value= 18 >湖南</option> 
									<option value= 19 >广东</option> 
									<option value= 20 >广西</option> 
									<option value= 21 >海南</option> 
									<option value= 22 >四川</option> 
									<option value= 23 >贵州</option> 
									<option value= 24 >云南</option> 
									<option value= 25 >西藏</option> 
									<option value= 26 >陕西</option> 
									<option value= 27 >甘肃</option> 
									<option value= 28 >宁夏</option> 
									<option value= 29 >青海</option> 
									<option value= 30 >新疆</option> 
									<option value= 31 >香港</option> 
									<option value= 32 >澳门</option> 
									<option value= 33 >台湾</option>
								</select>
								<select name="inCity" id="inCity">
								</select>
							</div>
						</div>
						<button ng-click="cityChoose.cityClick()">下一步</button>
					</form>
				</div>
			</div>
		</div>
				
		<!--底部导航栏-->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="<%=request.getContextPath() %>/js/common/common.js"></script>
<script src="<%=request.getContextPath() %>/js/controller/trip.js"></script>
<script src="<%=request.getContextPath() %>/js/lib/jquery.min.js"></script>
<script>
	var arr = new  Array();
	arr[0 ]="北京";
	arr[1 ]="上海";
	arr[2 ]="和平,东丽,河东,西青,河西,津南,南开,北辰,河北,武清,红挢,塘沽,汉沽,大港,宁河,静海,宝坻,蓟县"; 
	arr[3 ]="重庆"; 
	arr[4 ]="石家庄,邯郸,邢台,保定,张家口,承德,廊坊,唐山,秦皇岛,沧州,衡水"; 
	arr[5 ]="太原,大同,阳泉,长治,晋城,朔州,吕梁,忻州,晋中,临汾,运城";
	arr[6 ]="呼和浩特,包头,乌海,赤峰,呼伦贝尔盟,阿拉善盟,哲里木盟,兴安盟,乌兰察布盟,锡林郭勒盟,巴彦淖尔盟,伊克昭盟"; 
	arr[7 ]="沈阳,大连,鞍山,抚顺,本溪,丹东,锦州,营口,阜新,辽阳,盘锦,铁岭,朝阳,葫芦岛"; 
	arr[8 ]="长春,吉林,四平,辽源,通化,白山,松原,白城,延边"; 
	arr[9 ]="哈尔滨,齐齐哈尔,牡丹江,佳木斯,大庆,绥化,鹤岗,鸡西,黑河,双鸭山,伊春,七台河,大兴安岭"; 
	arr[10 ]="南京,镇江,苏州,南通,扬州,盐城,徐州,连云港,常州,无锡,宿迁,泰州,淮安"; 
	arr[11 ]="杭州,宁波,温州,嘉兴,湖州,绍兴,金华,衢州,舟山,台州,丽水"; 
	arr[12 ]="合肥,芜湖,蚌埠,马鞍山,淮北,铜陵,安庆,黄山,滁州,宿州,池州,淮南,巢湖,阜阳,六安,宣城,亳州"; 
	arr[13 ]="福州,厦门,莆田,三明,泉州,漳州,南平,龙岩,宁德"; 
	arr[14 ]="南昌市,景德镇,九江,鹰潭,萍乡,新馀,赣州,吉安,宜春,抚州,上饶"; 
	arr[15 ]="济南,青岛,淄博,枣庄,东营,烟台,潍坊,济宁,泰安,威海,日照,莱芜,临沂,德州,聊城,滨州,菏泽"; 
	arr[16 ]="郑州,开封,洛阳,平顶山,安阳,鹤壁,新乡,焦作,濮阳,许昌,漯河,三门峡,南阳,商丘,信阳,周口,驻马店,济源"; 
	arr[17 ]="武汉,宜昌,荆州,襄樊,黄石,荆门,黄冈,十堰,恩施,潜江,天门,仙桃,随州,咸宁,孝感,鄂州"; 
	arr[18 ]="长沙,常德,株洲,湘潭,衡阳,岳阳,邵阳,益阳,娄底,怀化,郴州,永州,湘西,张家界"; 
	arr[19 ]="广州,深圳,珠海,汕头,东莞,中山,佛山,韶关,江门,湛江,茂名,肇庆,惠州,梅州,汕尾,河源,阳江,清远,潮州,揭阳,云浮"; 
	arr[20 ]="南宁,柳州,桂林,梧州,北海,防城港,钦州,贵港,玉林,南宁地区,柳州地区,贺州,百色,河池"; 
	arr[21 ]="海口,三亚"; 
	arr[22 ]="成都,绵阳,德阳,自贡,攀枝花,广元,内江,乐山,南充,宜宾,广安,达川,雅安,眉山,甘孜,凉山,泸州"; 
	arr[23 ]="贵阳,六盘水,遵义,安顺,铜仁,黔西南,毕节,黔东南,黔南"; 
	arr[24 ]="昆明,大理,曲靖,玉溪,昭通,楚雄,红河,文山,思茅,西双版纳,保山,德宏,丽江,怒江,迪庆,临沧"; 
	arr[25 ]="拉萨,日喀则,山南,林芝,昌都,阿里,那曲"; 
	arr[26 ]="西安,宝鸡,咸阳,铜川,渭南,延安,榆林,汉中,安康,商洛"; 
	arr[27 ]="兰州,嘉峪关,金昌,白银,天水,酒泉,张掖,武威,定西,陇南,平凉,庆阳,临夏,甘南"; 
	arr[28 ]="银川,石嘴山,吴忠,固原"; 
	arr[29 ]="西宁,海东,海南,海北,黄南,玉树,果洛,海西"; 
	arr[30 ]="乌鲁木齐,石河子,克拉玛依,伊犁,巴音郭勒,昌吉,克孜勒苏柯尔克孜,博 尔塔拉,吐鲁番,哈密,喀什,和田,阿克苏"; 
	arr[31 ]="香港"; 
	arr[32 ]="澳门"; 
	arr[33 ]="台北,高雄,台中,台南,屏东,南投,云林,新竹,彰化,苗栗,嘉义,花莲,桃园,宜兰,基隆,台东,金门,马祖,澎湖"; 
	
	function getCity() {
		
		var outCity = $("#outCity")[0];
		var inCity = $("#inCity")[0];
		var cityArr = arr[0].split(",");
		
		for(var i = 0; i < cityArr.length; i++) {
			outCity[i] = new Option(cityArr[i], cityArr[i]);
			inCity[i] = new Option(cityArr[i], cityArr[i]);
		}
		
	}
	
	function changeCity(option) {
		var index = option.selectedIndex;
		var city = $(option).next()[0];
		var cityArr = arr[index].split(",");
		
		city.length = 0;
		for(var i = 0; i < cityArr.length; i++) {
			city[i] = new Option(cityArr[i], cityArr[i]);
		}
	}
</script>
</html>