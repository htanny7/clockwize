// gem 'angular-rails-templates' requires 'template' module
angular.module('clockwize', ['ngRoute', 'ngResource', 'templates', 'bootstrap.angular.validation', 'ui.bootstrap.position'])
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
})

// http://sagrawal14.github.io/bootstrap-angular-validation/#/customization-and-examples
.config(['bsValidationConfigProvider', function(bsValidationConfigProvider) {
	// Before a field is marked as invalid, the validation is lazy
	// Once a field is marked invalid, it is eagerly validated
	bsValidationConfigProvider.global.setValidateFieldsOn('submit');
	// We can also customize to enable the multiple events to display form validation state
	// bsValidationConfigProvider.global.setValidateFieldsOn(['submit', 'blur]);
	bsValidationConfigProvider.global.tooltipAppendToBody = true;

	// bsValidationConfigProvider.global.errorMessagePrefix = '<span class="glyphicon glyphicon-warning-sign"></span> &nbsp;';
}]);