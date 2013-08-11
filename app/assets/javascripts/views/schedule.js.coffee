class padule.Views.Schedule extends Backbone.View
  el: $ '.detail-container'
  className: '.schedule-table-container'

  initialize: ->
    _.bindAll @
    @view = new padule.Views.ScheduleTable
      collection: @collection
    @listenTo @collection, 'sync', @render

  render: ->
    @$el.html $('div').addClass('schedule-table-container').html()
    @$el.find('.schedule-table-container').html @view.render().el