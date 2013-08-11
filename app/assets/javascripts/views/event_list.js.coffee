class padule.Views.EventList extends Backbone.View
  initialize: (options = {})->
    _.bindAll @
    @schedules = options.schedules
    @listenTo @collection, 'add', @renderOne
    @renderAll()

  renderOne: (event)->
    view = new padule.Views.EventListElement
      model: event
      schedules: @schedules
      parent: @
    @$el.append view.render().el

  renderAll: ->
    @collection.each @renderOne