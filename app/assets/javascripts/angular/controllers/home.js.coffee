# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
# Root or home controller
angular.module('clockwize').controller 'HomeController', ($scope) ->
	$scope.things = ['Angular', 'Rails 4.1', 'Working', 'Together!!']
