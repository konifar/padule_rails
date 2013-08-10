class padule.Views.Schedule extends Backbone.View
  el: $ '.schedule-table-container'

  initialize: ->
    _.bindAll @
    @view = new padule.Views.ScheduleTable
      collection: @collection
    @render()

  render: ->
    @$el.html @view.render().el