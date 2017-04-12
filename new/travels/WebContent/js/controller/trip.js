/*
 * 行程详情
 */
app.controller("tripDetailController", function($scope, $http) {
	
	// 行程收藏
	var save = {
		ifSave: "",
		planId: "",
		userId: "",
		saveTripClick: function() {
			$http({  
				    method:'post',  
				    url:'SaveServlet',
				    data:{
				    	operate: "save",
				    	planId: this.planId,
				    	userId: this.userId
				    },
			}).then(function successCallback(response) {
			    var data = response.data;
			    switch(data) {
			    	case 'sameUser': 
			    		alert("不能收藏自己发布的行程");
			    		break;
			    	case 'saveError': 
			    		alert("收藏失败，请重试");
			    		break;
			    	case 'success': 
			    		alert("收藏成功");
			    		$scope.save.ifSave = 1;
			    		break;
			    	default: 
			    		break;
			    }
			}, function errorCallback(response) {
			    alert('收藏失败，请重试');
			});
		},
		deleteSaveClick: function() {
			$http({  
				    method:'post',  
				    url:'SaveServlet',
				    data:{
				    	operate: "delete",
				    	planId: this.planId,
				    	userId: this.userId
				    },
			}).then(function successCallback(response) {
			    var data = response.data;
			    switch(data) {
			    	case 'deleteError': 
			    		alert("取消收藏失败，请重试");
			    		break;
			    	case 'success': 
			    		alert("取消收藏成功");
			    		$scope.save.ifSave = 0;
			    		break;
			    	default: 
			    		break;
			    }
			}, function errorCallback(response) {
			    alert('取消收藏失败，请重试');
			});
		}
	}
	
	// 行程评论
	var tripComment = {
		id: "",
		commentsText: "",
		commentsClick: function(id) {
			if(this.commentsText != "") {
				$http({  
				    method:'post',  
				    url:'ReleaseCommentServlet',
				    data:{
				    	comments: this.commentsText,
				    	id: id
				    },
				}).then(function successCallback(response) {
				    var data = response.data;
				    switch(data) {
				    	case 'error': 
				    		alert("评论失败，请重试");
				    		break;
				    	case 'success': 
				    		alert("评论成功");
				    		location.reload();
				    		break;
				    	default: 
				    		break;
				    }
				}, function errorCallback(response) {
				    alert('评论失败，请重试');
				});
			}
		}
	}
	
	$scope.save = save;
	$scope.tripComment = tripComment;
	
});