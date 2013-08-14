class padule.Views.Event extends Backbone.View
  el: $ '.schedule-sidebar'

  initialize: (options={})->
    _.bindAll @

    new padule.Views.EventList
      collection: @collection
      schedules: options.schedules

    new padule.Views.EventAddButton
      collection: @collection