class padule.Collections.Schedules extends Backbone.Collection
  model: padule.Models.Schedule
  localStorage: new Store("schedules")
  url: "/schedules"

  update: ->
    options =
      type: 'POST'
      data:
        @toJSON()
    Backbone.sync 'create', @,  options