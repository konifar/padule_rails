class padule.Views.ScheduleTbody extends Backbone.View
  tagName: 'tbody'

  initialize: ->
    _.bindAll @
    @listenTo @collection, 'add', @renderOne

  renderOne: (schedule)->
    view = new padule.Views.ScheduleTbodyTr
      model: schedule
    @$el.append view.render().el

  render: ->
    @collection.each @renderOne
    @