class padule.Views.ScheduleTbodyTr extends Backbone.View
  tagName: 'tr'

  initialize: ->
    _.bindAll @
    @seeker_schedules = @model.seeker_schedules
    @listenTo @seeker_schedules, 'changeEditable', @_changeDisabled

  renderOne: (seeker_schedule)->
    view = new padule.Views.ScheduleTd
        model: seeker_schedule
    @$el.append view.render().el

  render: ->
    @renderTh()
    @seeker_schedules.each @renderOne
    @

  renderTh: ->
    view = new padule.Views.ScheduleTbodyTh
      model: @model
    @$el.append view.render().el

  _changeDisabled: (editable)->
    if editable
      @$el.removeClass 'disabled'
    else
      @$el.addClass 'disabled'

