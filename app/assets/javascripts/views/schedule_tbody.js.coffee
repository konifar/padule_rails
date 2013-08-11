class padule.Views.ScheduleTbody extends Backbone.View
  tagName: 'tbody'

  initialize: ->
    _.bindAll @
    @listenTo @collection, 'add', @renderOne

  renderOne: (schedule)->
    view = new padule.Views.ScheduleTr
      collection: schedule.seeker_schedules
      is_header: false
    @$el.append view.renderAll().el

  renderAll: ->
    @$el.empty()
    @collection.each @renderOne
    @