# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
angular.module('clockwize').controller 'UserController', ($scope, Users) ->
	# currentUser = simple way to detect signed-in user
	$scope.currentUser = ''

	# Sign-in
	$scope.signin = ->
		if $scope.user.email
			user = new Users().create($scope.user)
			if !user.error?
				$scope.setCurrentUser(user)

	# Set signed-in user
	$scope.setCurrentUser = (user) ->
		$scope.currentUser = user.email

	# Is user signed-in?
	$scope.isSignedIn = ->
		return $scope.currentUser?