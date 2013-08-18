class padule.Views.ScheduleTbodyTr extends Backbone.View
  tagName: 'tr'

  initialize: ->
    _.bindAll @
    @seeker_schedules = @model.seeker_schedules
    @listenTo @seeker_schedules, 'changeEditable', @changeDisabled

  renderOne: (seeker_schedule)->
    view = new padule.Views.ScheduleTd
        model: seeker_schedule
    @$el.append view.render().el

  render: ->
    @renderTh()
    @seeker_schedules.each @renderOne
    @changeDisabled()
    @

  renderTh: ->
    view = new padule.Views.ScheduleTbodyTh
      model: @model
    @$el.append view.render().el

  changeDisabled: ->
    confirms = @seeker_schedules.filter (seeker_schedule)->
      seeker_schedule.types.confirmed is seeker_schedule.get 'type'
    if confirms?.length > 0
      @$el.addClass 'disabled'
    else
      @$el.removeClass 'disabled'

