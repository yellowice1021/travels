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

/*
 * 主页事件
 */
app.controller("headerController", function($scope) {
	
	$scope.initHeaderFlag;
	$scope.headerFlag;
	$scope.headerMouseover = function(index) {
		$scope.headerFlag = index;
	}
	$scope.headerMouseleave = function() {
		$scope.headerFlag = $scope.initHeaderFlag;
	}
	
});

app.controller("homeController", function($scope, $interval) {

	var timer = $interval(function() {
		$scope.banner.nextClick();
	}, 3000);
	
	var banner = {
		index: 1,
		bannerBackground : {'background':'url("../../images/home/banner/1.jpeg") no-repeat center 0px'},
		prevClick: function() {
			if(this.index == 1) {
				this.index = 4;
			} else {
				this.index--;	
			}
			this.bannerChange();
		},
		nextClick: function() {
			if(this.index == 4) {
				this.index = 1;
			} else {
				this.index++;	
			}
			this.bannerChange();
		},
		bannerChange: function() {
			switch(this.index) {
				case 1:
					this.bannerBackground = {'background':'url("../../images/home/banner/1.jpeg") no-repeat center 0px'};
					break;
				case 2: 
					this.bannerBackground = {'background':'url("../../images/home/banner/2.jpeg") no-repeat center 0px'};
					break;
				case 3:
					this.bannerBackground = {'background':'url("../../images/home/banner/3.jpeg") no-repeat center 0px'};
					break;
				case 4:
					this.bannerBackground = {'background':'url("../../images/home/banner/4.jpeg") no-repeat center 0px'};
					break;
				default:
					break;
			}
		},
		indexClick: function(index) {
			this.index = index;
			this.bannerChange();
		},
		stopBanner: function() {
			$interval.cancel(timer);
		},
		beginBanner: function() {
			timer = $interval(function() {
				$scope.banner.nextClick();
			}, 3000);
		}
	}
	
	$scope.banner = banner;

});
