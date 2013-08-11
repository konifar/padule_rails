class padule.Routers.Schedules extends Backbone.Router
  routes:
    'schedule/index': 'schedules'

  schedules: ->
    new padule.Views.Event
      collection: new padule.Collections.Events
