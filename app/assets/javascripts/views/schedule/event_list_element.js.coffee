class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/event']

  events:
    'click .delete-event-button' : 'deleteEvent'
    'click a' : 'showSchedule'
    'dblclick a' : 'editEvent'
    'keypress input[type=text]': 'updateOnEnter'

  initialize: (options = {})->
    _.bindAll @
    @listenTo @model, 'change', @render
    @listenTo @model, 'unactive', ->
      @$el.removeClass 'active'

  updateOnEnter: (e)->
    if e.keyCode is 13
      @close()

  editEvent: ->
    @$el.addClass 'editing'
    @input.focus()

  close: ->
    value = @input.val()
    if value
      @model.save {title: value}
      @$el.removeClass 'editing'

  render: ->
    @$el.html @template
      event: @model.toJSON()
    @input = @$('.edit')
    if @model.isNew()
      @$el.addClass('editing');
    @

  deleteEvent: (e)->
    e.preventDefault()
    modal = new padule.Views.AlertModal
      title: 'イベントを削除'
      contents: "『#{@model.get 'title'}』を削除してよろしいですか？"
      callback: ->
        console.log "hogehoge"
    modal.show()

  showSchedule: (e)->
    e.preventDefault()
    @model.collection.each (event)->
      event.trigger 'unactive'
    @$el.addClass 'active'

    new padule.Views.Schedule
      collection: new padule.Collections.Schedules false, _event: @model
