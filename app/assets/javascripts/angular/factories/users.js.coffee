# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
angular.module('clockwize').factory 'Users', ($resource) ->
	class Users
		constructor: ->
			@service = $resource('/api/users.json',
					{})

		create: (attrs) ->
			new @service(task: attrs).$save (task) ->
				attrs.id = task.id
			attrs

		all: ->
			@service.query()
