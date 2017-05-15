/*
 * 注册 
 */
app.controller("registerController", function($scope, $http) {
	
	// 验证码
	var verifyImage = {
		imageUrl: "../../ImageServlet",
		imageClick: function() {
			var time = new Date().getTime();
			this.imageUrl += "?d" + time;
		}
	}
	// 用户信息
	var person = {
		username: "",
		passwords: "",
		surePasswords: "",
		verifyCode: "",
		registerSubmit: function() {
			console.log(this.passwords);
			console.log(this.surePasswords);
			console.log(this.passwords == this.surePasswords);
			if(this.username && this.passwords && this.surePasswords && this.verifyCode && this.passwords == this.surePasswords) {
				$http({  
				    method:'post',  
				    url:'../../RegisterServlet',
				    data:{
				    	username: this.username,
				    	passwords: this.passwords,
				    	verifyCode: this.verifyCode
				    },
				}).then(function successCallback(response) {
				    var data = response.data;
				    switch(data) {
				    	case 'verifyError': 
				    		alert("验证码错误，请重新输入");
				    		break;
				    	case 'usernameError': 
				    		alert("用户名已存在，请重新输入");
				    		break;
				    	case 'updateError': 
				    		alert("注册失败，请重试");
				    		break;
				    	case 'success': 
				    		alert("注册成功");
				    		window.location.href = "login.jsp";
				    		break;
				    	default: 
				    		break;
				    }
				}, function errorCallback(response) {
				    alert('注册失败，请重试');
				});
			}
		}
	}
	
	$scope.verifyImage = verifyImage;
	$scope.person = person;
	
});

/*
 * 登录
 */
app.controller("loginController", function($scope, $http) {
	
	// 验证码
	var verifyImage = {
		imageUrl: "../../ImageServlet",
		imageClick: function() {
			var time = new Date().getTime();
			this.imageUrl += "?d=" + time;
		}
	}
	// 用户信息
	var loginUsers = {
		username: "",
		passwords: "",
		verifyCode: "",
		loginSubmit: function() {
			if(this.username && this.passwords && this.verifyCode) {
				$http({  
					    method:'post',  
					    url:'../../LoginServlet',
					    data:{
					    	username: this.username,
					    	passwords: this.passwords,
					    	verifyCode: this.verifyCode
					    },
				}).then(function successCallback(response) {
				    var data = response.data;
				    switch(data) {
				    	case 'verifyError': 
				    		alert("验证码错误，请重新输入");
				    		break;
				    	case 'userError': 
				    		alert("用户名或密码错误，请重新输入");
				    		break;
				    	case 'success': 
				    		alert("登录成功");
				    		window.location.href = "../home/home.jsp";
				    		break;
				    	default: 
				    		break;
				    }
				}, function errorCallback(response) {
				    alert('登录失败，请重试');
				});
			}
		}
	}
	
	$scope.verifyImage = verifyImage;
	$scope.loginUsers = loginUsers;
	
});

/*
 * 修改信息
 */
app.controller("messageController", function($scope, $http) {
	
	// 动态样式
	var updateClass = {
		hover: 1,
		boxHover : function(index) {
			this.hover = index;
		}
	}
	
	// 修改密码
	var passUser = {
		username: "",
		oldPasswords: "",
		newPasswords: "",
		passSubmit: function() {

			if(this.username && this.oldPasswords && this.newPasswords) {
				$http({  
					    method:'post',  
					    url:'UpdatePasswordServlet',
					    data:{
					    	username: this.username,
					    	oldPasswords: this.oldPasswords,
					    	newPasswords: this.newPasswords
					    },
				}).then(function successCallback(response) {
				    var data = response.data;
				    switch(data) {
				    	case 'oldPasswordError': 
				    		alert("密码错误，请重新输入");
				    		break;
				    	case 'samePasswordError': 
				    		alert("新密码不得与旧密码相同，请重新输入");
				    		break;
				    	case 'updatePasswordError': 
				    		alert("修改失败，请重试");
				    		break;
				    	case 'success': 
				    		alert("修改成功");
				    		passUser.oldPasswords = "";
				    		passUser.newPasswords = "";
				    		break;
				    	default: 
				    		break;
				    }
				}, function errorCallback(response) {
				    alert('修改失败，请重试');
				});
			}
		}
	}
	
	// 修改信息
	var messageUser = {
		maskShow: false,
		username: "aa",
		sex: "",
		province: "a",
		city: "",
		introduce: "",
		face: "",
		openChangeFace: function() {
			this.maskShow = true;
		},
		closeChangeFace: function() {
			this.maskShow = false;
		},
		updateSubmit: function() {
			if(this.username && this.sex && this.province && this.city) {
				$http({  
					    method:'post',  
					    url:'UpdateMessageServlet',
					    data:{
					    	username: this.username,
					    	sex: this.sex,
					    	province: this.province,
					    	city: this.city,
					    	introduce: this.introduce
					    },
				}).then(function successCallback(response) {
				    var data = response.data;
				    switch(data) {
				    	case 'error': 
				    		alert("修改失败，请重试");
				    		break;
				    	case 'success': 
				    		alert("修改成功");
				    		break;
				    	default: 
				    		break;
				    }
				}, function errorCallback(response) {
				    alert('修改失败，请重试');
				});
			}
		}
	}
	
	$scope.updateClass = updateClass;
	$scope.passUser = passUser;
	$scope.messageUser = messageUser;
	
});

