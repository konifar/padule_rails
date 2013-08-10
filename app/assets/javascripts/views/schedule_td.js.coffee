class padule.Views.ScheduleTd extends Backbone.View
  tagName: 'td'
  template: JST['templates/schedule_status']
  events:
    'click .schedule-btn' : 'changeType'

  initialize: ->
    _.bindAll @
    @listenTo @model, 'change:type', @render
    @listenTo @model.collection, 'change:can_edit', @render
    @render()

  render: ->
    @$el.html @template
      btn_class_name: @btnClassName()
      disabled: @disabled()
      text: @text()
    @

  changeType: (e)->
    e.preventDefault()
    @model.changeType()

  disabled: ->
    if @model.isNG() or not @model.collection.can_edit
      'disabled'
    else
      ''

  btnClassName: ->
    if @model.isConfirmed()
      'btn-success'
    else if @model.isOK()
      'btn-primary'
    else if @model.isNG()
      'btn-default'
    else if @model.isTemp()
      'btn-warning'

  text: ->
    if @model.isConfirmed()
      '確定'
    else if @model.isOK()
      '○'
    else if @model.isNG()
      '×'
    else if @model.isTemp()
      '候補'