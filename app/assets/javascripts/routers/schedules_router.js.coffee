class padule.Routers.Schedules extends Backbone.Router
  routes:
    'schedule/index' : 'schedules'
    'seeker_schedule/index' : 'seeker_schedules'

  schedules: ->
    new padule.Views.UserInfo
      model: new padule.Models.User
    new padule.Views.Event
      collection: new padule.Collections.Events
      schedules: new padule.Collections.Schedules

  seeker_schedules: ->
    _event = new padule.Models.Event
    schedules = new padule.Collections.Schedules
    seeker = new padule.Models.Seeker
    new padule.Views.EventInfo
      model: _event
    new padule.Views.SeekerInfo
      model: seeker
    new padule.Views.ScheduleList
      collection: schedules
    new padule.Views.SeekerScheduleControl
      model: seeker
      schedules: schedules