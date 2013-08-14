class padule.Views.ScheduleControl extends Backbone.View
  el: $ '.control-container'
  template: JST['templates/schedule_control']

  events:
    'click #addScheduleButton' : 'addNewSchedule'
    'click #confirmScheduleButton' : 'saveSchedule'

  setEvent: (event_) ->
    @event_ = event_
    @

  render: ->
    @$el.html @template
      event_url: @event_.get "url"
    @_initDatepicker()
    @_initTimepicker()

  addNewSchedule: ->
    new_schedule = new padule.Models.Schedule
      event_id: @event_.id
      start_time: @_getStartTime()
      seeker_schedules: @collection.first().createInitial().toJSON()
    @collection.push new_schedule
    new_schedule.add @event_.id

  saveSchedule: ->
    @

  _getStartTime: ->
    date = @$el.find('#scheduleDatepicker').val()
    time = @$el.find('#scheduleTimepicker').val()
    datetime = date + ' ' + time
    datetime = datetime.replace(/\//g, '-') + ":00"
    datetime

  _initDatepicker: ->
    $("#scheduleDatepicker").datepicker
      format: 'yyyy/mm/dd'

  _initTimepicker: ->
    $('#scheduleTimepicker').timepicker
      minuteStep: 10
      showInputs: false
      showSeconds: false
      defaultTime: false
      showMeridian: false
      modalBackdrop: true
