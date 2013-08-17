class padule.Views.EventInfo extends Backbone.View
  el: $ '.event-container'

  initialize: ->
    _.bindAll @
    @listenTo @model, 'sync', @render
    @model.fetch()

  render: ->
    @$el.find('legend').html @model.get 'title'
    @$el.find('.text').html @model.get 'text'
