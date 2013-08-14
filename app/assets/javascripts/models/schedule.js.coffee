class padule.Models.Schedule extends Backbone.Model
  urlRoot: '/schedules'
  localStorage: new Store "schedule"

  initialize: ->
    @seeker_schedules = new padule.Collections.SeekerSchedules @get('seeker_schedules'), {schedule: @}

  createInitial: ->
    clone = @clone().seeker_schedules
    clone.each (seeker_schedule) ->
      seeker_schedule.set 'type', -1
    clone

  add: (event_id)->
    options =
      type: 'POST'
      data:
        event_id: event_id
    Backbone.sync 'create', @,  options