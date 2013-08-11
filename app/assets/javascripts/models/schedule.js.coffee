class padule.Models.Schedule extends Backbone.Model
  urlRoot: '/schedules/show'

  initialize: ->
    @seeker_schedules = new padule.Collections.SeekerSchedules @get('seeker_schedules'), {schedule: @}
