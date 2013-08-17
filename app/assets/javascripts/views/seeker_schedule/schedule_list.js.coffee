class padule.Views.ScheduleList extends Backbone.View
  el: $ '#seeker-schedule-edit ul'

  initialize: (options)->
    _.bindAll @
    @listenTo @collection, 'add', @renderOne

    options =
      data:
        event_id: options.event_id
    @collection.fetch options

  renderOne: (schedule)->
    view = new padule.Views.ScheduleListElement
      model: schedule
    @$el.append view.render().el

  renderAll: ->
    @collection.each (schedule)->
      @renderOne schedule
