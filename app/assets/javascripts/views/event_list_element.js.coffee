class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['templates/event']

  events:
    'click a' : 'showSchedule'

  initialize: (options = {})->
    _.bindAll @
    @schedules = options.schedules
    @parent = options.parent

  render: ->
    @$el.html @template
      event: @model.toJSON()
    @

  showSchedule: (e)->
    e.preventDefault()
    @_active()

    options =
      data:
        event_id: @model.id
      success: (result)=>

    @schedules.fetch options

  _active: ->
    @parent.$el.find('li').removeClass 'active'
    @$el.addClass 'active'