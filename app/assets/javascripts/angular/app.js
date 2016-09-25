// gem 'angular-rails-templates' requires 'template' module
angular.module('clockwize', ['ngRoute', 'ngResource', 'templates'])
.config(function ($routeProvider, $locationProvider, $httpProvider) {
	// Add a routing directive in order to make
	// our HomeController be our "default page."
	$routeProvider
		.when('/', {
			templateUrl: 'home.html',
			controller: 'HomeController'
		})
		.when('/users', {
			templateUrl: 'users.html',
			controller: 'UsersController'
		})
		.when('/events', {
			templateUrl: 'events.html',
			controller: 'EventsController'
		})
		.when('/about', {
			templateUrl: 'about.html'
		})
		// Route all other paths to home
		.otherwise({
			templateUrl: 'home.html',
			controller: 'HomeController'
		});

	// html5Mode (history.pushState),
	// you need to specify the base URL
	// for the application with a <head><base href="/"></head>
	$locationProvider.html5Mode(true);

	// Making it work with CSRF protection
	authToken = $("meta[name=\"csrf-token\"]").attr("content");
	$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});
