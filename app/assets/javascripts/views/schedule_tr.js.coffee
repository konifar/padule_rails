class padule.Views.ScheduleTr extends Backbone.View
  tagName: 'tr'

  initialize: (options = {})->
    _.bindAll @
    @is_header = options.is_header
    @listenTo @collection, 'change:can_edit', @changeCanEdit()

  renderOne: (seeker_schedule)->
    if @is_header
      view = new padule.Views.ScheduleTh
        model: seeker_schedule
        is_header: true
    else
      view = new padule.Views.ScheduleTd
        model: seeker_schedule
    @$el.append view.render().el

  renderAll: ->
    @renderTh()
    @collection.each @renderOne
    @

  renderTh: ->
    if @is_header
      @$el.append('<th></th>')
    else
      if @collection.length
        view = new padule.Views.ScheduleTh
          model: @collection.schedule
          is_header: false
        @$el.append view.render().el

  changeCanEdit: ->
    if @collection.can_edit
      @$el.removeClass 'disabled'
    else
      @$el.addClass 'disabled'