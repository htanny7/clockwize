# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
angular.module('clockwize').controller 'UserController', ($scope, Users) ->
	# Sign-in
	$scope.signin = ->
		if $scope.user.email
			new Users().create($scope.user)