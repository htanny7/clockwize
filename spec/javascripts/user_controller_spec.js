describe('User', function () {

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

			mockUsers.prototype.testUser = function() {
				return {id: 1, email: "john@smith.com"};
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

	describe('user', function () {
		it('no signed-in user', function () {
			var $scope = {};
			var controller = $controller('UserController', { $scope: $scope, Users: mockUsers });
			expect($scope.currentUser).toBe('');
			expect($scope.isSignedin()).toBe(false);
		});

		it('sign-in a user', function () {
			var $scope = {};
			var controller = $controller('UserController', { $scope: $scope, Users: mockUsers });
			var testUser = new mockUsers().testUser();
			$scope.setCurrentUser(testUser);
			expect($scope.isSignedin()).toBe(true);
		});
	});

});