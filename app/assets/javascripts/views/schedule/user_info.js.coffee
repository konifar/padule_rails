class padule.Views.UserInfo extends Backbone.View
  el: $ '#userInfo'

  initialize: ->
    _.bindAll @
    @listenTo @model, 'sync', ->
      @$el.find('.dropdown a').append @model.get('name')