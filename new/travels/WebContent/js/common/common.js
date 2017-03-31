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
