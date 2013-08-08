class padule.Views.EventList extends Backbone.View
  initialize: ->
    _.bindAll @
    @renderAll()

  renderOne: (event)->
    view = new padule.Views.EventListElement
      model: event
    @$el.append view.render().el

  renderAll: ->
    @collection.each @renderOne