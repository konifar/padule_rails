class padule.Views.EventList extends Backbone.View
  initialize: ->
    _.bindAll @
    @listenTo @collection, 'add', @renderOne
    @renderAll()
    @modal = new padule.Views.AlertModal
      title: '未保存の修正があります。'
      contents: '保存せずに進みますか？'

  renderOne: (event)->
    view = new padule.Views.EventListElement
      model: event
      parent: @
      modal: @modal
    @$el.append view.render().el

  renderAll: ->
    @collection.each @renderOne