var app = angular.module("travelsApp", []);

app.config(function($httpProvider){
	$httpProvider.defaults.transformRequest = function(obj){
	    var str = [];
	    for(var p in obj) {
	        str.push(encodeURIComponent(p) + '=' + encodeURIComponent(obj[p]));
	    }
	    return str.join("&");
	};
	$httpProvider.defaults.headers.post = {
	    'Content-Type': 'application/x-www-form-urlencoded'
	}; 
});

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
			    console.log(data)
			    if(data == "verify") {
			    	alert("验证码错误，请重新输入");
			    }
			}, function errorCallback(response) {
			    alert('添加失败');
			});
		}
	}
	
	$scope.verifyImage = verifyImage;
	$scope.person = person;
	
});
