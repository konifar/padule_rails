class padule.Views.Schedule extends Backbone.View
  el: $ '.detail-container'

  initialize: ->
    _.bindAll @
    @table = new padule.Views.ScheduleTable
      collection: @collection
    @listenTo @collection, 'sync', @render

  render: ->
    @$el.html $('div').addClass('schedule-table-container').html()
    @$el.find('.schedule-table-container').html @table.render().el