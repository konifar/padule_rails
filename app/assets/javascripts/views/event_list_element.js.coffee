class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/event']

  events:
    'click a' : 'showAlert'

  initialize: (options = {})->
    _.bindAll @
    @parent = options.parent
    @listenTo @model, 'ignore_change', @showSchedule
    @schedules = new padule.Collections.Schedules
      event_: @model
    @modal = options.modal

  render: ->
    @$el.html @template
      event: @model.toJSON()
    @

  showAlert: (e)->
    @schedules.each (schedule)->
      schedule.seeker_schedules.each (seeker_schedule) ->
        console.log schedule.seeker_schedules

    e.preventDefault()
    @modal.show @model

  showSchedule: ->
    @_active()

    new padule.Views.Schedule
      collection: @schedules

    options =
      data:
        event_id: @model.id
    @schedules.fetch options

  _active: ->
    @parent.$el.find('li').removeClass 'active'
    @$el.addClass 'active'