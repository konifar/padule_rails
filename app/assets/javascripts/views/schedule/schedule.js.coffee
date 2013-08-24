class padule.Views.Schedule extends Backbone.View
  el: $ '#scheduleContents'

  initialize: ->
    _.bindAll @

    @tableContainer = @$ '.schedule-table-container'
    @controlContainer = @$ '.control-container'
    @buttonContainer = @$ '.button-container'

    @listenTo @collection, 'sync', @_clear
    @listenTo @collection, 'sync', @render

    @clear()
    @startLoading()
    @collection.fetchByEvent()

  clear: ->
    @tableContainer.empty()
    @controlContainer.empty()

  render: ->
    @table = new padule.Views.ScheduleTable
      collection: @collection
    @tableContainer.html @table.render().el

    @control = new padule.Views.ScheduleControl
      collection: @collection
    @controlContainer.html @control.render().el

    @buttonContainer.show()

    @endLoading()

  startLoading: ->
    @$el.addClass 'loading'

  endLoading: ->
    @$el.removeClass 'loading'