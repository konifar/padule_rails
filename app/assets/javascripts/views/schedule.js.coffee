class padule.Views.Schedule extends Backbone.View
  el: $ '.schedule-table-container'

  initialize: ->
    _.bindAll @
    @table = new padule.Views.ScheduleTable
      collection: @collection

    @listenTo @collection, 'sync', @render

  render: ->
    @$el.html @table.render().el
