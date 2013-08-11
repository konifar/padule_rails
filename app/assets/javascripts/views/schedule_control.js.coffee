class padule.Views.ScheduleControl extends Backbone.View
  el: $ '.control-container'

  events:
    'click #addScheduleButton' : 'showScheduleModal'
    'click #confirmScheduleButton' : 'confirmSchedule'

  initialize: (options={})->
    @event_ = options.event_
    @$el.find('blockquote p').html("共有URL : " + @event_.get("url"))

  showScheduleModal: ->
    alert "hoge"

  confirmSchedule: ->
    alert "hoge"

  _initDatepicker: ->
    console.log $("#scheduleDatepicker")
    $("#scheduleDatepicker").datepicker
      format: 'yyyy/mm/dd'

  _initTimepicker: ->
    $('#scheduleTimepicker').timepicker
      minuteStep: 10
      showInputs: false
      showSeconds: false
      defaultTime: '10:00'
      showMeridian: false
      modalBackdrop: true
