class padule.Collections.Schedules extends Backbone.Collection
  model: padule.Models.Schedule
  url: "/schedules"
  localStorage: new Store("schedule")

  initialize: (models, options={})->
    @event = options._event

  fetchByEvent: ->
    @fetch
      data:
        event_id: @event.id