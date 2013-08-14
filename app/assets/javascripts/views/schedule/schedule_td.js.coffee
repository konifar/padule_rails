class padule.Views.ScheduleTd extends Backbone.View
  tagName: 'td'
  template: JST['templates/schedule_status']
  events:
    'click .schedule-btn' : 'changeType'

  initialize: ->
    _.bindAll @
    @listenTo @model, 'change:type', @render
    @listenTo @model, 'change:can_edit', @render

  render: ->
    @$el.html @template
      btn_class_name: @btnClassName()
      disabled: @disabled()
      icon_class_name: @iconClassName()
    @

  changeType: (e)->
    e.preventDefault()
    @model.changeType()

  disabled: ->
    unless @model.get 'can_edit'
      'disabled'
    else
      ''

  btnClassName: ->
    if @model.isConfirmed()
      'btn-success'
    else if @model.isOK() and @model.get 'can_edit'
      'btn-primary'
    else if @model.isTemp() and @model.get 'can_edit'
      'btn-warning'
    else if @model.isNG()
      'btn-default'
    else
      'btn-link'

  iconClassName: ->
    if @model.isConfirmed()
      'glyphicon-ok'
    else if @model.isOK()
      'glyphicon-thumbs-up'
    else if @model.isNG()
      'glyphicon-remove'
    else if @model.isTemp()
      'glyphicon-ok'
    else
      'glyphicon-minus'
