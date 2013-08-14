class padule.Views.ScheduleThead extends Backbone.View
  tagName: 'thead'

  initialize: ->
    _.bindAll @
    @listenTo @collection, 'sync', @render

  render: ->
    view = new padule.Views.ScheduleTr
      collection: @collection.at(0).seeker_schedules
      is_header: true
    @$el.html view.renderAll().el
