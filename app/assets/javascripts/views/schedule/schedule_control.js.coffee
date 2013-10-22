class padule.Views.ScheduleControl extends Backbone.View
  template: JST['templates/schedule_control']
  events:
    'click #addScheduleButton' : 'addSchedule'
    'change #scheduleDatepicker' : 'toggleAddButton'
    'change #scheduleTimepicker' : 'toggleAddButton'

  initialize: ->
    _.bindAll @
    @event = @collection.event

  render: ->
    @$el.html @template
      event: @event.toJSON()
    @datepicker = @$('#scheduleDatepicker')
    @timepicker = @$('#scheduleTimepicker')
    @_initDatepicker()
    @_initTimepicker()
    @

  toggleAddButton: =>
    if @_validateDatetime() and @datepicker.val() and @timepicker.val()
      @$('#addScheduleButton').removeClass('disabled')
    else
      @$('#addScheduleButton').addClass('disabled')

  addSchedule: ->
    new_schedule = new padule.Models.Schedule
      event_id: @event.id
      start_time: @_getStartTime()
    @collection.push new_schedule
    new_schedule.saveByEvent
      success: ->
        padule.info_area.render
          text: 'スケジュールを追加しました。'
          class_name: 'label-info'

  _validateDatetime: ->
    date = @datepicker.val()
    unless padule.checkDateFormat date
      padule.info_area.render
        text: '日づけのフォーマットが正しく入力してください。'
        class_name: 'label-danger'
      return false
    else
      return true

  _getStartTime: ->
    date = @datepicker.val()
    time = @timepicker.val()
    datetime = date + ' ' + time
    datetime = datetime.replace(/\//g, '-') + ":00"
    datetime

  _initDatepicker: ->
    @datepicker.datepicker
      format: 'yyyy/mm/dd'

  _initTimepicker: ->
    @timepicker.timepicker
      minuteStep: 10
      showInputs: false
      showSeconds: false
      defaultTime: false
      showMeridian: false
      modalBackdrop: true
