class padule.Routers.Schedules extends Backbone.Router
  routes:
    '' : 'schedules'
    'schedule/' : 'schedules'
    'schedule/seeker/' : 'seeker_schedules'
    'schedule/index' : 'schedules'
    'seeker_schedule/index' : 'seeker_schedules'

  schedules: ->
    new padule.Views.UserInfo
      model: new padule.Models.User
    new padule.Views.Event
      collection: new padule.Collections.Events
    window.padule.modal = new padule.Views.AlertModal
    window.padule.info_area = new padule.Views.InfoArea

  seeker_schedules: ->
    event_id = $('.seeker-schedule-container').attr 'data-eventid'

    new padule.Views.SeekerScheduleInput
      collection: new padule.Collections.Schedules false, _event: new padule.Models.Event {id: event_id}
      seeker: new padule.Models.Seeker