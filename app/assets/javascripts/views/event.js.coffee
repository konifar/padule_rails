class padule.Views.Event extends Backbone.View
  el: $ '.schedule-sidebar'

  initialize: ->
    _.bindAll @

    new padule.Views.EventList
      collection: @collection
      el: '#eventList'
