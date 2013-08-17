class padule.Views.ScheduleControl extends Backbone.View
  template: JST['templates/schedule_control']
  events:
    'click #addScheduleButton' : 'addSchedule'

  initialize: ->
    @event = @collection.event

  render: ->
    @$el.html @template
      event: @event.toJSON()
    @_initDatepicker()
    @_initTimepicker()
    @

  addSchedule: ->
    new_schedule = new padule.Models.Schedule
      event_id: @event.id
      start_time: @_getStartTime()
    @collection.push new_schedule
    new_schedule.save()

  _getStartTime: ->
    date = @$('#scheduleDatepicker').val()
    time = @$('#scheduleTimepicker').val()
    datetime = date + ' ' + time
    datetime = datetime.replace(/\//g, '-') + ":00"
    datetime

  _initDatepicker: ->
    @$("#scheduleDatepicker").datepicker
      format: 'yyyy/mm/dd'

  _initTimepicker: ->
    @$('#scheduleTimepicker').timepicker
      minuteStep: 10
      showInputs: false
      showSeconds: false
      defaultTime: false
      showMeridian: false
      modalBackdrop: true
