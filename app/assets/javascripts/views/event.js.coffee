class padule.Views.Event extends Backbone.View
  el: $ '.schedule-sidebar'

  initialize: (options = {})->
    _.bindAll @
    @schedules = options.schedules

    new padule.Views.EventList
      collection: @collection
      el: '#eventList'
      schedules: @schedules