class padule.Collections.SeekerSchedules extends Backbone.Collection
  model: padule.Models.SeekerSchedule
  url: '/seeker_schedules'

  initialize: (models, options)->
    @schedule = options.schedule
    @can_edit = true
