class padule.Views.ScheduleTbodyTr extends Backbone.View
  tagName: 'tr'

  initialize: ->
    _.bindAll @
    @seeker_schedules = @model.seeker_schedules

  renderOne: (seeker_schedule)->
    view = new padule.Views.ScheduleTd
        model: seeker_schedule
    @$el.append view.render().el

  render: ->
    @renderTh()
    @seeker_schedules.each @renderOne
    @changeEditable()
    @

  renderTh: ->
    view = new padule.Views.ScheduleTbodyTh
      model: @model
    @$el.append view.render().el

  changeEditable: ->
    if @seeker_schedules.hasConfirmed()
      @$el.addClass 'disabled'
      @seeker_schedules.changeEditable false
    else
      @$el.removeClass 'disabled'
      @seeker_schedules.changeEditable true
