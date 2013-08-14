class padule.Views.ScheduleList extends Backbone.View
  el: $ '#seeker-schedule-edit ul'

  initialize: ->
    _.bindAll @

  renderOne: (schedule)->
    view = new padule.Views.ScheduleListElement schedule
    @$el.append view.render().el

  renderAll: ->
    @collection.each (schedule)->
      @renderOne schedule
