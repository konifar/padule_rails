class padule.Views.EventListElement extends Backbone.View
  tagName: 'li'
  template: JST['event']

  initialize: ->
    _.bindAll @

  render: ->
    @el.html @template
      event: @model.toJSON()
    @
