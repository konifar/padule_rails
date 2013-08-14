class padule.Views.SeekerScheduleControl extends Backbone.View
  el: $ '.control-container'

  events:
    'click #sendSeekerSchedule' : 'sendSeekerSchedule'

  initialize: (options)->
    _.bindAll @
    @seeker_schedules = options.seeker_schedules

  sendSeekerSchedule: ->
    console.log @model