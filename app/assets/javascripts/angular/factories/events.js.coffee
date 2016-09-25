angular.module('clockwize').factory 'Events', ($resource) ->
	class Events
		constructor: ->
			@service = $resource('/api/events.json',
					{})

		create: (attrs) ->
			new @service(task: attrs).$save (task) ->
				attrs.id = task.id
			attrs

		all: ->
			@service.query()
