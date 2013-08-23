class padule.Views.ScheduleTable extends Backbone.View
  tagName: 'table'
  className: 'table table-hover table-condensed'

  initialize: ->
    _.bindAll @
    @thead = new padule.Views.ScheduleThead
      collection: @collection
    @tbody = new padule.Views.ScheduleTbody
      collection: @collection

  render: ->
    @$el.append @thead.render().el
    @$el.append @tbody.render().el
    @