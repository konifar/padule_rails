class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/event']

  events:
    'click a' : 'showAlert'
    'keypress input[type=text]': 'updateOnEnter'

  initialize: (options = {})->
    _.bindAll @
    @parent = options.parent
    @listenTo @model, 'ignore_change', @showSchedule
    @listenTo @model, 'change', @render
    @schedules = options.schedules
    @modal = options.modal

  updateOnEnter: (e)->
    if e.keyCode is 13
      @model.set 'title', @$el.find('input').val()

  render: ->
    if @model.isNew()
      @$el.addClass 'new-event'

    @$el.html @template
      event: @model.toJSON()
    @

  showAlert: (e)->
    e.preventDefault()

    if @_isChanged()
      @modal.show @model
    else
      @showSchedule()

  showSchedule: ->
    @_active()

    @schedules.reset()

    new padule.Views.Schedule
      collection: @schedules

    new padule.Views.ScheduleControl
      collection: @schedules
      event_: @model

    options =
      data:
        event_id: @model.id
    @schedules.fetch options

  _isChanged: ->
    result = false
    @schedules.each (schedule)->
      schedule.seeker_schedules.each (seeker_schedule) ->
        if seeker_schedule.hasChanged('type')
          result = true
    result

  _active: ->
    @parent.$el.find('li').removeClass 'active'
    @$el.addClass 'active'