/*
 * 注册 
 */
app.controller("registerController", function($scope, $http) {
	
	// 验证码
	var verifyImage = {
		imageUrl: "ImageServlet",
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
			if(this.username && this.passwords && this.surePasswords && this.verifyCode) {
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
