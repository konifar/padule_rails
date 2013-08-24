class padule.Views.Schedule extends Backbone.View
  el: $ '#scheduleContents'

  initialize: ->
    _.bindAll @

    @tableContainer = @$ '.schedule-table-container'
    @controlContainer = @$ '.control-container'
    @buttonContainer = @$ '.button-container'

    @listenTo @collection, 'sync', @_clear
    @listenTo @collection, 'sync', @render
    @collection.fetchByEvent()

  _clear: ->
    @tableContainer.empty()
    @undelegateEvents()

  render: ->
    @table = new padule.Views.ScheduleTable
      collection: @collection
    @tableContainer.html @table.render().el

    @control = new padule.Views.ScheduleControl
      collection: @collection
    @controlContainer.html @control.render().el

    @buttonContainer.show()
