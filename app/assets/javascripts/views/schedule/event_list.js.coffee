class padule.Views.EventList extends Backbone.View
  el: $ "#eventList"

  initialize: (options={})->
    _.bindAll @
    @listenTo @collection, 'add', @renderOne

    @schedules = options.schedules
    @modal = new padule.Views.AlertModal
      title: '未保存の修正があります。'
      contents: '保存せずに進みますか？'

    @control = new padule.Views.ScheduleControl
      collection: @schedules

    @renderAll()

  renderOne: (_event)->
    view = new padule.Views.EventListElement
      model: _event
      parent: @
      modal: @modal
      control: @control
      schedules: @schedules
    @$el.append view.render().el

  renderAll: ->
    @collection.each @renderOne