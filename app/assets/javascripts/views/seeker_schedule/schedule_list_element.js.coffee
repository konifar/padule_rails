class padule.Views.ScheduleListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/seeker_schedule_status']
  events:
    'click .seeker-schedule-btn' : 'changeType'

  initialize: ->
    _.bindAll @
    @seeker_schedule = new padule.Models.SeekerSchedule
    @listenTo @seeker_schedule, 'change:type', @render
    @model.seeker_schedules.push @seeker_schedule

  changeType: (e)->
    e.preventDefault()
    @seeker_schedule.changeTypeBySeeker()

  render: ->
    @$el.html @template
      start_time: padule.dateformatyyyyMMddWhhmm @model.get('start_time')
      btn_class: @_btnClassName()
      icon_class: @_iconClassName()
    @

  _btnClassName: ->
    if @seeker_schedule.isOK()
      'btn-success'
    else
      'btn-default'

  _iconClassName: ->
    if @seeker_schedule.isOK()
      'glyphicon-ok'
    else
      'glyphicon-remove'