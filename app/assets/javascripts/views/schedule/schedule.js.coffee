class padule.Views.Schedule extends Backbone.View
  el: $ '#scheduleContents'

  initialize: ->
    _.bindAll @

    @tableContainer = @$ '.schedule-table-container'
    @controlContainer = @$ '.control-container'
    @buttonContainer = @$ '.button-container'

    @listenTo @collection, 'sync', @_clear
    @listenTo @collection, 'sync', @render
    @listenTo @collection, 'changeType', @enableConfirmButton

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

    @enableConfirmButton()
    @buttonContainer.show()

    @endLoading()

  startLoading: ->
    @$el.addClass 'loading'

  endLoading: ->
    @$el.removeClass 'loading'

  enableConfirmButton: ->
    has_temp = false
    @collection.each (schedule)=>
      schedule.seeker_schedules.each (seeker_schedule)=>
        if seeker_schedule.isTemp()
          has_temp = true
          return

    if has_temp
      @buttonContainer.find('#confirmButton').removeClass 'disabled'
    else
      @buttonContainer.find('#confirmButton').addClass 'disabled'