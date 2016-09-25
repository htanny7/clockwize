# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
angular.module('clockwize').controller 'UsersController', ($scope, Users) ->
	$scope.users = new Users().all()
