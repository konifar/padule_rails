class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/event']

  events:
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
      @_close()

  editEvent: ->
    @$el.addClass 'editing'
    @input.focus()

  _close: ->
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

  showSchedule: (e)->
    e.preventDefault()
    @model.collection.each (event)->
      event.trigger 'unactive'
    @$el.addClass 'active'

    new padule.Views.Schedule
      collection: new padule.Collections.Schedules false, _event: @model
