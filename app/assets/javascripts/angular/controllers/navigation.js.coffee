# Control navigations (menus bar)
angular.module('clockwize').controller 'NavigationController', ($scope) ->
	# An object to build navigations
	# This should match $routeProvider in app.js
	$scope.topNavs = [
		{url: '/', title: 'Home'},
		{url: 'users', title: 'Users'},
		{url: 'events', title: 'Events'},
		{url: 'about', title: 'About'}
	]

	# Select a navigation item
	$scope.select = (item) ->
		$scope.selected = item

	# Test if the given item is active
	$scope.isActive = (item) ->
		return $scope.selected == item
