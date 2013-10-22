class padule.Views.EventList extends Backbone.View
  el: $ "#eventList"

  initialize: ->
    _.bindAll @
    @listenTo @collection, 'add', @render

  render: (_event)->
    view = new padule.Views.EventListElement
      model: _event
    @$el.append view.render().el
