angular.module('clockwize').controller 'EventsController', ($scope, Events) ->
	$scope.events = new Events().all()
