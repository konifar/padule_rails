class padule.Views.SeekerScheduleControl extends Backbone.View
  el: $ '.control-container'
  events:
    'click #sendSeekerSchedule' : 'sendSeekerSchedule'

  initialize: (options)->
    _.bindAll @
    @schedules = options.schedules

  sendSeekerSchedule: ->
    console.log @model
    console.log @schedules
