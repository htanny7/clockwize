# http://blog.ragnarson.com/2013/10/01/how-to-integrate-angularjs-with-rails-4.html
# get()
# query()
# save()
# remove()
# delete()
angular.module('clockwize').factory 'Users', ($resource) ->
	class Users
		constructor: ->
			# Additional params may be added in {}
			@service = $resource('/api/users.json',
					{})

		# Execute POST
		create: (attrs) ->
			# new @service(user: attrs).$save (user) ->
			# user: attrs in Rails becomes user: {email: ....}
			new @service(user: attrs).$save ((user) ->
				# Success - 1st function
				attrs = user
				# should just attr = user (e.g. user is json
			),	(error) ->
				# Error - 2nd function
				# Example Rails: render json: @user, status: :unprocessable_entity
				# Becomes: error.data = @user, error.status = 422 (= unprocessable_entity)
				attrs.error = error.status
				console.log 'error'
			attrs

		all: ->
			@service.query()
