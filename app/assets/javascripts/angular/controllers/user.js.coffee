# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
angular.module('clockwize').controller 'UserController', ($scope, Users) ->
	# currentUser = simple way to detect signed-in user
	$scope.currentUser = ''
	$scope.user = {}  # must declare object user for ng-model: "user.email"

	# Sign-in
	$scope.signin = ->
		if $scope.user.email
			u = new Users().create($scope.user)
			if !u.error?
				$scope.setCurrentUser(u)

	# Set signed-in user
	$scope.setCurrentUser = (u) ->
		$scope.currentUser = u.email

	# Is user signed-in?
	$scope.isSignedin = ->
		return $scope.currentUser.length > 0