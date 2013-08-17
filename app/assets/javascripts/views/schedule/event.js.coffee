class padule.Views.Event extends Backbone.View
  el: $ '#eventSidebar'

  events:
    'click .add-event-btn' : 'addEvent'

  initialize: ->
    _.bindAll @
    new padule.Views.EventList
      collection: @collection
    @collection.fetch()

  addEvent: ->
    @collection.push new padule.Models.Event