/*
 * 取消收藏
 */
app.controller("deleteSaveController", function($scope, $http) {
	
	var save = {
		deleteSaveClick: function(userId, planId) {
			$http({  
				    method:'post',  
				    url:'SaveServlet',
				    data:{
				    	operate: "delete",
				    	planId: planId,
				    	userId: userId
				    },
			}).then(function successCallback(response) {
			    var data = response.data;
			    switch(data) {
			    	case 'deleteError': 
			    		alert("取消收藏失败，请重试");
			    		break;
			    	case 'success': 
			    		alert("取消收藏成功");
			    		location.reload();
			    		break;
			    	default: 
			    		break;
			    }
			}, function errorCallback(response) {
			    alert('取消收藏失败，请重试');
			});
		}
	}
	
	$scope.save = save;
	
});

/*
 * 删除行程
 */
app.controller("deleteTripController", function($scope, $http) {
	
	var trip = {
		deleteTripClick: function(planId) {
			console.log(planId);
			$http({  
				    method:'post',  
				    url:'TripServlet',
				    data:{
				    	planId: planId
				    },
			}).then(function successCallback(response) {
			    var data = response.data;
			    switch(data) {
			    	case 'deleteError': 
			    		alert("删除行程失败，请重试");
			    		break;
			    	case 'success': 
			    		alert("删除行程成功");
			    		location.reload();
			    		break;
			    	default: 
			    		break;
			    }
			}, function errorCallback(response) {
			    alert('删除行程失败，请重试');
			});
		}
	}
	
	$scope.trip = trip;
	
});

/*
 * 我的足迹
 */
app.controller("footController", function($scope, $http) {
	
	var boxShowHide = {
		ifShow: false,
		ifShowClick: function() {
			this.ifShow = true;
		},
		ifCloseClick: function() {
			this.ifShow = false;
		}
	}
	
	var addFoot = {
		province: "",
		city: "",
		dates: "",
		days: "",
		introduce: "",
		cityList: ["北京"],
		provinceChange: function() {
			var index = this.province.split("_")[1];
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
			
			var citys = arr[index].split(",");
			this.cityList = citys;
			this.city = citys[0];
		},
		addFootClick: function() {
			var province = this.province.split("_")[0];
			if(this.dates && this.introduce) {
				$http({  
					    method:'post',  
					    url:'../../AddFootServlet',
					    data:{
					    	province: province,
					    	city: this.city,
					    	dates: this.dates,
					    	days: this.days,
					    	introduce: this.introduce
					    },
				}).then(function successCallback(response) {
				    var data = response.data;
				    switch(data) {
				    	case 'ifFootError': 
				    		alert("该足迹已经存在，请重新添加");
				    		break;
				    	case 'addFootError': 
				    		alert("添加失败，请重试");
				    		break;
				    	case 'success':
				    		alert("添加成功");
				    		location.reload();
				    	default: 
				    		break;
				    }
				}, function errorCallback(response) {
				    alert('添加失败，请重试');
				});
			}
		},
		deleteDayClick: function() {
			if(this.days == 1) {
				return;
			} else {
				this.days--;
			}
		},
		addDayClick: function() {
			this.days++;
		}
	}
	
	$scope.boxShowHide = boxShowHide;
	$scope.addFoot = addFoot;
	
});
