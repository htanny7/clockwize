describe('Clockwize Controller', function () {

	beforeEach(module('clockwize'));

	var $controller;

	beforeEach(inject(function(_$controller_){
		$controller = _$controller_;
	}));

	describe('sum', function () {
		it('1 + 1 should equal 2', function () {
			var $scope = {};
			var controller = $controller('UsersController', { $scope: $scope });
			expect($scope.count()).toBe(4);
		});
	});

});