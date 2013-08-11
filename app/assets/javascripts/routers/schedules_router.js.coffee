class padule.Routers.Schedules extends Backbone.Router
  routes:
    'schedule/index': 'schedules'

  schedules: ->
    events = new padule.Collections.Events
    schedules = new padule.Collections.Schedules

    new padule.Views.Event
      collection: events
      schedules: schedules
    new padule.Views.Schedule
      collection: schedules
