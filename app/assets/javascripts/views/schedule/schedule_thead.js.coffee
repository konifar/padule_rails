class padule.Views.ScheduleThead extends Backbone.View
  tagName: 'thead'

  initialize: ->
    _.bindAll @

  render: ->
    view = new padule.Views.ScheduleTheadTr
      collection: @collection
    @$el.html view.render().el
