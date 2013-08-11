class padule.Views.EventAddButton extends Backbone.View
  el: $ "#addEventButton"

  events:
    'click button' : 'addEvent'

  addEvent: ->
    new_event = new padule.Models.Event
    @collection.push new_event
