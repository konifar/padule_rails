class padule.Collections.Schedules extends Backbone.Collection
  model: padule.Models.Schedule
  url: "/schedules"

  initialize: (options={})->
    @event_ = options.event_
    @event_.schedules = @
