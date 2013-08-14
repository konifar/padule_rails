class padule.Models.User extends Backbone.Model
  urlRoot: '/users/1'

  initialize: ->
    @fetch()
