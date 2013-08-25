class padule.Views.ScheduleTd extends Backbone.View
  tagName: 'td'
  template: JST['templates/schedule_status']
  events:
    'click .schedule-btn' : 'changeType'

  initialize: ->
    _.bindAll @
    @listenTo @model, 'change:type', @render
    @listenTo @model, 'afterChangeEditable', @changeDisabled

  render: (editable)->
    @$el.html @template
      btn_class_name: @btnAttrs().btn_class_name
      icon_class_name: @btnAttrs().icon_class_name
      text: @btnAttrs().text
    @model.changeEditable()
    @

  changeDisabled: ->
    if @model.editable
      @$('.schedule-btn').removeClass 'disabled'
    else
      @$('.schedule-btn').removeClass('disabled').addClass('disabled')

  changeType: (e)->
    e.preventDefault()
    @model.changeType()

  btnAttrs: ->
    if @model.isConfirmed()
      btn_class_name: 'btn-danger'
      icon_class_name: 'glyphicon-ok'
      text: '確定'
    else if @model.isOK()
      btn_class_name: 'btn-primary'
      icon_class_name: 'glyphicon-thumbs-up'
      text: '◯'
    else if @model.isNG()
      btn_class_name: 'btn-link'
      icon_class_name: 'glyphicon-remove'
      text: '×'
    else if @model.isTemp()
      btn_class_name: 'btn-success'
      icon_class_name: 'glyphicon-ok'
      text: '候補'
    else
      btn_class_name: 'btn-link'
      icon_class_name: 'glyphicon-minus'
      text: 'ー'
