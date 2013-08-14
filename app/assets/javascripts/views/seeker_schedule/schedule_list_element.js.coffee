class padule.Views.ScheduleListElement extends Backbone.View
  tagName: 'li'
  template: JST['template/seeker_schedule_status']
  events:
    'click .seeker-schedule-btn' : 'changeType'


  initialize: ->
    _.bindAll @
    @listenTo @, 'change:type', @render

  changeType: (e)->
    e.preventDefault()
    @model.changeTypeBySeeker()

  render: ->
    @$el.html @template
      start_time: padule.dateformatyyyyMMddWhhmm @model.get('start_time')
      btn_class: @_btnClassName()
      icon_class: @_iconClassName()
    @

  _btnClassName: ->
    if @model.isOK()
      'btn-success'
    else
      'btn-default'

  _iconClassName: ->
    if @model.isOK()
      'glyphicon-ok'
    else
      'glyphicon-minus'