describe('UsersController', function () {

	var $controller, $rootScope, mockUsers;

	// Mock factory
	// Our UsersFactory was declared as a class (factories/users.js.coffee)
	// mockUsers must declare as a class a well
	beforeEach(function () {
		// Mock UsersFactory
		mockUsers = (function() {
			function mockUsers() {}

			mockUsers.prototype.all = function() {
				return [{id: 1, email: "john@smith.com"}];
			};

			return mockUsers;
		})();
	});

	// Injecting mock Users
	beforeEach(module('clockwize'), function($provide) {
		$provide.factory('Users', mockUsers);
	});

	beforeEach(inject(function(_$rootScope_, _$controller_) {
		$rootScope = _$rootScope_;
		$controller = _$controller_;
	}));

	describe('Users', function () {
		it('All users', function () {
			var $scope = {};
			var allUsers = [{id: 1, email: "john@smith.com"}];

			var controller = $controller('UsersController', { $scope: $scope, Users: mockUsers });

			// toBe() compares with === which means they need to be identical
			// objects not just identical values. Here I use toEqual
			expect($scope.users).toEqual(allUsers);
		});
	});

});